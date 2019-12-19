package nl.makeitwork.Showmaster.controller;

import nl.makeitwork.Showmaster.model.TaakSelectie;
import nl.makeitwork.Showmaster.model.Voorstelling;
import nl.makeitwork.Showmaster.model.VoorstellingsTaak;
import nl.makeitwork.Showmaster.repository.TaakRepository;
import nl.makeitwork.Showmaster.repository.VoorstellingsTaakRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

/**
 * @author Pieter Dijkema
 * beheren voorstellingsTaken
 */

@Controller
public class VoorstellingsTaakController {

    @Autowired
    private TaakRepository taakRepository;
    @Autowired
    private VoorstellingsTaakRepository voorstellingsTaakRepository;

    @GetMapping("/toevoegenTaken")
    protected String toevoegenTakenAanVoorstelling(Model model) {
        model.addAttribute("alleTaken", taakRepository.findAll());
        return "toevoegenTakenAanVoorstelling";
    }

    @PostMapping("/taken/toevoegen")
    protected String saveOrUpdateTakenBijVoorstelling(List<TaakSelectie> taakSelectie) {
        System.out.println(taakSelectie);


        return "redirect:/voorstellingen";
    }
}
