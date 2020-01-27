# Copyright DataStax, Inc, 2017
#   Please review the included LICENSE file for more information.
#

FROM openjdk:8u171-jdk-slim-stretch

MAINTAINER "DataStax, Inc <info@datastax.com>"

ARG VERSION=1.4.1
ARG URL_PREFIX=https://downloads.datastax.com/dsbulk
ARG DSBULK_TARBALL=dsbulk-${VERSION}.tar.gz
ARG DSBULK_DOWNLOAD_URL=${URL_PREFIX}/${DSBULK_TARBALL}

RUN apt-get update && apt-get install wget sysstat locales -y --no-install-recommends && \
	apt-get autoclean && apt-get --purge -y autoremove && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
	# Comment out Assistive Technologies to run the grimlin console from docker exec
         sed -i -e '/^assistive_technologies=/s/^/#/' /etc/java-*-openjdk/accessibility.properties && \
	echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
	# set the locale of the container:
    locale-gen

ENV DSBULK_HOME /dsbulk

# Add dsbulk user
RUN set -x \
    && groupadd -r dsbulk --gid=999 \
    && useradd -m -d "$DSBULK_HOME" -r -g dsbulk --uid=999 dsbulk

RUN set -x \
# Download DSBULK tarball if needed
    && if test ! -e /${DSBULK_TARBALL}; then wget -q -O /${DSBULK_TARBALL} ${DSBULK_DOWNLOAD_URL} ; fi \
# Unpack tarball
    && tar -C "$DSBULK_HOME" --strip-components=1 -xzf /${DSBULK_TARBALL} \
    && rm /${DSBULK_TARBALL} \
    && mkdir -p $DSBULK_HOME/logs $DSBULK_HOME/data \
    && chown -R dsbulk:dsbulk ${DSBULK_HOME}

ENV PATH $DSBULK_HOME/bin:$PATH
ENV HOME $DSBULK_HOME
WORKDIR $HOME

USER dsbulk

# Run 
ENTRYPOINT [ "/dsbulk/bin/dsbulk" ]
