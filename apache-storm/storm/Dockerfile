FROM trivadisbds/base:ubuntu

MAINTAINER Guido Schmutz (guido.schmutz@trivadis.com) 

ENV STORM_DL_VERSION apache-storm-1.0.1
ENV STORM_DL_MIRROR ftp://mirror.switch.ch/mirror/apache/dist/storm/

RUN wget -q -O - ${STORM_DL_MIRROR}${STORM_DL_VERSION}/$STORM_DL_VERSION.tar.gz | tar -xzf - -C /opt

ENV STORM_HOME /opt/$STORM_DL_VERSION

RUN groupadd storm; useradd --gid storm --home-dir /home/storm --create-home --shell /bin/bash storm; chown -R storm:storm $STORM_HOME; mkdir /var/log/storm ; chown -R storm:storm /var/log/storm

RUN ln -s $STORM_HOME/bin/storm /usr/bin/storm

ADD storm.yaml $STORM_HOME/conf/storm.yaml
ADD cluster.xml $STORM_HOME/logback/cluster.xml
ADD config-supervisord.sh /usr/bin/config-supervisord.sh
ADD start-supervisor.sh /usr/bin/start-supervisor.sh 

RUN echo [supervisord] | tee -a /etc/supervisor/supervisord.conf ; echo nodaemon=true | tee -a /etc/supervisor/supervisord.conf
