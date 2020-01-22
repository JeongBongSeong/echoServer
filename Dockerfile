FROM eclipse/ubuntu_jdk8
ARG JAR_FILE=/build/libs/*.jar
ADD ${JAR_FILE} /home/${JAR_FILE}
ENV JAVA_OPTS=""
CMD ["java","-jar","/home/${JAR_FILE}"]
