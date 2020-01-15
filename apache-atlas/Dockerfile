FROM maven:3.5.4-jdk-8 AS stage-atlas

ENV ATLAS_VERSION 2.0.0
ENV TARBALL apache-atlas-${ATLAS_VERSION}-sources.tar.gz
ENV	ATLAS_REPO      https://dist.apache.org/repos/dist/release/atlas/${ATLAS_VERSION}/${TARBALL}
ENV	MAVEN_OPTS	"-Xms2g -Xmx2g"


RUN git clone http://github.com/apache/atlas.git \
	&& cd atlas \
	&& mvn clean -DskipTests package -Pdist \
	&& mv distro/target/apache-atlas-*-bin.tar.gz /apache-atlas.tar.gz \
	&& mv distro/target/apache-atlas-*-kafka-hook.tar.gz /apache-atlas-kafka-hook.tar.gz \
	&& mv distro/target/apache-atlas-*-hive-hook.tar.gz /apache-atlas-hive-hook.tar.gz \
	&& mv distro/target/apache-atlas-*-sqoop-hook.tar.gz /apache-atlas-sqoop-hook.tar.gz

FROM centos:7

COPY --from=stage-atlas /apache-atlas.tar.gz /apache-atlas.tar.gz
COPY --from=stage-atlas /apache-atlas-kafka-hook.tar.gz /apache-atlas-kafka-hook.tar.gz
COPY --from=stage-atlas /apache-atlas-hive-hook.tar.gz /apache-atlas-hive-hook.tar.gz
COPY --from=stage-atlas /apache-atlas-sqoop-hook.tar.gz /apache-atlas-sqoop-hook.tar.gz

# install which - GUS 10.5
RUN yum update -y  \
	&& yum install -y python python36 && yum install java-1.8.0-openjdk java-1.8.0-openjdk-devel python net-tools -y \
	&& yum install which -y \
	&& yum clean all 
RUN groupadd hadoop && \
	useradd -m -d /opt/atlas -g hadoop atlas

RUN pip3 install amundsenatlastypes

USER atlas

RUN cd /opt \
	&& tar xzf /apache-atlas.tar.gz -C /opt/atlas --strip-components=1

COPY model /tmp/model
COPY resources/atlas-setup.sh /tmp
COPY resources/credentials /tmp
COPY resources/init_amundsen.py /tmp

COPY resources/atlas-application.properties /opt/atlas/conf/

USER root
ADD resources/entrypoint.sh /entrypoint.sh
RUN rm -rf /apache-atlas.tar.gz

USER atlas

ENTRYPOINT ["sh", "-c", "/entrypoint.sh"]

EXPOSE 21000
