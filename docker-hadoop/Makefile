DOCKER_NETWORK = docker-hadoop_default
ENV_FILE = hadoop.env
current_branch := 2.0.0-hadoop3.1.1-java8
build:
	docker build -t trivadis/hadoop-base:$(current_branch) ./base
	docker build -t trivadis/hadoop-namenode:$(current_branch) ./namenode
	docker build -t trivadis/hadoop-datanode:$(current_branch) ./datanode
	docker build -t trivadis/hadoop-resourcemanager:$(current_branch) ./resourcemanager
	docker build -t trivadis/hadoop-nodemanager:$(current_branch) ./nodemanager
	docker build -t trivadis/hadoop-historyserver:$(current_branch) ./historyserver
	docker build -t trivadis/hadoop-submit:$(current_branch) ./submit

wordcount:
	docker build -t hadoop-wordcount ./submit
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} bde2020/hadoop-base:$(current_branch) hdfs dfs -mkdir -p /input/
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} bde2020/hadoop-base:$(current_branch) hdfs dfs -copyFromLocal /opt/hadoop-3.1.1/README.txt /input/
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} hadoop-wordcount
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} bde2020/hadoop-base:$(current_branch) hdfs dfs -cat /output/*
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} bde2020/hadoop-base:$(current_branch) hdfs dfs -rm -r /output
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} bde2020/hadoop-base:$(current_branch) hdfs dfs -rm -r /input
