FROM tomcat:10.0.0-M7-jdk8-openjdk
ADD App.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]