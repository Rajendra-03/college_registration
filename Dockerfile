# Stage 1: Build
FROM maven:3.9.3-eclipse-temurin-17 AS build

WORKDIR /app

# Copy pom and Maven wrapper first for caching
COPY pom.xml ./
COPY mvnw ./
COPY .mvn .mvn

# Download dependencies only
RUN ./mvnw dependency:resolve

# Copy the source code
COPY src ./src

# Build the Spring Boot JAR
RUN ./mvnw clean package -DskipTests -U

# Stage 2: Run
FROM eclipse-temurin:17-jdk

WORKDIR /app

# Copy JAR from build stage
COPY --from=build /app/target/*.jar app.jar

# Expose port (Render will use $PORT)
EXPOSE 10000

# Run the Spring Boot app
CMD ["sh", "-c", "java -jar app.jar --server.port=$PORT"]
