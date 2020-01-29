package nl.makeitwork.Showmaster.mail;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import java.util.Properties;

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
        SimpleMailMessage smm = new SimpleMailMessage();
        smm.setTo("default@example.com");
        smm.setFrom(SENDER_EMAIL);
        smm.setSubject("Default subject");
        smm.setText("Default text");
        return smm;
    }
}