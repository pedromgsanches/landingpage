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
├── index.html          # Main HTML file
├── styles.css          # CSS styles and responsive design
├── script.js           # JavaScript functionality
├── README.md           # This file
└── .gitignore          # Git ignore file
```

## 🛠️ Setup Instructions

### Prerequisites
- A web browser (Chrome, Firefox, Safari, Edge)
- A text editor (VS Code, Sublime Text, etc.)
- Git (for version control)

### Installation

1. **Clone or Download**
   ```bash
   git clone <your-repository-url>
   cd pedro-landing-page
   ```

2. **Open in Browser**
   - Simply open `index.html` in your web browser
   - Or use a local server for better development experience:
   ```bash
   # Using Python
   python -m http.server 8000
   
   # Using Node.js (if you have http-server installed)
   npx http-server
   
   # Using PHP
   php -S localhost:8000
   ```

3. **Customize Your Content**
   - Edit `index.html` to update your personal information
   - Replace placeholder links with your actual WordPress blog and LinkedIn URLs
   - Modify colors and styling in `styles.css` if desired

## 🎨 Customization

### Updating Links
In `index.html`, find and replace these placeholder links:

```html
<!-- WordPress Blog Link -->
<a href="#" class="blog-link" target="_blank">
    Visit My Blog <i class="fas fa-external-link-alt"></i>
</a>

<!-- LinkedIn Profile Link -->
<a href="#" class="contact-link" target="_blank">
    Connect on LinkedIn <i class="fas fa-external-link-alt"></i>
</a>
```

Replace `href="#"` with your actual URLs.

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

## 🚀 Deployment

### GitHub Pages
1. Push your code to a GitHub repository
2. Go to repository Settings > Pages
3. Select source branch (usually `main`)
4. Your site will be available at `https://yourusername.github.io/repository-name`

### Other Hosting Options
- **Netlify**: Drag and drop deployment
- **Vercel**: Connect your GitHub repository
- **Firebase Hosting**: Google's hosting platform
- **Traditional Web Hosting**: Upload files via FTP

## 📝 License

This project is open source and available under the [MIT License](LICENSE).

## 🤝 Contributing

Feel free to fork this project and customize it for your own use. If you make improvements that could benefit others, pull requests are welcome!

## 📞 Support

If you have any questions or need help customizing this landing page, feel free to reach out through the contact form on the website or create an issue in the repository.

---

**Made with ❤️ for Pedro's personal brand**
