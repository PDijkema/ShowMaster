package nl.makeitwork.Showmaster.controller;

import nl.makeitwork.Showmaster.model.Medewerker;
import nl.makeitwork.Showmaster.model.MedewerkerProfielGegevens;
import nl.makeitwork.Showmaster.model.VoorstellingsTaak;
import nl.makeitwork.Showmaster.repository.*;
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

import java.util.List;


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
    private MedewerkerProfielGegevensRepository medewerkerProfielGegevensRepository;

    @Autowired
    VoorstellingsTaakRepository voorstellingsTaakRepository;

    @Autowired
    TaakRepository taakRepository;

    @Autowired
    VoorstellingRepository voorstellingRepository;

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
            model.addAttribute("error", "Uw gebruikersnaam en/of wachtwoord is ongeldig");
        if (logout != null)
            model.addAttribute("message", "U bent succesvol uitgelogd");
        return "login";
    }

    @GetMapping("/startpagina")
    public String welkomMedewerker(Model model, @AuthenticationPrincipal Medewerker ingelogdeMedewerker) {
        model.addAttribute("medewerker", medewerkerRepository.findByGebruikersnaam(ingelogdeMedewerker.getGebruikersnaam()));
        model.addAttribute("medewerkerProfielGegevens", medewerkerProfielGegevensRepository.findByMedewerker(ingelogdeMedewerker));
        model.addAttribute("alleVoorstellingen", voorstellingRepository.findAll());


        List<VoorstellingsTaak> voorstellingsTaken = voorstellingsTaakRepository.findByMedewerkerMedewerkerId(ingelogdeMedewerker.getMedewerkerId());
        model.addAttribute("allePersoonlijkeVoorstellingsTaken", voorstellingsTaken);

        return "welkomMedewerker";
        }

    @GetMapping("/")
    public String doorverwijzenStartpagina (@AuthenticationPrincipal Medewerker medewerker){
        return "redirect:/startpagina";
}

    @GetMapping("/profielpagina")
    protected String showProfielPagina(Model model, @AuthenticationPrincipal Medewerker ingelogdeMedewerker) {
        model.addAttribute("medewerkerProfielGegevens", medewerkerProfielGegevensRepository.findByMedewerker(ingelogdeMedewerker));
        return "profielPagina";
    }

    @PostMapping("/profielpagina")
    protected String goToProfielWijzigen(Model model, @AuthenticationPrincipal Medewerker ingelogdeMedewerker) {
        return "redirect:/profiel/wijzigen";
    }

    @GetMapping("/profiel/wijzigen")
    protected String showProfielWijzigen(Model model, @AuthenticationPrincipal Medewerker ingelogdeMedewerker) {
        model.addAttribute("medewerkerProfielGegevens", medewerkerProfielGegevensRepository.findByMedewerker(ingelogdeMedewerker));
        model.addAttribute("takenLijst", taakRepository.findAll());
        return "profielWijzigen";
    }

    @PostMapping("/profiel/wijzigen")
    public String updateMedewerker(@ModelAttribute("medewerkerProfielGegevens") MedewerkerProfielGegevens medewerkerProfielGegevens,
                                   BindingResult result ) {
        if (result.hasErrors()) {
            return "profielWijzigen";
        } else {
            medewerkerProfielGegevensRepository.save(medewerkerProfielGegevens);
            return "redirect:/profielpagina";
        }
    }

    @GetMapping("/planner/gebruiker/overzicht")
    public String gebruikerOverzicht (Model model,@AuthenticationPrincipal Medewerker ingelogdeMedwerker) {
        List<Medewerker> alleGebruikers = medewerkerRepository.findAll();
        alleGebruikers.removeIf(medewerker -> medewerker.getMedewerkerId().equals(ingelogdeMedwerker.getMedewerkerId()));
        model.addAttribute("alleGebruikers",alleGebruikers);
        return "gebruikerOverzicht";
    }

    @GetMapping("/planner/gebruiker/verwijderen/{medewerkerId}")
    public String verwijderGebruiker(@PathVariable Integer medewerkerId) {
        medewerkerRepository.deleteById(medewerkerId);
        return "redirect:/planner/gebruiker/overzicht";
    }

}








