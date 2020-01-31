FROM tomcat:latest
ARG WAR_FILE=/build/libs/echoServer-0.0.1-SNAPSHOT.war
ADD ${WAR_FILE} /usr/local/tomcat/lib/
EXPOSE 8080
