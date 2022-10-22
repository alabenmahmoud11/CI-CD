FROM tomcat:git
COPY target/*.war/usr/local/tomcat/webapps/
