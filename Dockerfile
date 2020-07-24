FROM tomcat:latest
RUN apt-get update
RUN apt-get install -y maven
ADD App.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]