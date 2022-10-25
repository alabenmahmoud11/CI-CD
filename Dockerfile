FROM openjdk
EXPOSE 8089
ADD src/spring.jar spring.jar
ENTRYPOINT ["java","-jar","/spring.jar"]
