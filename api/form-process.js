import nodemailer from 'nodemailer';
export const config = { runtime: 'nodejs20.x' };

export default async function handler(req, res) {
  // Only allow POST requests
  if (req.method !== 'POST') {
    return res.status(405).json({ error: 'Method not allowed' });
  }

  // Simple body parsing for Vercel
  const { name, email, message } = req.body || {};

  // Validate required fields
  if (!name || !email || !message) {
    return res.status(400).json({ 
      error: 'Missing required fields. Name, email, and message are required.' 
    });
  }

  // Email validation
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  if (!emailRegex.test(email)) {
    return res.status(400).json({ 
      error: 'Invalid email format' 
    });
  }

  try {
    // Create transporter (configure with your email service)
    const transporter = nodemailer.createTransport({
      host: process.env.SMTP_HOST || 'smtp.gmail.com',
      port: process.env.SMTP_PORT || 587,
      secure: false,
      auth: {
        user: process.env.SMTP_USER,
        pass: process.env.SMTP_PASS
      }
    });

    // Email content
    const mailOptions = {
      from: email,
      to: process.env.CONTACT_EMAIL || 'emailaddress@test.com',
      subject: 'New Message Received',
      text: `Name: ${name}\nEmail: ${email}\nMessage: ${message}`,
      html: `
        <h3>New Contact Form Submission</h3>
        <p><strong>Name:</strong> ${name}</p>
        <p><strong>Email:</strong> ${email}</p>
        <p><strong>Message:</strong></p>
        <p>${message.replace(/\n/g, '<br>')}</p>
      `
    };

    // Send email
    await transporter.sendMail(mailOptions);
    
    return res.status(200).json({ 
      success: true, 
      message: 'Message sent successfully!' 
    });

  } catch (error) {
    console.error('Error sending email:', error);
    return res.status(500).json({ 
      error: 'Failed to send message. Please try again later.' 
    });
  }
}
