FROM trivadis/apache-spark-base:2.4.4-hadoop2.7

MAINTAINER Guido Schmutz <guido.schmutz@trivadis.com>

ENV ZEPPELIN_VERSION 0.8.2

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        curl \
        git

RUN set -x \
    && curl -fSL "http://www-eu.apache.org/dist/zeppelin/zeppelin-${ZEPPELIN_VERSION}/zeppelin-${ZEPPELIN_VERSION}-bin-all.tgz" -o /tmp/zeppelin.tgz \
    && mkdir -p /opt \
    && tar -xzvf /tmp/zeppelin.tgz -C /opt/ \
    && mv /opt/zeppelin-* /opt/zeppelin \
    && rm /tmp/zeppelin.tgz

# install s3cmd
RUN git clone https://github.com/s3tools/s3cmd.git /tmp/s3cmd \
	&& cd /tmp/s3cmd \
	&& python setup.py install \
	&& rm -rf /tmp/s3cmd

# ENV SPARK_SUBMIT_OPTIONS "--jars /opt/zeppelin/sansa-examples-spark-2018-06.jar"
ENV SPARK_HOME /spark

WORKDIR /opt/zeppelin

CMD ["/opt/zeppelin/bin/zeppelin.sh"]
