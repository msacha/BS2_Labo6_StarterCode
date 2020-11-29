FROM maven:3.5-jdk-8 as BUILD
RUN mkdir /app
WORKDIR	/app
ADD pom.xml /app
ADD src/ /app
RUN mvn -B dependency:resolve dependency:resolve-plugins
RUN mvn package

FROM tomcat:latest
COPY --from=BUILD /app/target/project-ucll-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/project-ucll-1.0-SNAPSHOT.war

# FROM maven:3.5-jdk-8 as BUILD
# COPY src /usr/src/myapp/src
# COPY pom.xml /usr/src/myapp
# RUN mvn -f /usr/src/myapp/pom.xml clean package

#FROM maven:3-jdk-8 as BUILD
#WORKDIR /home/rafael/docker/starter/
#RUN pwd
#RUN mvn package

#FROM tomcat:7.0
#RUN ls -al
#COPY --from=BUILD /build/sample.war /build/sample.war
#EXPOSE 8080
