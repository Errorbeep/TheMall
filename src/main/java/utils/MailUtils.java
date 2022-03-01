package utils;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.security.GeneralSecurityException;
import java.util.Properties;

public class MailUtils {

    public static void sendMail(String email,String emailInfo)
            throws AddressException, MessagingException, GeneralSecurityException {
        Properties prop=new Properties();
        prop.put("mail.host","smtp.126.com" );
        prop.put("mail.transport.protocol", "smtp");
        prop.put("mail.smtp.auth", true);
        Session session=Session.getInstance(prop);
        session.setDebug(true);

        
        Transport ts=session.getTransport();
        ts.connect("xxxx@xxx", "xxxxx");

        Message msg=createSimpleMail(session,email,emailInfo);
        ts.sendMessage(msg, msg.getAllRecipients());
    }
    private static Message createSimpleMail(Session session, String email, String emailInfo) throws AddressException, MessagingException {
        MimeMessage mm=new MimeMessage(session);
        mm.setFrom(new InternetAddress("xxx@xxx"));
        mm.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
        mm.setSubject("测试邮件");
        mm.setContent(emailInfo, "text/html;charset=gbk");
        return mm;
    }
}

