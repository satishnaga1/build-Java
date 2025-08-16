FROM tomcat:9.0-jdk11
COPY target/sample.war /usr/local/tomcat/webapps/
