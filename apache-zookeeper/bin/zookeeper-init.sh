#!/usr/bin/env bash

set -eo pipefail

ZK=$1
MYID=1

PUBLIC_ADDRESS=${ZK_PUBLIC_ADDRESS:-`hostname`}

# TODO: use these below
QUORUM_PORT=${ZK_QUORUM_PORT:-2888}
LEADER_PORT=${ZK_LEADER_ELECTION_PORT:-3888}

ZK_PATH=/opt/zookeeper
ZK_DATA=/srv

echo "Using public address: $PUBLIC_ADDRESS"

cd $ZK_PATH
if [ -n "$ZK" ] 
then

 	output=`./bin/zkCli.sh -server $ZK:2181 get /zookeeper/config | grep ^server` 
  
	# extract all the zk-ids from the output
	declare -a id_list=()
	while read x;
	do
		id_list+=(`echo $x | cut -d"=" -f1 | cut -d"." -f2`)
	done <<<$(output)
	sorted_id_list=( $(
		for el in "${id_list[@]}"
		do  
			echo "$el"
		done | sort -n) )
	
	# get the next increasing number from the sequence
	MYID=$((${sorted_id_list[${#sorted_id_list[@]}-1]}+1))

	echo $output >> $ZK_PATH/conf/zoo.cfg.dynamic
	echo "server.$MYID=$PUBLIC_ADDRESS:2888:3888:observer;2181" >> $ZK_PATH/conf/zoo.cfg.dynamic
	echo $MYID > $ZK_DATA/myid

	cp $ZK_PATH/conf/zoo.cfg.dynamic $ZK_PATH/conf/zoo.cfg.dynamic.org
	$ZK_PATH/bin/zkServer-initialize.sh --force --myid=$MYID
	ZOO_LOG_DIR=/var/log ZOO_LOG4J_PROP='INFO,CONSOLE,ROLLINGFILE' $ZK_PATH/bin/zkServer.sh start

	# reconfigure the cluster
	$ZK_PATH/bin/zkCli.sh -server $ZK:2181 reconfig -add "server.$MYID=$PUBLIC_ADDRESS:2888:3888:participant;2181"

	# restart the server
	$ZK_PATH/bin/zkServer.sh stop
	ZOO_LOG_DIR=/var/log ZOO_LOG4J_PROP='INFO,CONSOLE,ROLLINGFILE' $ZK_PATH/bin/zkServer.sh start-foreground

else

	echo "server.$MYID=$PUBLIC_ADDRESS:2888:3888;2181" >> $ZK_PATH/conf/zoo.cfg.dynamic
	echo $MYID > $ZK_DATA/myid

	echo "Initializing ZooKeeper with ID $MYID ..."
	$ZK_PATH/bin/zkServer-initialize.sh --force --myid=$MYID

	echo "Starting ZooKeeper ..."
	ZOO_LOG_DIR=/var/log ZOO_LOG4J_PROP='INFO,CONSOLE,ROLLINGFILE' $ZK_PATH/bin/zkServer.sh start-foreground

fi
