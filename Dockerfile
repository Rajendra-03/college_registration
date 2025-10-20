# Use the official Java 17 JDK as the base image
FROM eclipse-temurin:17-jdk

# Set working directory
WORKDIR /app

# Copy Maven wrapper & project files
COPY . .

# Build the application
RUN ./mvnw clean package -DskipTests

# Expose Render's port (Render will set $PORT)
EXPOSE 10000

# Run the Spring Boot app, binding to Render's dynamic port
CMD ["sh", "-c", "java -jar target/college_registration-0.0.1-SNAPSHOT.jar --server.port=$PORT"]
