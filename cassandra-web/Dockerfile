FROM ruby:2.4.1

RUN apt-get update && apt-get install -y netcat
RUN gem install cassandra-web

ADD wait-for.sh /
ADD entrypoint.sh /

RUN chmod +x /wait-for.sh
RUN chmod +x /entrypoint.sh

EXPOSE 3000

ENTRYPOINT ["/entrypoint.sh"]
