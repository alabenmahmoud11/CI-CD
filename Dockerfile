From openjdk:8
copy ./target/1.0-SNAPSHOT.jar 1.0-SNAPSHOT.jar
CMD ["java","-jar","employee-jdbc-0.0.1-SNAPSHOT.jar"]
