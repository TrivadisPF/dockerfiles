FROM trivadisbds/base
MAINTAINER Guido Schmutz <guido.schmutz@trivadis.com>

ENV ZOOKEEPER_MIRROR ftp://mirror.switch.ch/mirror/apache/dist/zookeeper/
ENV ZOOKEEPER_VERSION zookeeper-3.4.6

RUN yum update && yum install -y wget \
	&& wget -q -O - $ZOOKEEPER_MIRROR/$ZOOKEEPER_VERSION/$ZOOKEEPER_VERSION.tar.gz | tar -xzf - -C /opt \
	&& mv /opt/$ZOOKEEPER_VERSION /opt/zookeeper \
	&& yum remove -y wget \
	&& yum autoremove -y \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /opt/zookeeper
COPY conf/zoo.cfg conf/

COPY bin/zookeeper-init.sh /usr/local/bin/

EXPOSE 2181 2888 3888
VOLUME ["/opt/zookeeper/conf", "/srv"]

ENTRYPOINT ["/usr/bin/env", "bash", "/usr/local/bin/zookeeper-init.sh"]
