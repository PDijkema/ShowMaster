package nl.makeitwork.Showmaster.controller;

import nl.makeitwork.Showmaster.model.Medewerker;
import nl.makeitwork.Showmaster.repository.MedewerkerRepository;
import nl.makeitwork.Showmaster.repository.TaakRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;


/**
 * @Author Gert Postma
 * 17-12-19 - Karin Zoetendal: profiel/wijzigen get en postmapping toegevoegd, moet nog aangepost worden
 */
@Controller
public class MedewerkerController {

    @Autowired
    MedewerkerRepository medewerkerRepository;

    @Autowired
    TaakRepository taakRepository;

    @GetMapping("/registreer")
    protected String showRegistratieFormulier(Model model) {
        model.addAttribute("registratieFormulier",new Medewerker());
        return "registratieFormulier";
    }

    @PostMapping("/registreer")
    public String saveGebruiker (@ModelAttribute("registratieFormulier")Medewerker userForm){
        medewerkerRepository.save(userForm);
        return "redirect:/registreer";
    }

    // moet wellicht aangepast, moet medewerkerId meegeven
    @GetMapping("/profiel/wijzigen")
    protected String showProfielpagina(Model model) {
        model.addAttribute("medewerker", new Medewerker());
        model.addAttribute("takenLijst", taakRepository.findAll());
        return "profielWijzigen";
    }


    // Redirect moet nog worden aangepast, moet terug naar profielPagina (overzicht profielgegevens)
    @PostMapping("/profiel/wijzigen")
    public String saveOrUpdateGebruiker (@ModelAttribute("profielWijzigen") Medewerker profielWijzigingen,
                                         BindingResult result) {
        if (result.hasErrors()) {
            return "profielWijzigen";
        } else {
            medewerkerRepository.save(profielWijzigingen);
            return "redirect:/takenlijst";
        }
    }

    }






