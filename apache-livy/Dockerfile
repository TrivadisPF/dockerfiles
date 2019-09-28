# select operating system
FROM trivadis/apache-spark-base:2.4.3-hadoop3.1

ENV LIVY_VERSION=0.6.0-incubating

# install operating system packages 
RUN apt-get update -y &&  apt-get install git curl gettext unzip wget software-properties-common dnsutils make -y 

## add more packages, if necessary
# install Java8
#RUN add-apt-repository ppa:webupd8team/java -y && apt-get update && apt-get -y install openjdk-8-jdk-headless

# install boto3 library for PySpark applications to connect to S3
# RUN pip install boto3==1.9


# use bpkg to handle complex bash entrypoints
RUN curl -Lo- "https://raw.githubusercontent.com/bpkg/bpkg/master/setup.sh" | bash
RUN bpkg install cha87de/bashutil -g
## add more bash dependencies, if necessary 

# add config, init and source files 
# entrypoint
ADD init /opt/docker-init
ADD conf /opt/docker-conf

USER root

# folders
RUN mkdir /var/apache-spark-binaries/

# binaries
# apache livy
RUN wget http://mirror.23media.de/apache/incubator/livy/${LIVY_VERSION}/apache-livy-${LIVY_VERSION}-bin.zip -O /tmp/livy.zip
RUN unzip /tmp/livy.zip -d /opt/
RUN mv /opt/apache-livy-${LIVY_VERSION}-bin /opt/apache-livy-bin

# Logging dir
RUN mkdir /opt/apache-livy-bin/logs

ENV SPARK_MASTER_ENDPOINT=spark-master
ENV SPARK_MASTER_PORT=7077
ENV SPARK_MASTER=yarn
ENV SPARK_HOME=/spark
 
# expose ports
EXPOSE 8998

# start from init folder
WORKDIR /opt/docker-init
CMD ["./entrypoint"]