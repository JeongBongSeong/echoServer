FROM eclipse/ubuntu_jdk8


ARG JAR_FILE=/build/distributions/echoServer-0.0.1-SNAPSHOT.zip

USER root

RUN useradd -ms /bin/bash ksign
RUN echo "ksign:iotiot" | chpasswd
RUN adduser ksign sudo

ADD ${JAR_FILE} /home/ksign/echoServer-0.0.1-SNAPSHOT.zip

USER ksign

RUN cd /home/ksign && unzip echoServer-0.0.1-SNAPSHOT.zip && rm echoServer-0.0.1-SNAPSHOT.zip
ENV JAVA_OPTS=""
CMD ["cd /home/ksign/echoServer-0.0.1-SNAPSHOT/bin/","&&","./echoServer" ]
