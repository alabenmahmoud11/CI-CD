From openjdk:8
copy ./target/achat-2.0-SNAPSHOT.jar achat-2.0-SNAPSHOT.jar
CMD ["java","-jar","achat-2.0-SNAPSHOT.jar"]
