# Use a lightweight Alpine Linux base image
FROM alpine:latest

# Install the necessary packages
RUN apk add --no-cache \
    curl \
    jq \
    bash

# Set the working directory inside the container
WORKDIR /app

# Copy the script into the container's working directory
COPY fetcher.sh .

# Make the script executable
RUN chmod +x fetcher.sh

# Set the entry point to run the script
ENTRYPOINT ["./fetcher.sh"]
