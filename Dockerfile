FROM openjdk
EXPOSE 8080
ADD target/achat-1.0-sk.jar achat-1.0-sk.jar
ENTRYPOINT ["java","-jar","/achat-1.0-sk.jar"]
