package nl.makeitwork.Showmaster.controller;
import nl.makeitwork.Showmaster.model.Voorstelling;
import nl.makeitwork.Showmaster.repository.VoorstellingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;
import java.util.Optional;

/**
 * @author Pieter Dijkema
 * opgeslagen voorstellingen weergeven en een nieuwe voorstelling opslaan
 */

@Controller
public class VoorstellingController {

    @Autowired
    private VoorstellingRepository voorstellingRepository;


    @GetMapping("/voorstellingen")
    protected String alleVoorstellingen(Model model) {
        model.addAttribute("alleVoorstellingen", voorstellingRepository.findAll());
        return "alleVoorstellingen";
    }

    @GetMapping("/voorstelling/toevoegen")
    protected String toevoegenVoorstellingen(Voorstelling voorstelling) {
        return "nieuweVoorstelling";
    }

    @PostMapping("/voorstelling/toevoegen")
    protected String saveOrUpdateVoorstelling(@ModelAttribute("voorstelling") Voorstelling voorstelling) {
        if (!voorstelling.getNaam().isEmpty() && voorstelling.getDatum() != null) {
            voorstellingRepository.save(voorstelling);
        } else {
            return "nieuweVoorstelling";
        }
        return "redirect:/voorstellingen";
    }

    @GetMapping("/voorstelling/verwijderen/{voorstellingId}")
    protected String verwijderVoorstelling(@PathVariable Integer voorstellingId) {
        voorstellingRepository.deleteById(voorstellingId);
        return "redirect:/voorstellingen";
    }
}
