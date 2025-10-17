#!/bin/bash

# Pedro's Landing Page - Docker Setup Script

echo "🚀 Setting up Pedro's Landing Page with Docker..."

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "❌ Docker is not installed. Please install Docker first."
    exit 1
fi

# Check if Docker Compose is installed
if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose is not installed. Please install Docker Compose first."
    exit 1
fi

# Create necessary directories
echo "📁 Creating necessary directories..."
mkdir -p ssl
mkdir -p logs

# Set proper permissions
echo "🔐 Setting proper permissions..."
chmod 644 nginx.conf
chmod 644 docker-compose.yml

# Build and start the containers
echo "🐳 Building and starting containers..."
docker-compose up --build -d

# Check if containers are running
if docker-compose ps | grep -q "Up"; then
    echo "✅ Landing page is now running!"
    echo "🌐 Open your browser and go to: http://localhost:8080"
    echo "💡 To stop the containers, run: docker-compose down"
    echo "📊 To view logs, run: docker-compose logs -f"
else
    echo "❌ Failed to start containers. Check the logs with: docker-compose logs"
    exit 1
fi
