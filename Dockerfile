# Use a standard JDK 21 image that supports multiple architectures (including ARM64/Apple Silicon)
FROM eclipse-temurin:21-jdk

# Set the working directory
WORKDIR /app

# Copy the Maven wrapper and pom.xml
COPY .mvn/ .mvn
COPY mvnw pom.xml ./

# Convert mvnw line endings (Windows to Unix) using sed, and make executable
# This avoids needing to install dos2unix
RUN sed -i 's/\r$//' mvnw && chmod +x mvnw

# Download dependencies (this layer will be cached if pom.xml doesn't change)
RUN ./mvnw dependency:go-offline

# Copy the source code
COPY src ./src

# Build the application
RUN ./mvnw package -DskipTests

# Expose the port the app runs on
EXPOSE 8080

# Run the jar file
CMD ["java", "-jar", "target/SoulSync-0.0.1-SNAPSHOT.jar"]