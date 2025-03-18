#!/bin/bash

# Get Ruby version from .ruby-version file
RUBY_VERSION=$(tr -d '[:space:]' < .ruby-version)

# Build the Docker image if needed
docker build -t benhowes-site --build-arg RUBY_VERSION=$RUBY_VERSION .

# Run the container
# Mount the current directory to allow live updates
# Forward port to host
# Remove container when stopped
docker run --rm \
    -v "$(pwd):/site" \
    -p 4000:4000 \
    -it \
    benhowes-site
