FROM mesosphere/mesos:1.3.0
MAINTAINER Guido Schmutz <guido.schmutz@trivadis.com>

ENV MESOS_NATIVE_LIBRARY /usr/local/lib/libmesos.so

ENV SPARK_VERSION 2.2.0-bin-hadoop2.7

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y curl python && \
    curl -s "https://d3kbcqa49mib13.cloudfront.net/spark-${SPARK_VERSION}.tgz" | tar zx -C /opt && \
    mv "/opt/spark-${SPARK_VERSION}" /opt/spark