# Use the lightweight Alpine base image
FROM alpine:latest

# Set working directory
WORKDIR /app

# Run a simple echo command
CMD ["echo", "Hello World from Alpine!"]