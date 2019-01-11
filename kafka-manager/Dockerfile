# based on docker image by Clement Laforet <sheepkiller@cultdeadsheep.org>

FROM trivadisbds/base:ubuntu

MAINTAINER Guido Schmutz <guido.schmutz@trivadis.com>

RUN apt-get update -y && \
    apt-get install -y git wget unzip && \
    apt-get clean all

ENV ZK_HOSTS=localhost:2181 \
    KM_VERSION=1.3.3.22 \
    KM_REVISION=0356db5f2698c36ec676b947c786b8543086dd49 \
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
