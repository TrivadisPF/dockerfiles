FROM trivadis/streamsets-base:3.13.0

# Build time argument to install packages
ARG PACKAGES_TO_INSTALL=streamsets-datacollector-apache-kafka_2_0-lib,streamsets-datacollector-apache-kafka_1_1-lib,streamsets-datacollector-elasticsearch_5-lib,streamsets-datacollector-aws-lib,streamsets-datacollector-groovy_2_4-lib

# Install the packages
RUN if [[ ! -z $PACKAGES_TO_INSTALL ]]; then $SDC_DIST/bin/streamsets stagelibs -install=$PACKAGES_TO_INSTALL ; fi
