FROM tomcat:latest
RUN apt-get update
RUN apt-get install -y maven
WORKDIR /root
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR boxfuse-sample-java-war-hello
RUN mvn package
WORKDIR target
RUN cp hello-1.0.war /usr/local/tomcat/webapps/
ADD App.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]