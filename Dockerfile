# Use a stable Debian release
FROM debian:bookworm

# Set non-interactive mode to prevent install errors
ENV DEBIAN_FRONTEND=noninteractive

# Fix missing repositories
RUN sed -i 's|http://deb.debian.org|http://ftp.debian.org|g' /etc/apt/sources.list \
    && apt-get clean \
    && apt-get update && apt-get install -y --no-install-recommends \
    curl sudo nano netcat iputils-ping \
    && rm -rf /var/lib/apt/lists/*

# Expose a port for testing
EXPOSE 8080

# Keep the container running
CMD ["tail", "-f", "/dev/null"]
