FROM tomcat:latest
RUN apt-get update
RUN apt-get install -y maven
WORKDIR /root
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR /root/boxfuse-sample-java-war-hello
RUN mvn package
WORKDIR /root/boxfuse-sample-java-war-hello/target
RUN cp hello-1.0.war /usr/local/tomcat/webapps/
WORKDIR /usr/local/tomcat/conf
RUN sed '/<\/Host>/i \\t <Context path="" docBase="hello-1.0"> \n\t <\/Context>' server.xml > server1.xml
RUN cat server1.xml > server.xml