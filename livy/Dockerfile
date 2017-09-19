FROM trivadisbds/mesos-spark:2.1.1
MAINTAINER Guido Schmutz <guido.schmutz@trivadis.com>

# packages
RUN apt-get update && apt-get install -yq --no-install-recommends --force-yes \
    unzip 
#    maven \
#    libjansi-java \
#    libsvn1 \
#    libcurl3 \
#    libsasl2-modules && \
#    rm -rf /var/lib/apt/lists/*

# Overall ENV vars
ENV SPARK_VERSION 2.1.1
ENV SPARK_HOME /opt/spark
ENV LIVY_BUILD_VERSION livy-server-0.3.0

# Set install path for Livy
ENV LIVY_APP_PATH /opt/livy

ENV HADOOP_CONF_DIR /opt/livy/conf
ENV LIVY_LOG_DIR /var/log/livy

# Set build path for Livy
ENV LIVY_BUILD_PATH /apps/build/livy

ENV CONF_DIR /opt/livy/conf

# Set native Mesos library path
ENV MESOS_NATIVE_JAVA_LIBRARY /usr/local/lib/libmesos.so
   
ADD url ./
RUN wget `cat url` -O livy.zip && unzip livy.zip && rm livy.zip && mv livy* $LIVY_APP_PATH && mkdir $LIVY_LOG_DIR    

# Add custom files, set permissions
ADD entrypoint.sh .

RUN chmod +x entrypoint.sh

# Expose port
EXPOSE 8998

ENTRYPOINT ["/entrypoint.sh"]
    
