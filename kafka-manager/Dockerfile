# based on docker image by Clement Laforet <sheepkiller@cultdeadsheep.org>

FROM trivadisbds/base:ubuntu

MAINTAINER Guido Schmutz <guido.schmutz@trivadis.com>

RUN apt-get update -y && \
    apt-get install -y git wget unzip && \
    apt-get clean all

# when updating the version, make sure to also update the revision !!!
ENV ZK_HOSTS=localhost:2181 \
    KM_VERSION=2.0.0.2 \
    KM_REVISION=9f82c0fe5a9c74278bd4fce7feecfca538002028 \
    KM_CONFIGFILE="conf/application.conf"

RUN mkdir -p /tmp && \
    cd /tmp && \
    git clone https://github.com/yahoo/kafka-manager && \
    cd /tmp/kafka-manager && \
    git checkout ${KM_REVISION} && \
    echo 'scalacOptions ++= Seq("-Xmax-classfile-name", "200")' >> build.sbt && \
    ./sbt clean dist && \
    unzip  -d / ./target/universal/kafka-manager-${KM_VERSION}.zip && \
    rm -fr /tmp/* /root/.sbt /root/.ivy2

RUN printf '#!/bin/sh\nexec ./bin/kafka-manager -Dconfig.file=${KM_CONFIGFILE} "${KM_ARGS}" "${@}"\n' > /kafka-manager-${KM_VERSION}/km.sh && \
    chmod +x /kafka-manager-${KM_VERSION}/km.sh

WORKDIR /kafka-manager-${KM_VERSION}

EXPOSE 9000
ENTRYPOINT ["./km.sh"]
