# Stage 1: Build the backend with Maven
FROM maven:3-openjdk-11 AS build-backend

# Set the working directory for the backend
WORKDIR /app/backend

# Copy the pom.xml and source code for the backend
COPY backend/pom.xml ./
COPY backend/src ./src

# Build the backend application
RUN mvn clean package -DskipTests

# Debug: List files in the /app/backend/target directory after build
RUN ls -la /app/backend/target/

# Stage 2: Final image
FROM openjdk:17-jdk-alpine

# Set the working directory for the final image
WORKDIR /app

# Copy the built backend JAR file from the build-backend stage
COPY --from=build-backend /app/backend/target/eschool.jar backend.jar

# Optionally, copy the built frontend files from another stage
# COPY --from=build-frontend /app/frontend/build /app/frontend

# Expose the application port
EXPOSE 8080

# Set environment variables (can be overridden at runtime)
ENV BACKEND_PORT=8080
ENV FRONTEND_BUILD_DIR=/app/frontend/build

# Run the backend application
CMD ["java", "-jar", "backend.jar"]
