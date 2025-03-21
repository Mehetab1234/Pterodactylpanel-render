# Use Ubuntu as the base image (Debian also works)
FROM ubuntu:22.04

# Set non-interactive mode to prevent install errors
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    shellinabox \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# Expose Shellinabox on port 8080
EXPOSE 8080

# Start Shellinabox on port 8080
CMD ["shellinaboxd", "--no-beep", "-t", "--port=8080", "--disable-ssl"]
