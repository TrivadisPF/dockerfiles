FROM trivadisbds/apache-storm:latest
MAINTAINER Markus Mayer <widemeadows@gmail.com>

RUN /usr/bin/config-supervisord.sh ui

EXPOSE 8080
CMD /usr/bin/start-supervisord.sh
