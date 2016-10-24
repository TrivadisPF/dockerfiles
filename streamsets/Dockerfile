FROM streamsets/datacollector:2.1.0.1
MAINTAINER Guido Schmutz <guido.schmutz@trivadis.com>

ARG ADDL_LIBRARIES

RUN sed -i -e 's/run sha1sum --status/run sha1sum -s/g'  ${SDC_DIST}/libexec/_stagelibs

RUN if [ "$ADDL_LIBRARIES" != "" ]; then ${SDC_DIST}/bin/streamsets stagelibs -install=${ADDL_LIBRARIES}; fi

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["dc", "-exec"]