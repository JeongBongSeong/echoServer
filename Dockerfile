FROM eclipse/ubuntu_jdk8
ARG JAR_FILE=/build/libs/*.jar
ARG JARNAME=$(find ./build/libs/*.jar | cut -d - -f 4)
ARG VERSION=$(expr substr ${JARNAME} 1 5)
ADD ${JAR_FILE} /home/echoServer-${VERSION}-SNAPSHOT.jar
ENV JAVA_OPTS=""
CMD ["java","-jar","/home/echoServer-${VERSION}-SNAPSHOT.jar"]
