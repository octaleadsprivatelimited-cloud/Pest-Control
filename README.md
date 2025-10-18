# Pest Control Website Template

A professional, responsive HTML template for pest control businesses. This template features a modern design with multiple pages, interactive elements, and mobile-responsive layout.

## 🚀 Features

- **Responsive Design**: Built with Bootstrap 3.3.2 for mobile-first approach
- **Multiple Pages**: Complete website with all essential pages
- **Modern UI**: Clean, professional design with carousels and animations
- **SEO Optimized**: Proper meta tags and semantic HTML structure
- **Contact Forms**: Quote request and contact forms with validation
- **Interactive Elements**: Image carousels, testimonials slider, and more

## 📁 Project Structure

```
MAINFILE-2/
├── HTML/                    # Main website files
│   ├── index.html          # Homepage
│   ├── about.html          # About page
│   ├── services.html       # Services page
│   ├── contact.html        # Contact page
│   ├── blog.html          # Blog listing
│   ├── team.html          # Team page
│   ├── testimonials.html  # Testimonials
│   ├── faq.html           # FAQ page
│   ├── css/               # Stylesheets
│   ├── js/                # JavaScript files
│   ├── images/            # Images and assets
│   └── php/               # PHP form processing
├── DOCUMENTATION/          # Template documentation
└── ICON/                  # Font icons
```

## 🎨 Pages Included

- **Homepage** (`index.html`) - Hero section, services overview, testimonials
- **About Us** (`about.html`) - Company information and team
- **Services** (`services.html`) - Detailed service listings
- **Pest Control** (`pest-control.html`) - Specialized pest control services
- **Blog** (`blog.html`) - News and articles
- **Contact** (`contact.html`) - Contact form and information
- **Team** (`team.html`) - Staff and team members
- **Testimonials** (`testimonials.html`) - Customer reviews
- **FAQ** (`faq.html`) - Frequently asked questions

## 🛠️ Technologies Used

- **HTML5** - Semantic markup
- **CSS3** - Modern styling with animations
- **Bootstrap 3.3.2** - Responsive framework
- **jQuery** - JavaScript functionality
- **Font Awesome** - Icons
- **Owl Carousel** - Image sliders
- **PHP** - Form processing

## 🚀 Getting Started

1. **Clone the repository**:
   ```bash
   git clone https://github.com/octaleadsprivatelimited-cloud/Pest-Control.git
   ```

2. **Open in browser**:
   - Navigate to the `HTML` folder
   - Open `index.html` in your web browser
   - Or use a local server for best results

3. **Customize**:
   - Edit HTML files to update content
   - Modify CSS in `HTML/css/style.css`
   - Update images in `HTML/images/`
   - Configure contact form in `HTML/php/form-process.php`

## 📧 Contact Form Setup

The contact form now uses a Node.js serverless function for better compatibility with Vercel deployment.

### Environment Variables

Set up the following environment variables in your Vercel dashboard:

```bash
# SMTP Configuration (for Gmail, use these values)
SMTP_HOST=smtp.gmail.com
SMTP_PORT=587
SMTP_USER=your-email@gmail.com
SMTP_PASS=your-app-password

# Contact Email (where form submissions will be sent)
CONTACT_EMAIL=your-contact-email@example.com
```

### Gmail Setup

For Gmail SMTP:
1. Enable 2-factor authentication on your Gmail account
2. Generate an App Password (not your regular password)
3. Use the App Password as `SMTP_PASS`

### Alternative Email Services

You can use other SMTP providers like:
- SendGrid
- Mailgun
- AWS SES
- Any SMTP-compatible service

Just update the SMTP configuration variables accordingly.

## 🎨 Customization

### Colors
Edit the CSS variables in `HTML/css/style.css` to change the color scheme.

### Content
- Update company information in HTML files
- Replace placeholder images with your own
- Modify service descriptions and pricing

### Logo
Replace `HTML/images/logo.png` with your company logo.

## 📱 Responsive Design

The template is fully responsive and works on:
- Desktop computers
- Tablets
- Mobile phones
- All modern browsers

## 🔧 Browser Support

- Chrome (latest)
- Firefox (latest)
- Safari (latest)
- Internet Explorer 9+
- Edge (latest)

## 📄 License

This template is provided as-is for pest control businesses. Please ensure you have the proper licenses for any third-party components used.

## 🤝 Support

For support and customization help, please contact the development team.

## 📞 Contact Information

- **Phone**: +91 12-1-331/82/B
- **Email**: famouspestcontrolservices77@gmail.com
- **Hours**: Mon-Sat: 9.00-18.00

---

**Note**: This is a complete HTML template ready for deployment. Simply upload the `HTML` folder contents to your web server to get started.
