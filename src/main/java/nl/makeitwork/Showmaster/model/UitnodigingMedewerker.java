package nl.makeitwork.Showmaster.model;

import org.springframework.data.repository.cdi.Eager;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;

import javax.persistence.*;

@Entity
public class UitnodigingMedewerker {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer uitnodigingId;
    private String emailadres;
    private String bericht;

    @Transient
    private MailSender mailSender;

    @Transient
    private SimpleMailMessage simpleMailMessage;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(nullable = false, name = "verificatieTokenId")
    private VerificatieToken verificatieToken;

    public VerificatieToken getVerificatieToken() {
        return verificatieToken;
    }

    public void setVerificatieToken(VerificatieToken verificatieToken) {
        this.verificatieToken = verificatieToken;
    }

    public Integer getUitnodigingId() {
        return uitnodigingId;
    }

    public void setUitnodigingId(Integer uitnodigingId) {
        this.uitnodigingId = uitnodigingId;
    }

    public MailSender getMailSender() {
        return mailSender;
    }

    public SimpleMailMessage getSimpleMailMessage() {
        return simpleMailMessage;
    }

    public void setMailSender(MailSender mailSender) {
        this.mailSender = mailSender;
    }

    public void setSimpleMailMessage(SimpleMailMessage simpleMailMessage) {
        this.simpleMailMessage = simpleMailMessage;
    }

    public String getEmailadres() {
        return emailadres;
    }

    public void setEmailadres(String emailadres) {
        this.emailadres = emailadres;
    }

    public String getBericht() {
        return bericht;
    }

    public void setBericht(String bericht) {
        this.bericht = bericht;
    }
}
