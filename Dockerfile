FROM maven:3.8.4-openjdk-8-slim AS build

WORKDIR /app

COPY . .

RUN mvn clean install -DskipTests

FROM openjdk:8-jre-slim

WORKDIR /app

COPY --from=build /app/target/ShowCase-0.0.1-SNAPSHOT.jar /app/ShowCase-0.0.1-SNAPSHOT.jar

CMD ["java", "-jar", "ShowCase-0.0.1-SNAPSHOT.jar"]