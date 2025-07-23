# Use Eclipse Temurin JDK base image
FROM eclipse-temurin:17-jdk-jammy

# Set the working directory
WORKDIR /app

# Copy built JAR file into container
COPY target/springboot-demo-1.0.0.jar app.jar

# Expose the port Spring Boot runs on
EXPOSE 8081

# Run the Spring Boot app
ENTRYPOINT ["java", "-jar", "app.jar"]