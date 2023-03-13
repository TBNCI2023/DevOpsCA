#!/bin/bash

# Replace with your actual application name
APP_NAME="SimpleApplication"

# Stop the application if it's already running
if [ -f /var/run/${APP_NAME}.pid ]; then
    kill -TERM `cat /var/run/${APP_NAME}.pid` || true
fi

# Remove previous build artifacts
rm -rf /var/www/${APP_NAME}

# Clone the latest version of the code from Git
git clone https://github.com/DevOpsCA/SimpleApplication.git /var/www/${APP_NAME}

# Change to the repository directory
cd /var/www/${APP_NAME}

# Install any required dependencies
npm install

# Build the application
npm run build

# Start the application
npm start &
echo $! > /var/run/${APP_NAME}.pid