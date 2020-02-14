package nl.makeitwork.Showmaster.mail;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;

import java.util.Properties;

/**
 * @author Pieter Dijkema
 */

@ComponentScan
@Configuration
public class MailServiceConfiguratie {
    private static final String SENDER_EMAIL = "showmasterplanner@gmail.com";

    @Bean
    public MailSender mailSender() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        mailSender.setJavaMailProperties(props);

        mailSender.setUsername(SENDER_EMAIL);
        mailSender.setPassword("miwShowmaster2020!");
        mailSender.setHost("smtp.gmail.com");
        mailSender.setPort(587);
        return mailSender;
    }

    @Bean
    public SimpleMailMessage defaultMessage() {
        SimpleMailMessage defaultBericht = new SimpleMailMessage();
        defaultBericht.setTo("default@example.com");
        defaultBericht.setFrom(SENDER_EMAIL);
        defaultBericht.setSubject("Default subject");
        defaultBericht.setText("Default text");
        return defaultBericht;
    }
}