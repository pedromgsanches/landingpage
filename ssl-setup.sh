#!/bin/bash

# Complete SSL Setup Script for Pedro's Landing Page
# Domain: landingpedro.duckdns.org

echo "🔐 SSL Setup for landingpedro.duckdns.org"
echo "=========================================="

# Check if running as root
if [ "$EUID" -eq 0 ]; then
    echo "❌ Please don't run this script as root"
    exit 1
fi

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

# Check if domain is accessible
echo "🌐 Checking domain accessibility..."
if curl -s --connect-timeout 10 "http://landingpedro.duckdns.org" > /dev/null; then
    echo "✅ Domain is accessible"
else
    echo "⚠️  Domain might not be accessible yet. Make sure:"
    echo "   1. landingpedro.duckdns.org points to this server's IP"
    echo "   2. Ports 80 and 443 are open"
    echo "   3. Firewall allows HTTP/HTTPS traffic"
    read -p "Continue anyway? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

# Update email in docker-compose.yml
echo "📧 Please update the email address in docker-compose.yml"
echo "   Current: pedro@landingpedro.duckdns.org"
echo "   Replace with your actual email address"

# Initial certificate generation
echo "🔑 Generating initial SSL certificate..."
echo "This may take a few minutes..."

# Run certbot to get initial certificate
docker-compose run --rm certbot

# Check if certificate was generated successfully
if [ -f "certbot/conf/live/landingpedro.duckdns.org/fullchain.pem" ]; then
    echo "✅ SSL certificate generated successfully!"
    
    # Start the web server with SSL
    echo "🚀 Starting web server with SSL..."
    docker-compose up -d web
    
    # Wait a moment for nginx to start
    sleep 5
    
    # Test HTTPS connection
    echo "🧪 Testing HTTPS connection..."
    if curl -s --connect-timeout 10 "https://landingpedro.duckdns.org" > /dev/null; then
        echo "✅ HTTPS is working!"
        echo "🌐 Your site is now available at: https://landingpedro.duckdns.org"
    else
        echo "⚠️  HTTPS test failed. Check nginx logs: docker-compose logs web"
    fi
    
    # Set up automatic renewal
    echo "🔄 Setting up automatic certificate renewal..."
    
    # Create renewal script
    cat > renew-ssl.sh << 'EOF'
#!/bin/bash
echo "🔄 Renewing SSL certificates..."
docker-compose run --rm certbot renew
docker-compose exec web nginx -s reload
echo "✅ Certificate renewal completed!"
EOF
    
    chmod +x renew-ssl.sh
    
    # Add to crontab (runs every Monday at 2 AM)
    (crontab -l 2>/dev/null; echo "0 2 * * 1 cd $(pwd) && ./renew-ssl.sh") | crontab -
    
    echo "✅ Automatic renewal scheduled!"
    echo "📅 Certificates will be renewed every Monday at 2 AM"
    
else
    echo "❌ SSL certificate generation failed!"
    echo "🔍 Check the logs: docker-compose logs certbot"
    echo ""
    echo "Common issues:"
    echo "1. Domain not pointing to this server"
    echo "2. Ports 80/443 not accessible"
    echo "3. Email address needs to be updated"
    echo "4. Rate limiting from Let's Encrypt"
    exit 1
fi

echo ""
echo "🎉 SSL Setup Complete!"
echo "======================"
echo "🌐 Site URL: https://landingpedro.duckdns.org"
echo "📧 Update email in docker-compose.yml if needed"
echo "🔄 Automatic renewal: Every Monday at 2 AM"
echo "📊 Check renewal: ./renew-ssl.sh"
echo "📝 View logs: docker-compose logs -f"
