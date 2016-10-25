#StreamSets Data Collector

You must accept the [Oracle Binary Code License Agreement for Java SE](http://www.oracle.com/technetwork/java/javase/terms/license/index.html) to use this image.

This docker image extends StreamSets version of [dockerized StreamSets Data Collector (SDC)](https://hub.docker.com/r/streamsets/datacollector/). It supports adding additional stage libraries either at build time or at run time. If you want to use the build time support, then of course you can not use this image on DockerHub, but have to built the image by yourself. 
You can find more information about the usage on my blog [here](https://guidoschmutz.wordpress.com/2016/10/25/additional-stage-libraries-with-dockerized-streamsets/).

Basic Usage
-----------
```
docker run -p 18630:18630 -d 
           --name sdc 
           -e ADD_LIBS="streamsets-datacollector-apache-kafka_0_10-lib,streamsets-datacollector-apache-kudu-0_9-lib"     
           trivadisbds/streamsets-datacollector:latest`
```
Detailed Usage
--------------
*   You can pass the stage libraries through the environment variable ADD_LIBS

The following example starts SDC with Kafka v0.10 and Kudu 0.9 libraries installed:

```
docker run -p 18630:18630 -d 
           --name sdc 
           -e ADD_LIBS="streamsets-datacollector-apache-kafka_0_10-lib,streamsets-datacollector-apache-kudu-0_9-lib"     
           trivadisbds/streamsets-datacollector:latest`
```

Building your own version
-------------------------

If you want to build your own dockerized SDC images containing a specific configuration of stage libraries, you can pass the necessary libraries to install into the image using the ADD_LIBS build time variable:

```
docker build
     --build-arg ADD_LIBS="streamsets-datacollector-apache-kafka_0_10-lib,streamsets-datacollector-apache-kudu-0_9-lib" 
     -t trivadisbds/streamsets-datacollector-kafka-kudu:2.1.0.1 .
```

