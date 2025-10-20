# Stage 1: Build
FROM eclipse-temurin:17-jdk AS build

WORKDIR /app

# Copy Maven wrapper and project files
COPY ./mvnw .
COPY .mvn .mvn
COPY pom.xml .
COPY src ./src

# Make Maven wrapper executable
RUN chmod +x ./mvnw

# Build the Spring Boot app
RUN ./mvnw clean package -DskipTests -U


# Stage 2: Run
FROM eclipse-temurin:17-jdk

WORKDIR /app

# Copy the JAR from build stage dynamically
COPY --from=build /app/target/*.jar ./app.jar

# Expose Render port
EXPOSE 10000

# Run the application
CMD ["sh", "-c", "java -jar app.jar --server.port=$PORT"]
