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

    public void sendMail(){
        System.out.println("sending mail");
        SimpleMailMessage msg = new SimpleMailMessage(mailMessage);
        msg.setTo("pieter_dijkema@hotmail.com");
        msg.setSubject("test subject");
        msg.setText("spring email integration test");
        mailSender.send(msg);
        System.out.println("done");
    }
}