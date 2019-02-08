FROM bde2020/spark-base:2.3.2-hadoop2.7
MAINTAINER Guido Schmutz <guido.schmutz@trivadis.com>

ENV APACHE_SPARK_VERSION 2.3.2
ENV APACHE_HADOOP_VERSION 2.7.0
ENV ZEPPELIN_VERSION 0.8.0

RUN set -x \
    && curl -fSL "http://www-eu.apache.org/dist/zeppelin/zeppelin-${ZEPPELIN_VERSION}/zeppelin-${ZEPPELIN_VERSION}-bin-all.tgz" -o /tmp/zeppelin.tgz \
    && tar -xzvf /tmp/zeppelin.tgz -C /opt/ \
    && mv /opt/zeppelin-* /opt/zeppelin \
    && rm /tmp/zeppelin.tgz

# ENV SPARK_SUBMIT_OPTIONS "--jars /opt/zeppelin/sansa-examples-spark-2018-06.jar"

ENV SPARK_HOME /spark

WORKDIR /opt/zeppelin

CMD ["/opt/zeppelin/bin/zeppelin.sh"]
