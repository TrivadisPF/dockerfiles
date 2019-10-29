FROM trivadis/datacollector-base:3.11.0

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

# Build time argument to install packages
ARG PACKAGES_TO_INSTALL=streamsets-datacollector-apache-kafka_2_0-lib,streamsets-datacollector-apache-kafka_1_1-lib,streamsets-datacollector-hdp_3_1-lib,streamsets-datacollector-aws-lib,streamsets-datacollector-azure-lib,streamsets-datacollector-groovy_2_4-lib,streamsets-datacollector-jdbc-lib

# Install the packages
RUN if [[ ! -z $PACKAGES_TO_INSTALL ]]; then $SDC_DIST/bin/streamsets stagelibs -install=$PACKAGES_TO_INSTALL ; fi
