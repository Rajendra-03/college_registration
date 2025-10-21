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

# Build the Spring Boot WAR
RUN ./mvnw clean package -DskipTests -U

# Stage 2: Run
FROM eclipse-temurin:17-jdk

WORKDIR /app

# Copy WAR from build stage
COPY --from=build /app/target/*.war app.war

# Expose port (Render will use $PORT)
EXPOSE 10000

# Run the Spring Boot WAR
CMD ["sh", "-c", "java -jar app.war --server.port=$PORT"]
