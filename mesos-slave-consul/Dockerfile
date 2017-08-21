FROM trivadisbds/mesos-slave:1.3.0
MAINTAINER Trivadis <guido.schmutz@trivadis.com>

# get dependencies
RUN apt-get update -q
RUN apt-get upgrade -qy
RUN apt-get install -qy build-essential supervisor unzip

# prepare folders
RUN mkdir -p /opt/consul/conf && mkdir -p /opt/consul/logs && mkdir -p /opt/consul/data
WORKDIR /opt/consul

# get consul
ADD https://releases.hashicorp.com/consul/0.9.2/consul_0.9.2_linux_amd64.zip?_ga=2.209490898.1576537608.1503263862-2019794058.1502351647 /tmp/consul.zip
RUN cd /bin && unzip /tmp/consul.zip && chmod +x /bin/consul && rm /tmp/consul.zip

# configure consul
ADD /supervisord-consul.conf /etc/supervisor/conf.d/supervisord-consul.conf
#ADD /50-defaults.json /opt/consul/conf/50-defaults.json

# Cleanup test
RUN apt-get -qq clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Expose volume for additional serf config in JSON
VOLUME /opt/consul/conf
VOLUME /opt/consul/logs
VOLUME /opt/consul/data

ENV CONSUL_OPTS ""

ENTRYPOINT ["mesos-slave"]