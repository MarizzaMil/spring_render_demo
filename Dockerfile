# Use Render's recommended base image for Java applications
FROM render-examples/java:17

# Set the working directory in the Docker image
WORKDIR /app

# Copy the JAR file from your project to the /app directory in the Docker image
COPY target/demo-0.0.1-SNAPSHOT.jar demo.jar

# Expose the port your application listens on (if needed)
# Render usually exposes your app on a specific port automatically
# EXPOSE 8080

# Start the application when the container starts (CMD instead of ENTRYPOINT)
CMD ["java", "-jar", "demo.jar"]
