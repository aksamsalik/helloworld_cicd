#!/bin/bash

echo "Starting deployment..."
cd /home/ubuntu/app

# Restore dependencies
dotnet restore

# Build the application
dotnet build

# Stop any running instance of the app
pkill -f "dotnet"

# Start the application
nohup dotnet run --urls "http://*:5000" > /home/ubuntu/app/log.txt 2>&1 &

echo "Deployment completed!"
