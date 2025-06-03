# Use the official NGINX image from Docker Hub
FROM nginx:alpine

# Remove the default nginx index page
RUN rm /usr/share/nginx/html/*

# Copy our custom HTML file to the nginx web directory
COPY index.html /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Start NGINX (default command already defined in base image)
