FROM nginx

# Create the necessary directories and set permissions
RUN mkdir -p /var/cache/nginx/client_temp && \
    chmod -R 755 /var/cache/nginx && \
    chown -R nginx:nginx /var/cache/nginx

# Copy your static files
COPY index.html /usr/share/nginx/html

# Expose port 8080 (note: nginx defaults to 80; we'll adjust configuration below)
EXPOSE 8080

# Update the nginx configuration to listen on port 8080
RUN sed -i 's/listen       80;/listen       8080;/' /etc/nginx/conf.d/default.conf

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
