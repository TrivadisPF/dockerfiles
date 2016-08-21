FROM trivadisbds/base:ubuntu

MAINTAINER Guido Schmutz <guido.schmutz@trivadis.com>

# Add DSE group and user
RUN groupadd -r dse  \
    && useradd -r -g dse  dse

# Get the version of DSE we're installing from the build argument
ARG DSE_OPSCENTER_VERSION
ENV DSE_OPSCENTER_VERSION ${DSE_OPSCENTER_VERSION}

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get -y install adduser \
    curl \
    lsb-base \
    procps \
    zlib1g \
    gzip \
    python \
    python-support \
    ntp bash tree && \
    rm -rf /var/lib/apt/lists/*

ADD opscenter-${DSE_OPSCENTER_VERSION}.tar.gz /opt

RUN ln -s /opt/ops* /opt/opscenter

RUN echo "[labs]\norbited_longpoll = true" >> /opt/opscenter/conf/opscenterd.conf

EXPOSE 8888 50031 61620

ENTRYPOINT ["/opt/opscenter/bin/opscenter"]

CMD ["-f"]