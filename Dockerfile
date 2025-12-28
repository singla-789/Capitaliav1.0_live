FROM eclipse-temurin:21-jre
WORKDIR /app
COPY target/Capitalia-0.0.1-SNAPSHOT.jar Capitalia-v1.0.jar
EXPOSE 9090
ENTRYPOINT  ["java","-jar","Capitalia-v1.0.jar"]
