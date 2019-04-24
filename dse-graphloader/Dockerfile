FROM trivadisbds/base:ubuntu
MAINTAINER Guido Schmutz <guido.schmutz@trivadis.com>

# Add DSE group and user
RUN groupadd -r dse  \
    && useradd -r -g dse  dse

# Get the version of DSE we're installing from the build argument
#ARG DSE_GRAPHLOADER_VERSION
#ENV DSE_GRAPHLOADER_VERSION ${DSE_GRAPHLOADER_VERSION}
ENV DSE_GRAPHLOADER_VERSION 6.7.3

# Add DSE (we're assuming it's available in the same directory as this Dockerfile)
#  download a tarball from S3 bucket
RUN wget https://s3.eu-central-1.amazonaws.com/gschmutz-download/dse-graph-loader-${DSE_GRAPHLOADER_VERSION}-bin.tar.gz -O dse-graph-loader-${DSE_GRAPHLOADER_VERSION}-bin.tar.gz
RUN tar -xzvf dse-graph-loader-${DSE_GRAPHLOADER_VERSION}-bin.tar.gz

# Link dse regardless of version to /opt/dse
RUN ln -s /dse-graph-loader* /dse-graph-loader \
    && chown -R dse:dse /dse-graph-loader*

