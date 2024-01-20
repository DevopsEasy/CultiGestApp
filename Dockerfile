FROM maven:3.9.0-eclipse-temurin-17 as build
WORKDIR /app
COPY . .
RUN mvn clean install

FROM tomcat:8-jdk8
WORKDIR /app
COPY --from=build /app/target/AgriGestApp-0.0.1-SNAPSHOT.war /app/
EXPOSE 8080
CMD ["catalina.sh", "run"]
