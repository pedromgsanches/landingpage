# Pedro's Personal Landing Page

A modern, responsive landing page showcasing Pedro's personal profile, WordPress blog, and LinkedIn profile.

## 🚀 Features

- **Modern Design**: Clean, professional layout with gradient backgrounds and smooth animations
- **Responsive**: Fully responsive design that works on desktop, tablet, and mobile devices
- **Interactive Elements**: Smooth scrolling, hover effects, and animated transitions
- **Contact Form**: Functional contact form with validation
- **Mobile Navigation**: Hamburger menu for mobile devices
- **Performance Optimized**: Debounced scroll events and efficient animations

## 📁 Project Structure

```
├── index.html              # Main HTML file
├── styles.css              # CSS styles and responsive design
├── script.js               # JavaScript functionality
├── photo.jpg               # Profile photo
├── docker-compose.yml      # Docker Compose configuration
├── docker-compose.prod.yml # Production Docker Compose
├── Dockerfile              # Custom Docker image
├── nginx.conf              # Nginx configuration
├── start.sh                # Startup script
├── README.md               # This file
├── LICENSE                 # MIT License
└── .gitignore              # Git ignore file
```

## 🛠️ Setup Instructions

### Prerequisites
- A web browser (Chrome, Firefox, Safari, Edge)
- A text editor (VS Code, Sublime Text, etc.)
- Git (for version control)
- Docker and Docker Compose (for containerized deployment)

### Quick Start with Docker (Recommended)

1. **Clone or Download**
   ```bash
   git clone <your-repository-url>
   cd pedro-landing-page
   ```

2. **Run with Docker Compose**
   ```bash
   # Make the startup script executable (Linux/Mac)
   chmod +x start.sh
   
   # Run the startup script
   ./start.sh
   
   # Or run directly with Docker Compose
   docker-compose up --build -d
   ```

3. **Access Your Landing Page**
   - Open your browser and go to: `http://localhost:8080`
   - The page will be served by Nginx with optimized performance

### Alternative Setup Methods

#### Method 1: Simple File Opening
- Simply open `index.html` in your web browser
- Note: Some features may not work due to CORS restrictions

#### Method 2: Local Development Server
```bash
# Using Python
python -m http.server 8000

# Using Node.js (if you have http-server installed)
npx http-server

# Using PHP
php -S localhost:8000
```

#### Method 3: Production Deployment
```bash
# For production with SSL and monitoring
docker-compose -f docker-compose.prod.yml up --build -d
```

### Docker Commands

```bash
# Start the application
docker-compose up -d

# Stop the application
docker-compose down

# View logs
docker-compose logs -f

# Rebuild and restart
docker-compose up --build -d

# Check container status
docker-compose ps
```

## 🎨 Customization

### Updating Links
The landing page is already configured with your actual links:

- **WordPress Blog**: [https://cenasdopedro.wordpress.com/](https://cenasdopedro.wordpress.com/)
- **LinkedIn Profile**: [https://www.linkedin.com/in/pedro-sanches-75790813/](https://www.linkedin.com/in/pedro-sanches-75790813/)

If you need to update these links, edit the `href` attributes in `index.html`.

### Changing Colors
In `styles.css`, you can customize the color scheme by modifying these CSS variables:

```css
/* Primary colors */
--primary-blue: #2563eb;
--primary-yellow: #fbbf24;
--gradient-start: #667eea;
--gradient-end: #764ba2;
```

### Adding Your Photo
Replace the Font Awesome user icon with your actual photo:

```html
<div class="profile-avatar">
    <img src="path/to/your/photo.jpg" alt="Pedro" style="width: 100%; height: 100%; border-radius: 50%; object-fit: cover;">
</div>
```

## 📱 Responsive Design

The landing page is fully responsive and includes:
- Mobile-first design approach
- Hamburger navigation for mobile devices
- Flexible grid layouts
- Optimized typography for different screen sizes
- Touch-friendly interactive elements

## 🔧 Technical Details

### Technologies Used
- **HTML5**: Semantic markup
- **CSS3**: Modern styling with Flexbox and Grid
- **JavaScript (ES6+)**: Interactive functionality
- **Font Awesome**: Icons
- **Google Fonts**: Inter font family

### Browser Support
- Chrome 60+
- Firefox 60+
- Safari 12+
- Edge 79+

### Performance Features
- Debounced scroll events
- Intersection Observer for animations
- Optimized CSS with efficient selectors
- Minimal JavaScript footprint
- Nginx with Gzip compression
- Static asset caching
- Security headers
- Health check endpoints

## 🐳 Docker Configuration

### Files Overview
- **`docker-compose.yml`**: Development configuration with volume mounts
- **`docker-compose.prod.yml`**: Production configuration with SSL and monitoring
- **`Dockerfile`**: Custom Nginx image with security optimizations
- **`nginx.conf`**: Optimized Nginx configuration with caching and security
- **`start.sh`**: Automated setup script

### Features
- **Security**: Non-root user, security headers, minimal attack surface
- **Performance**: Gzip compression, static asset caching, optimized settings
- **Monitoring**: Health checks, logging, optional Prometheus integration
- **SSL Ready**: Production configuration supports SSL certificates
- **Scalable**: Easy to deploy across multiple environments

### Environment Variables
```bash
# Optional environment variables
NGINX_ENVSUBST_TEMPLATE_DIR=/etc/nginx/templates
NGINX_ENVSUBST_OUTPUT_DIR=/etc/nginx/conf.d
```

## 🚀 Deployment

### Docker Deployment (Recommended)

#### Local Development
```bash
# Start the application locally
docker-compose up -d
# Access at http://localhost:8080
```

#### Production Deployment
```bash
# Deploy with production configuration
docker-compose -f docker-compose.prod.yml up -d
# Includes SSL, monitoring, and optimized settings
```

#### Cloud Deployment Options
- **Docker Hub**: Push your image and deploy anywhere
- **AWS ECS/Fargate**: Serverless container deployment
- **Google Cloud Run**: Managed container platform
- **Azure Container Instances**: Simple container hosting
- **DigitalOcean App Platform**: Easy container deployment

### Traditional Deployment

#### GitHub Pages
1. Push your code to a GitHub repository
2. Go to repository Settings > Pages
3. Select source branch (usually `main`)
4. Your site will be available at `https://yourusername.github.io/repository-name`

#### Other Hosting Options
- **Netlify**: Drag and drop deployment
- **Vercel**: Connect your GitHub repository
- **Firebase Hosting**: Google's hosting platform
- **Traditional Web Hosting**: Upload files via FTP

### Docker Image Building
```bash
# Build custom image
docker build -t pedro-landing-page .

# Run the image
docker run -p 8080:80 pedro-landing-page

# Push to registry
docker tag pedro-landing-page your-registry/pedro-landing-page
docker push your-registry/pedro-landing-page
```

## 📝 License

This project is open source and available under the [MIT License](LICENSE).

## 🤝 Contributing

Feel free to fork this project and customize it for your own use. If you make improvements that could benefit others, pull requests are welcome!

## 📞 Support

If you have any questions or need help customizing this landing page, feel free to reach out through the contact form on the website or create an issue in the repository.

---

**Made with ❤️ for Pedro's personal brand**
