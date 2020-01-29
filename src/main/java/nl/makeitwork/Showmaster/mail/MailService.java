package nl.makeitwork.Showmaster.mail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Component;

@Component
public class MailService {

    @Autowired
    private MailSender mailSender;
    @Autowired
    private SimpleMailMessage mailMessage;

    public void verstuurMail(String emailAdres, String onderwerp, String bericht){
        SimpleMailMessage msg = new SimpleMailMessage(mailMessage);
        msg.setTo(emailAdres);
        msg.setSubject(onderwerp);
        msg.setText(bericht);
        mailSender.send(msg);
    }
}