# ================= BUILD STAGE =================
FROM maven:3.9.6-eclipse-temurin-21 AS build
WORKDIR /build

COPY pom.xml .
RUN mvn -B dependency:go-offline

COPY src ./src
RUN mvn clean package -DskipTests

# ================= RUNTIME STAGE =================
FROM eclipse-temurin:21-jre
WORKDIR /app

COPY --from=build /build/target/*SNAPSHOT.jar app.jar

EXPOSE 9090
ENTRYPOINT ["java","-jar","app.jar"]
