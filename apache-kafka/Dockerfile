# based on work of wurstmeiser: https://github.com/wurstmeister/kafka-docker
FROM trivadisbds/base

MAINTAINER Guido Schmutz <guido.schmutz@trivadis.com>

RUN yum update -y; yum install -y unzip wget curl docker jq coreutils

ENV SCALA_VERSION 2.11 
ENV KAFKA_VERSION 0.9.0.1

# Install Kafka, Zookeeper and other needed things 
RUN wget -q http://apache.mirrors.spacedump.net/kafka/"$KAFKA_VERSION"/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz -O /tmp/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz && \
    tar xfz /tmp/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz -C /opt && \
    rm /tmp/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz

VOLUME ["/kafka"]
ENV KAFKA_HOME /opt/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION" 

ADD start-kafka.sh /usr/bin/start-kafka.sh
ADD broker-list.sh /usr/bin/broker-list.sh
ADD create-topics.sh /usr/bin/create-topics.sh

 # Use "exec" form so that it runs as PID 1 (useful for graceful shutdown) 
 CMD ["start-kafka.sh"]