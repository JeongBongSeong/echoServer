FROM eclipse/ubuntu_jdk8
ARG JAR_FILE=/build/libs/EchoServer-0.0.1-SNAPSHOT.jar
ADD ${JAR_FILE} /home/EchoServer-0.0.1-SNAPSHOT.jar
ENV JAVA_OPTS=""
CMD ["java","-jar","/home/EchoServer-0.0.1-SNAPSHOT.jar"]
