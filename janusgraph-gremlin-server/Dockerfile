FROM openjdk:8u131-jdk

ENV JG_VERSION 0.2.0

LABEL version ${JG_VERSION}
LABEL description "JanusGraph v${JG_VERSION}"

LABEL maintainer "Guido Schmutz <guido.schmutz@trivadis.com>"

COPY signatures/KEYS .
COPY signatures/janusgraph-${JG_VERSION}-hadoop2.zip.asc .
RUN curl -fsSLO https://github.com/JanusGraph/janusgraph/releases/download/v${JG_VERSION}/janusgraph-${JG_VERSION}-hadoop2.zip && \
  gpg --import KEYS && \
  rm -f KEYS && \
  gpg --verify janusgraph-${JG_VERSION}-hadoop2.zip.asc && \
  rm -f janusgraph-${JG_VERSION}-hadoop2.zip.asc && \
  unzip janusgraph-${JG_VERSION}-hadoop2.zip && \
  rm janusgraph-${JG_VERSION}-hadoop2.zip

WORKDIR janusgraph-${JG_VERSION}-hadoop2
ENTRYPOINT ["bin/gremlin-server.sh"]
