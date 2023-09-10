#
# Build stage
#
FROM maven:3.8.2-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

#
# Package stage
#
FROM openjdk:17-jre-slim
WORKDIR /app
COPY --from=build /app/target/demo-0.0.1-SNAPSHOT.jar demo.jar
# ENV PORT=8080
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "demo.jar"]
