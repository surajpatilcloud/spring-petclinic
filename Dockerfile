FROM maven:3.9-eclipse-temurin-17 AS build
COPY . /APP
WORKDIR /APP
#RUN mvn clean package -Dcheckstyle.skip

FROM eclipse-temurin:21-jre-alpine AS runtime
COPY --from=build /APP/target/*.jar devops/dev.jar
WORKDIR /devops
EXPOSE 8083
CMD ["java" , "-jar" , "dev.jar"]
