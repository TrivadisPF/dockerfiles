FROM trivadisbds/base:ubuntu
MAINTAINER Guido Schmutz <guido.schmutz@trivadis.com>

# Add DSE group and user
RUN groupadd -r dse  \
    && useradd -r -g dse  dse

# Get the version of DSE we're installing from the build argument
#ARG DSE_GRAPHLOADER_VERSION
#ENV DSE_GRAPHLOADER_VERSION ${DSE_GRAPHLOADER_VERSION}
ENV DSE_GRAPHLOADER_VERSION 5.1.4

# Add DSE (we're assuming it's available in the same directory as this Dockerfile)
# Hint: Use the download.sh script in the build directory to download a tarball
ADD dse-graph-loader-${DSE_GRAPHLOADER_VERSION}-bin.tar.gz /opt

# Link dse regardless of version to /opt/dse
RUN ln -s /opt/dse-graph-loader* /opt/dse-graph-loader \
    && chown -R dse:dse /opt/dse-graph-loader*

