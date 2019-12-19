package nl.makeitwork.Showmaster.controller;

import nl.makeitwork.Showmaster.model.TaakSelectie;
import nl.makeitwork.Showmaster.model.Voorstelling;
import nl.makeitwork.Showmaster.model.VoorstellingsTaak;
import nl.makeitwork.Showmaster.repository.TaakRepository;
import nl.makeitwork.Showmaster.repository.VoorstellingRepository;
import nl.makeitwork.Showmaster.repository.VoorstellingsTaakRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import javax.servlet.http.HttpServletRequest;



/**
 * @author Pieter Dijkema
 * beheren voorstellingsTaken
 */

@Controller
public class VoorstellingsTaakController {

    @Autowired
    private VoorstellingRepository voorstellingRepository;
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
    protected String saveOrUpdateTakenBijVoorstelling(TaakSelectie taakSelectie, BindingResult result, HttpServletRequest request) {
        Integer voorstellingId = (Integer)(request.getSession().getAttribute("voorstellingId"));
        Voorstelling voorstelling = voorstellingRepository.findById(voorstellingId).get();

        if (!result.hasErrors()) {
            int bar = taakSelectie.getBar();
            int kaartVerkoop = taakSelectie.getKaartverkoop();
            int garderobe = taakSelectie.getGarderobe();

            for (int i = 0; i < bar; i++) {
                VoorstellingsTaak taak = new VoorstellingsTaak();
                taak.setTaak(taakRepository.findByTaakNaam("Bar"));
                taak.setVoorstelling(voorstelling);
                voorstellingsTaakRepository.save(taak);
            }

            for (int i = 0; i < kaartVerkoop; i++) {
                VoorstellingsTaak taak = new VoorstellingsTaak();
                taak.setTaak(taakRepository.findByTaakNaam("Kaartverkoop"));
                taak.setVoorstelling(voorstelling);
                voorstellingsTaakRepository.save(taak);
            }

            for (int i = 0; i < garderobe; i++) {
                VoorstellingsTaak taak = new VoorstellingsTaak();
                taak.setTaak(taakRepository.findByTaakNaam("Garderobe"));
                taak.setVoorstelling(voorstelling);
                voorstellingsTaakRepository.save(taak);
            }
        } else {

        }

        return "redirect:/voorstellingen";
    }
}
