# Use PHP + Apache as the base image
FROM php:8.1-apache

# Install dependencies
RUN apt update && apt install -y unzip curl git mysql-client

# Download & install Pterodactyl Panel
WORKDIR /var/www/html
RUN curl -Lo panel.tar.gz https://github.com/pterodactyl/panel/releases/latest/download/panel.tar.gz \
    && tar -xzvf panel.tar.gz --strip-components=1 \
    && rm panel.tar.gz

# Set file permissions
RUN chmod -R 755 storage bootstrap/cache

# Expose the web server port
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]
