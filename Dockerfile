FROM ubuntu:latest

RUN apt update && apt install wget curl -y
RUN apt install openjdk-8-jdk -y
ARG user=jenkins
ARG group=jenkins
ARG uid=1000
ARG gid=1000
ARG http_port=8080
ARG agent_port=5000
ENV JENKINS_HOME /var/jenkins_home
RUN groupadd -g ${gid} ${group} \
    && useradd -d "$JENKINS_HOME" -u ${uid} -g${gid} -m -s /bin/bash ${user}
RUN wget https://get.jenkins.io/war-stable/2.332.2/jenkins.war
CMD java -jar jenkins.war
