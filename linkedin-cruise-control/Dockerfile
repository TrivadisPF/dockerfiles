FROM openjdk:8-jdk

ARG commit=7715160bb3e832f7e9d1e2c2c89634b6cd64fb6c

RUN cd /home && git clone https://github.com/linkedin/cruise-control.git && cd cruise-control && git checkout ${commit}
WORKDIR /home/cruise-control

VOLUME ["./config","./logs"]

RUN ./gradlew jar copyDependantLibs
EXPOSE 9090
ENTRYPOINT [ "./kafka-cruise-control-start.sh" ]
CMD ["config/cruisecontrol.properties"]