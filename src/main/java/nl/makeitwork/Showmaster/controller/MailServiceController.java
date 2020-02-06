package nl.makeitwork.Showmaster.controller;

import nl.makeitwork.Showmaster.mail.MailService;
import nl.makeitwork.Showmaster.mail.MailServiceConfiguratie;
import nl.makeitwork.Showmaster.model.UitnodigingMedewerker;
import nl.makeitwork.Showmaster.model.VerificatieToken;
import nl.makeitwork.Showmaster.repository.UitnodigingMedewerkerRepository;
import nl.makeitwork.Showmaster.repository.VerificatieTokenRepository;
import nl.makeitwork.Showmaster.validator.MedewerkerValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

/**
 * @author Pieter Dijkema
 * behandelen mailverzoeken vanuit de applicatie
 */
@Controller
public class MailServiceController {

    @Autowired
    UitnodigingMedewerkerRepository uitnodigingMedewerkerRepository;

    @Autowired
    VerificatieTokenRepository verificatieTokenRepository;

    @Autowired
    MedewerkerValidator medewerkerValidator;



    @PostMapping("/planner/gebruiker/overzicht/uitnodigen")
    protected String verstuurUitnodiging(@ModelAttribute("uitnodigingMedewerker") UitnodigingMedewerker uitnodiging, BindingResult result) {

        medewerkerValidator.validateEmail(uitnodiging, result);
        System.out.println(result);

        System.out.println(result);
        if (result.hasErrors()){
            System.out.println(result);
            return "gebruikerOverzicht";
        }

        if (!result.hasErrors()) {



            VerificatieToken verificatieToken = new VerificatieToken();
            verificatieTokenRepository.save(verificatieToken);

            uitnodiging.setVerificatieToken(verificatieToken);
            uitnodigingMedewerkerRepository.save(uitnodiging);




            String onderwerp = "Uitnodiging";
            String emailBody = uitnodiging.getBericht() + "\n\nKlik op deze link om je in te schrijven: http://localhost:8080/registreer/" + verificatieToken.getToken()
                + "\n\nMet vriendelijke groet,\n\nPlanning Showmaster";
            // String emailBody = uitnodiging.getBericht() + "klik op deze link om je in te schrijven " + "192.168.1.126:8080/registreer";

            AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(MailServiceConfiguratie.class);
		    MailService bean = context.getBean(MailService.class);
		    bean.verstuurMail(uitnodiging.getEmailadres(), onderwerp, emailBody);

        }
        return "gebruikerOverzicht";
    }
}
