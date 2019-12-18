package nl.makeitwork.Showmaster.controller;

import nl.makeitwork.Showmaster.model.Medewerker;
import nl.makeitwork.Showmaster.repository.MedewerkerRepository;
import nl.makeitwork.Showmaster.repository.TaakRepository;
import nl.makeitwork.Showmaster.service.MedewerkerService;
import nl.makeitwork.Showmaster.service.MedewerkerServiceImplementatie;
import nl.makeitwork.Showmaster.service.SecurityService;
import nl.makeitwork.Showmaster.validator.MedewerkerValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * @Author Gert Postma
 * 17-12-19 - Karin Zoetendal: profiel/wijzigen get en postmapping toegevoegd, moet nog aangepost worden
 */
@Controller
public class MedewerkerController {

    @Autowired
    private MedewerkerService medewerkerService;

    @Autowired
    private MedewerkerServiceImplementatie medewerkerServiceImplementatie;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private MedewerkerValidator medewerkerValidator;

    @Autowired
    private MedewerkerRepository medewerkerRepository;

    @Autowired
    TaakRepository taakRepository;

    @GetMapping("/registreer")
    protected String showRegistratieFormulier(Model model) {
        model.addAttribute("registratieFormulier",new Medewerker());
        return "registratieFormulier";
    }

    @PostMapping("/registreer")
    public String saveGebruiker (@ModelAttribute("registratieFormulier")Medewerker registratieFormulier, BindingResult bindingResult){
        medewerkerValidator.validate(registratieFormulier,bindingResult);


        if (bindingResult.hasErrors()){
            return "registratieFormulier";
        }
        medewerkerService.save(registratieFormulier);
        securityService.autoLogin(registratieFormulier.getGebruikersnaam(),registratieFormulier.getWachtwoordBevestigen());
        return "redirect:/welcome";
    }

    @GetMapping("/login")
    public String login(Model model, String error, String logout) {

        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }

    @GetMapping({"/", "/welcome"})
    public String welcome(Model model) {
        return "welcome";
    }

    // moet wellicht aangepast, moet medewerkerId meegeven
    @GetMapping("/profiel/wijzigen")
    protected String showProfielpagina(Model model, @AuthenticationPrincipal UserDetails user) {
        model.addAttribute("medewerker", medewerkerRepository.findByGebruikersnaam(user.getUsername()));
        model.addAttribute("takenLijst", taakRepository.findAll());
        return "profielWijzigen";
    }


    // Redirect moet nog worden aangepast, moet terug naar profielPagina (overzicht profielgegevens)
    @PostMapping("/profiel/wijzigen")
    public String saveOrUpdateMedewerker(@ModelAttribute("medewerker") Medewerker medewerker,
                                         BindingResult result) {
        if (result.hasErrors()) {
            return "profielWijzigen";
        } else {
            medewerkerRepository.save(medewerker);
            return "redirect:/takenlijst";
        }
    }

    }






