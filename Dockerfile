FROM eclipse/ubuntu_jdk8
ARG JAR_FILE=/build/distributions/echoServer-0.0.1-SNAPSHOT.zip
ADD ${JAR_FILE} /home/echoServer-0.0.1-SNAPSHOT.zip
RUN cd /home && unzip echoServer-0.0.1-SNAPSHOT.zip && rm echoServer-0.0.1-SNAPSHOT.zip
ENV JAVA_OPTS=""
CMD ["cd","/home/echoServer-0.0.1-SNAPSHOT/bin/","&&","./echoServer" ]
