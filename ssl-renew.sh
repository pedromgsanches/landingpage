#!/bin/bash

# SSL Certificate Auto-Renewal Script for Pedro's Landing Page
# This script handles automatic SSL certificate renewal using Let's Encrypt

echo "🔐 SSL Certificate Auto-Renewal Setup for landingpedro.duckdns.org"

# Create necessary directories
echo "📁 Creating SSL directories..."
mkdir -p certbot/conf
mkdir -p certbot/www
mkdir -p ssl

# Set proper permissions
echo "🔐 Setting permissions..."
chmod 755 certbot/conf
chmod 755 certbot/www
chmod 755 ssl

# Function to renew certificates
renew_certificates() {
    echo "🔄 Renewing SSL certificates..."
    
    # Stop nginx temporarily
    docker-compose stop web
    
    # Run certbot renewal
    docker-compose run --rm certbot renew
    
    # Reload nginx configuration
    docker-compose up -d web
    
    echo "✅ Certificate renewal completed!"
}

# Function to check certificate expiry
check_certificate_expiry() {
    echo "📅 Checking certificate expiry..."
    
    if [ -f "certbot/conf/live/landingpedro.duckdns.org/fullchain.pem" ]; then
        expiry_date=$(openssl x509 -enddate -noout -in certbot/conf/live/landingpedro.duckdns.org/fullchain.pem | cut -d= -f2)
        expiry_timestamp=$(date -d "$expiry_date" +%s)
        current_timestamp=$(date +%s)
        days_until_expiry=$(( (expiry_timestamp - current_timestamp) / 86400 ))
        
        echo "📊 Certificate expires in $days_until_expiry days"
        
        if [ $days_until_expiry -lt 30 ]; then
            echo "⚠️  Certificate expires soon! Renewing..."
            renew_certificates
        else
            echo "✅ Certificate is still valid"
        fi
    else
        echo "❌ No certificate found. Please run initial setup first."
    fi
}

# Main script logic
case "$1" in
    "setup")
        echo "🚀 Initial SSL setup..."
        echo "📧 Please update the email address in docker-compose.yml"
        echo "🌐 Make sure landingpedro.duckdns.org points to this server's IP"
        echo "🔧 Run: docker-compose up -d"
        ;;
    "renew")
        renew_certificates
        ;;
    "check")
        check_certificate_expiry
        ;;
    "auto-renew")
        echo "🔄 Setting up automatic renewal..."
        
        # Create cron job for automatic renewal (runs every Monday at 2 AM)
        (crontab -l 2>/dev/null; echo "0 2 * * 1 cd $(pwd) && ./ssl-renew.sh renew") | crontab -
        
        echo "✅ Automatic renewal scheduled!"
        echo "📅 Certificates will be checked and renewed every Monday at 2 AM"
        ;;
    *)
        echo "Usage: $0 {setup|renew|check|auto-renew}"
        echo ""
        echo "Commands:"
        echo "  setup      - Initial SSL setup instructions"
        echo "  renew      - Manually renew certificates"
        echo "  check      - Check certificate expiry"
        echo "  auto-renew - Set up automatic renewal via cron"
        exit 1
        ;;
esac
