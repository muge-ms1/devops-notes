# Use Nginx as base image
FROM nginx:alpine

# Copy index.html to Nginx's default folder
COPY index.html /usr/share/nginx/html/index.html
