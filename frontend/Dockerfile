FROM wunsh/alpine-elm:latest as builder

# Set the working directory
WORKDIR /app

# Copy the Elm files
COPY . .

# Build the Elm app
RUN elm make src/Main.elm --output=elm.js

# Use the official Nginx image to serve the built Elm app
FROM nginx:latest

# Remove the default Nginx configuration
RUN rm -v /etc/nginx/nginx.conf

# Copy the custom Nginx configuration
COPY nginx/nginx.conf /etc/nginx/

# Copy the built Elm app into the Nginx public directory
COPY --from=builder /app/elm.js /usr/share/nginx/html/
COPY --from=builder /app/index.html /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]

