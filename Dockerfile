FROM maven:3.6.1-jdk-8-alpine as builder

RUN apk update && apk add git 

WORKDIR /tmp

RUN git clone https://github.com/skmdab/java-web-app-docker.git \
    && cd java-web-app-docker \
    && mvn clean package

FROM tomcat:8-jdk8-corretto

COPY --from=builder /tmp/java-web-app-docker/target/java-web-app-docker*.war /usr/local/tomcat/webapps/

EXPOSE 8080
