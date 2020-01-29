package nl.makeitwork.Showmaster.controller;

import nl.makeitwork.Showmaster.mail.MailService;
import nl.makeitwork.Showmaster.mail.MailServiceConfiguratie;
import nl.makeitwork.Showmaster.model.UitnodigingMedewerker;
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

    @PostMapping("/planner/gebruiker/overzicht/uitnodigen")
    protected String verstuurUitnodiging(@ModelAttribute("uitnodigingMedewerker") UitnodigingMedewerker uitnodiging, BindingResult result) {

        if (!result.hasErrors()) {
            String onderwerp = "Uitnodiging";
            String emailBody = uitnodiging.getBericht() + "\n\nKlik op deze link om je in te schrijven: http://localhost:8080/registreer"
                + "\n\nMet vriendelijke groet,\n\nPlanning Showmaster";
            // String emailBody = uitnodiging.getBericht() + "klik op deze link om je in te schrijven " + "192.168.1.126:8080/registreer";

            AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(MailServiceConfiguratie.class);
		    MailService bean = context.getBean(MailService.class);
		    bean.verstuurMail(uitnodiging.getEmailadres(), onderwerp, emailBody);

        }
        return "gebruikerOverzicht";
    }
}
