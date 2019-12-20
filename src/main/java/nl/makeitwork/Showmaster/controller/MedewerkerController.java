package nl.makeitwork.Showmaster.controller;

import nl.makeitwork.Showmaster.model.Medewerker;
import nl.makeitwork.Showmaster.repository.MedewerkerRepository;
import nl.makeitwork.Showmaster.repository.TaakRepository;
import nl.makeitwork.Showmaster.service.MedewerkerService;
import nl.makeitwork.Showmaster.service.MedewerkerServiceImplementatie;
import nl.makeitwork.Showmaster.service.SecurityService;
import nl.makeitwork.Showmaster.service.SecurityServiceImplementatie;
import nl.makeitwork.Showmaster.validator.MedewerkerValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;


/**
 * @Author Gert Postma
 * 20-12-19 - Karin Zoetendal: profiel/wijzigen en profielpagina worden nu correct weergegeven
 */
@Controller
public class MedewerkerController {


    @Autowired
    SecurityServiceImplementatie securityServiceImplementatie;

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
        model.addAttribute("registratieFormulier", new Medewerker());
        return "registratieFormulier";
    }

    @PostMapping("/registreer")
    public String saveGebruiker(@ModelAttribute("registratieFormulier") Medewerker registratieFormulier, BindingResult bindingResult) {
        medewerkerValidator.validate(registratieFormulier, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registratieFormulier";
        }
        medewerkerService.save(registratieFormulier);
        securityService.autoLogin(registratieFormulier.getGebruikersnaam(), registratieFormulier.getWachtwoordBevestigen());
        registratieFormulier.setWachtwoordBevestigen("");
        return "redirect:/";
    }

    @GetMapping("/login")
    public String login(Model model, String error, String logout) {

        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");


        return "login";
    }

    @GetMapping("/medewerker/welkom")
    public String welkomMedewerker(Model model) {
        return "welkomMedewerker";
    }

    @GetMapping({"/","/planner"})
    public String isPlanner (@AuthenticationPrincipal Medewerker medewerker){

        if (medewerker.getAuthorities().stream().anyMatch(r -> r.getAuthority().equals("ROLE_PLANNER"))) {
            return "redirect:/planner/inlogkeuze";
        }

        return "redirect:/medewerker/welkom";

    }

    @GetMapping("/planner/inlogkeuze")
    public String inlogKeuzePlanner(Model model) {
        return "inlogKeuzePlanner";
    }

    @GetMapping("/profielpagina")
    protected String showProfielPagina(Model model, @AuthenticationPrincipal Medewerker ingelogdeMedewerker) {
        model.addAttribute("medewerker", medewerkerRepository.findByGebruikersnaam(ingelogdeMedewerker.getGebruikersnaam()));
        return "profielPagina";
    }

    @PostMapping("/profielpagina")
    protected String goToProfielWijzigen(Model model, @AuthenticationPrincipal Medewerker ingelogdeMedewerker) {
        return "redirect:/profiel/wijzigen";
    }

    @GetMapping("/profiel/wijzigen")
    protected String showProfielWijzigen(Model model, @AuthenticationPrincipal Medewerker ingelogdeMedewerker) {
        model.addAttribute("medewerker", medewerkerRepository.findByGebruikersnaam(ingelogdeMedewerker.getGebruikersnaam()));
        model.addAttribute("takenLijst", taakRepository.findAll());
        return "profielWijzigen";
    }

    @PostMapping("/profiel/wijzigen")
    public String updateMedewerker(@ModelAttribute("medewerker") Medewerker ingelogdeMedewerker,
                                   BindingResult result) {
        if (result.hasErrors()) {
            return "profielWijzigen";
        } else {
            medewerkerRepository.save(ingelogdeMedewerker);
            return "redirect:/profielpagina";
        }
    }

    @GetMapping("/planner/welkom")
    public String welkomPlanner(Model model) {
        return "welkomPlanner";
    }

    @GetMapping("/planner/gebruiker/overzicht")
    public String gebruikerOverzicht (Model model) {
        System.out.println(medewerkerRepository.findAll());
        model.addAttribute("alleGebruikers",medewerkerRepository.findAll());

        return "gebruikerOverzicht";
    }

    @GetMapping("/planner/gebruiker/verwijderen/{medewerkerId}")
    public String verwijderGebruiker(@PathVariable Integer medewerkerId) {
        medewerkerRepository.deleteById(medewerkerId);
        return "redirect:/planner/gebruiker/overzicht";
    }

}








