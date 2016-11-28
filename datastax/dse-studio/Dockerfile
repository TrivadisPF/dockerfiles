FROM trivadisbds/base:ubuntu
MAINTAINER Guido Schmutz <guido.schmutz@trivadis.com>

# Add DSE group and user
RUN groupadd -r dse  \
    && useradd -r -g dse  dse

# Get the version of DSE we're installing from the build argument
ARG DSE_STUDIO_VERSION
ENV DSE_STUDIO_VERSION ${DSE_STUDIO_VERSION}

# Add DSE (we're assuming it's available in the same directory as this Dockerfile)
# Hint: Use the download.sh script in the build directory to download a tarball
ADD datastax-studio-${DSE_STUDIO_VERSION}.tar.gz /opt

# Link dse regardless of version to /opt/dse
RUN ln -s /opt/datastax-studio* /opt/datastax-studio \
    && chown -R dse:dse /opt/datastax-studio*

# Expose ports:
# Studio

EXPOSE 9091

RUN sed -i '/httpBindAddress/c\\ httpBindAddress:\ 0.0.0.0' /opt/datastax-studio/conf/configuration.yaml

CMD /opt/datastax-studio-${DSE_STUDIO_VERSION}/bin/server.sh
