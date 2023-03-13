#!/bin/bash

# Navigate to the project directory
cd ~/DevOpsCA

# Stop and remove any running Docker containers
docker stop devopsca
docker rm devopsca

# Pull the latest changes from the Git repository
git pull

# Build a new Docker image and tag it with the latest Git commit hash
docker build -t devopsca:latest .

# Run a new Docker container with the updated image
docker run -d --name devopsca -p 80:3000 devopsca:latest