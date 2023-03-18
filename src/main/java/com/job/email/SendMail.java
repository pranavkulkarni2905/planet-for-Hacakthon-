package com.job.email;
import java.security.SecureRandom;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class SendMail {
	public static String generateRandomPassword()
    {
		int len=10;
        // ASCII range – alphanumeric (0-9, a-z, A-Z)
        final String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
 
        SecureRandom random = new SecureRandom();
        StringBuilder sb = new StringBuilder();
 
        // each iteration of the loop randomly chooses a character from the given
        // ASCII range and appends it to the `StringBuilder` instance
 
        for (int i = 0; i < len; i++)
        {
            int randomIndex = random.nextInt(chars.length());
            sb.append(chars.charAt(randomIndex));
        }
 
        return sb.toString();
    }
	public static String generateOTP()
	{
		int otpLength=6;
		Random random=new Random();

		StringBuilder sb=new StringBuilder();

		for(int i=0 ; i< otpLength ; i++)
		{
			sb.append(random.nextInt(10));
		}

		String otp=sb.toString();

		return otp;
	}
	public int sendEmail(String toEmail,String messg,String subject)
	{
		String result;
		int i=0;
		// Get recipient's email-ID, message & subject-line from index.html page

		//final String to = request.getParameter("mail");

		

		

		// Sender's email ID and password needs to be mentioned

		final String from = "erp.system1010@gmail.com";

		final String pass = "vvtnvgsoofootytl";//Erp@2022

		// Defining the gmail host

		String host = "smtp.gmail.com";

		// Creating Properties object

		Properties props = new Properties();

		// Defining properties

		props.put("mail.smtp.host", host);

		props.put("mail.transport.protocol", "smtp");

		props.put("mail.smtp.auth", "true");

		props.put("mail.smtp.starttls.enable", "true");

		props.put("mail.user", from);

		props.put("mail.password", pass);

		props.put("mail.port", "443");

		// Authorized the Session object.

		Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {

			@Override

			protected PasswordAuthentication getPasswordAuthentication() {

				return new PasswordAuthentication(from, pass);

			}

		});

		try {

			// Create a default MimeMessage object.

			MimeMessage message = new MimeMessage(mailSession);

			// Set From: header field of the header.

			message.setFrom(new InternetAddress(from));

			// Set To: header field of the header.

			message.addRecipient(Message.RecipientType.TO,

					new InternetAddress(toEmail));

			// Set Subject: header field

			message.setSubject(subject);

			// Now set the actual message

			message.setText(messg);
			//message.setContent(messg,"text/html" ); 
			// Send message

			Transport.send(message);

			result = "Your mail sent successfully....";
			

		} catch (MessagingException mex) {

			mex.printStackTrace();

			result = "Error: unable to send mail....";
			i=1;
		}
		return i;
	}
}
