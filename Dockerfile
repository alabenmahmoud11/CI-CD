FROM openjdk:11-jdk-alpine
EXPOSE 8082
ADD /target/achat-1.0  achat-1.0
ENTRYPOINT ["java","-jar","achat-1.0"]
