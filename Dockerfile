# Use the official Nginx image from the Docker Hub
FROM nginx:alpine

# Install apache2-utils for htpasswd
RUN apk add --no-cache apache2-utils

# Create a directory for the static files
RUN mkdir -p /usr/share/nginx/html

# Copy the static HTML file to the Nginx directory
COPY index.html /usr/share/nginx/html

# Copy the custom Nginx configuration file
COPY ./docker/nginx.conf /etc/nginx/nginx.conf

# Copy the startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expose port 80
EXPOSE 80

# Start Nginx using the startup script
CMD ["/start.sh"]