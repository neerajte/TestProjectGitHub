FROM tomcat:latest
MAINTAINER Neeraj <neeraj.itjobs@gmail.com>
EXPOSE 8080
COPY target/maven-web-app.war /usr/local/tomcat/webapps/maven-web-app.war
