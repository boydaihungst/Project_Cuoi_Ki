package Utils;

import java.util.Calendar;
import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author DrAgOn
 */
public class EmailUtils {

    static Properties mailServerProperties;
    static Session getMailSession;
    static MimeMessage generateMailMessage;

    public EmailUtils() {
    }

    public EmailUtils(String to) {
        //this.to = to;
    }

    public static void generateAndSendEmail(String Recipient, String Code) throws AddressException, MessagingException {
        if (Recipient == null || Recipient.isEmpty()) {
            return;
        }
        // Step1
        System.out.println("\n 1st ===> setup Mail Server Properties..");
        mailServerProperties = System.getProperties();
        mailServerProperties.put("mail.smtp.port", "587");
        mailServerProperties.put("mail.smtp.auth", "true");
        mailServerProperties.put("mail.smtp.starttls.enable", "true");
        System.out.println("Mail Server Properties have been setup successfully..");

        // Step2
        System.out.println("\n\n 2nd ===> get Mail Session..");
        getMailSession = Session.getDefaultInstance(mailServerProperties, null);
        generateMailMessage = new MimeMessage(getMailSession);
        generateMailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(Recipient));
        generateMailMessage.setSubject("Nhận mã thay đổi mật khẩu", "utf-8");
        String emailBody = "<html>"
                + "    <head>"
                + "        <meta charset=\"UTF-8\">"
                + "        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">"
                + "    </head>"
                + "    <body>"
                + "        <div>Bạn đã nhận thay đổi mật khẩu vào lúc: " + Calendar.getInstance().getTime().toString() + "<br> Mật khẩu mới của bạn là: " + Code + "</div>"
                + "    </body>"
                + "</html>";
        generateMailMessage.setContent(emailBody, "text/html;charset=utf-8");
        System.out.println("Mail Session has been created successfully..");

        // Step3
        System.out.println("\n\n 3rd ===> Get Session and Send mail");
        Transport transport = getMailSession.getTransport("smtp");

        // Enter your correct gmail UserID and Password
        // if you have 2FA enabled then provide App Specific Password
        transport.connect("smtp.gmail.com", "projectwebbangiay@gmail.com", "Boydaihungst123");
        transport.sendMessage(generateMailMessage, generateMailMessage.getAllRecipients());
        transport.close();
    }
}
