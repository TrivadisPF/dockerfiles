FROM nimmis/java:oracle-8-jdk

MAINTAINER Guido Schmutz <guido.schmutz@trivadis.com>

RUN apt-get update; apt-get install -y unzip wget supervisor docker.io openssh-server
RUN mkdir /var/run/sshd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config