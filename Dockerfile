# Base image
FROM httpd:latest

# Copy custom index.html to the server root
COPY index.html /usr/local/apache2/htdocs/

# Expose port 80
EXPOSE 3000
