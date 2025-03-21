# Use Debian as the base image
FROM debian:latest

# Set non-interactive mode (prevents errors)
ENV DEBIAN_FRONTEND=noninteractive

# Update and install basic utilities
RUN apt-get update && apt-get install -y curl sudo nano netcat \
    && rm -rf /var/lib/apt/lists/*

# Expose port 8080 (or any other required port)
EXPOSE 8080

# Start a simple web server (to keep the service running)
CMD ["nc", "-lk", "-p", "8080"]
