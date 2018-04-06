FROM streamsets/datacollector:3.1.3.0

# Build time argument to install packages
ARG PACKAGES_TO_INSTALL=streamsets-datacollector-apache-kafka_1_0-lib,streamsets-datacollector-apache-kafka_0_11-lib,streamsets-datacollector-hdp_2_5-lib,streamsets-datacollector-aws-lib,streamsets-datacollector-azure-lib,streamsets-datacollector-groovy_2_4-lib

# Install the packages
RUN if [[ ! -z $PACKAGES_TO_INSTALL ]]; then $SDC_DIST/bin/streamsets stagelibs -install=$PACKAGES_TO_INSTALL ; fi
