FROM trivadis/spark-base:2.4.3-hadoop3.1
MAINTAINER Guido Schmutz <guido.schmutz@trivadis.com>

#ENV APACHE_SPARK_VERSION 2.4.3
#ENV APACHE_HADOOP_VERSION 3.1.0
ENV ZEPPELIN_VERSION 0.8.1
		
RUN set -x \
    && curl -fSL "http://www-eu.apache.org/dist/zeppelin/zeppelin-${ZEPPELIN_VERSION}/zeppelin-${ZEPPELIN_VERSION}-bin-all.tgz" -o /tmp/zeppelin.tgz \
    && mkdir -p /opt \
    && tar -xzvf /tmp/zeppelin.tgz -C /opt/ \
    && mv /opt/zeppelin-* /opt/zeppelin \
    && rm /tmp/zeppelin.tgz

# ENV SPARK_SUBMIT_OPTIONS "--jars /opt/zeppelin/sansa-examples-spark-2018-06.jar"

ENV SPARK_HOME /spark

WORKDIR /opt/zeppelin

CMD ["/opt/zeppelin/bin/zeppelin.sh"]
