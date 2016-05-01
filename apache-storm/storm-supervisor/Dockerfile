FROM trivadisbds/apache-storm:latest
MAINTAINER Guido Schmutz <guido.schmutz@trivadis.com>

EXPOSE 6700 6701 6702 6703 8000

RUN /usr/bin/config-supervisord.sh supervisor
RUN /usr/bin/config-supervisord.sh logviewer
CMD /usr/bin/start-supervisord.sh
