# Use Debian as the base image
FROM debian:latest

# Set non-interactive mode to avoid prompts
ENV DEBIAN_FRONTEND=noninteractive

# Fix missing package sources and install required packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl sudo nano netcat iputils-ping \
    && rm -rf /var/lib/apt/lists/*

# Expose a port for testing (e.g., 8080)
EXPOSE 8080

# Keep the container running
CMD ["tail", "-f", "/dev/null"]
