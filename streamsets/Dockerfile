FROM streamsets/datacollector:2.1.0.1
MAINTAINER Guido Schmutz <guido.schmutz@trivadis.com>

# build time variable to pass the necessary stage libraries to isntall
ARG ADD_LIBS

# have to switch to user root, otherwise the SED command does not work in all environments
USER root

# we have to fix the stagelibs command to run on Alpine Linux (the orginal StreamSets docker image is based on)
RUN sed -i -e 's/run sha1sum --status/run sha1sum -s/g'  ${SDC_DIST}/libexec/_stagelibs

# install the necessary stagelibraries if the ADD_LIBS variable is used
RUN if [ "$ADD_LIBS" != "" ]; then ${SDC_DIST}/bin/streamsets stagelibs -install=${ADD_LIBS}; fi

# switch back to SDC_USER and copy the extended version of docker-entrypoint.sh into the image
USER ${SDC_USER}
COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["dc", "-exec"]
