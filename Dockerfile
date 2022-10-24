FROM openjdk
EXPOSE 8082
ADD target/achatt-1.0-sk.jar achatt-1.0-sk.jar
ENTRYPOINT ["java","-jar","/achatt-1.0-sk.jar"]
