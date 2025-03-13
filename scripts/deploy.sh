#!/bin/bash

echo "Starting deployment..."

# Stop any running instance of the app
pkill -f "dotnet" || true

# Start the application from the output directory
cd /home/ubuntu/app/output
nohup dotnet helloworld_cicd.dll --urls "http://*:5000" > /home/ubuntu/app/log.txt 2>&1 &

echo "Deployment completed!"