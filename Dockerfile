# Use Debian as the base image
FROM debian:latest

# Install necessary packages
RUN apt-get update && apt-get install -y curl sudo nano

# Start a shell-like loop
CMD ["bash", "-c", "echo 'Debian Shell Running on Render!'; tail -f /dev/null"]
