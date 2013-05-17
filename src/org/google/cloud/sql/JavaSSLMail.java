package org.google.cloud.sql;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class JavaSSLMail {
	public String SendMessage(String To,String Subject,String Body) throws UnsupportedEncodingException
	{
		String Status=null;
		Properties props = new Properties();
        Session session = Session.getDefaultInstance(props, null);

        
        try {
            Message msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress("virtuallabgroup2@gmail.com", "Virtual Lab Administration"));
            msg.addRecipient(Message.RecipientType.TO,
                             new InternetAddress(To));
            msg.setSubject(Subject);
            msg.setText(Body);
            Transport.send(msg);
            Status="1";
        }
 
		 catch (Exception e) {
			Status=e.getMessage();
		}
		return Status;
	}
}
