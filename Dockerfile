FROM eclipse/ubuntu_jdk8
ARG JAR_FILE=/build/libs/echoServer-0.0.1-SNAPSHOT.jar
ADD ${JAR_FILE} /home/echoServer-0.0.1-SNAPSHOT.jar
ENV JAVA_OPTS=""
CMD ["java","-jar","/home/echoServer-0.0.1-SNAPSHOT.jar"]
