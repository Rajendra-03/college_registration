# Stage 1: Build
FROM eclipse-temurin:17-jdk AS build

WORKDIR /app

# Copy only the Maven wrapper and project files
COPY ./mvnw .
COPY .mvn .mvn
COPY pom.xml .
COPY src ./src

# Build the Spring Boot application
RUN ./mvnw clean package -DskipTests

# Stage 2: Run
FROM eclipse-temurin:17-jdk

WORKDIR /app

# Copy the built JAR from the build stage dynamically
# This uses a wildcard so it works even if the version changes
COPY --from=build /app/target/*.jar ./app.jar

# Expose Render port
EXPOSE 10000

# Run the application
CMD ["sh", "-c", "java -jar app.jar --server.port=$PORT"]
