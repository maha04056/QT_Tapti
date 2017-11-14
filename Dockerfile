FROM tomcat:7.0.82-jre8
MAINTAINER qt-Tapti
COPY target/QTtapti-1.0.war      /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
