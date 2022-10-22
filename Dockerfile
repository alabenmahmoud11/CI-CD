FROM jenkins-pipeline:3-alpine

COPY pom.xml pipeline/

COPY src/ pipeline/src/

WORKDIR pipeline/

RUN mvn clean install

EXPOSE 80

ENTRYPOINT [ "java", "-jar", "/pipeline/target/jenkins-pipeline.jar"]
