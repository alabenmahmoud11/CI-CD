FROM openjdk
EXPOSE 8089
ADD target/jenkins-pipeline.jar jenkins-pipeline.jar
ENTRYPOINT ["java","-jar","/jenkins-pipeline.jar"]
