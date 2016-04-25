#!/bin/sh
docker run --rm -it \
	--link zookeeper \
	--link storm-nimbus \
	-e "NIMBUS_ADDRESS=storm-nimbus" \
	-e "NIMBUS_THRIFT_PORT=49627" \
	-e "DRPC_PORT=49772" \
	-e "DPRCI_PORT=49773" \
	-e "ZOOKEEPER_ADDRESS=zookeeper" \
	-e "ZOOKEEPER_PORT=2181" \
	-v `pwd`:/srv \
	trivadisbds/storm \
	/bin/bash -c '/usr/bin/configure-storm.sh ; bash'
