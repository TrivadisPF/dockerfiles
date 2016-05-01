FROM trivadisbds/apache-storm:latest
MAINTAINER Guido Schmutz <guido.schmutz@trivadis.com>

RUN /usr/bin/config-supervisord.sh nimbus 
RUN /usr/bin/config-supervisord.sh drpc

EXPOSE 3772 3773 6627 

CMD /usr/bin/start-supervisord.sh
