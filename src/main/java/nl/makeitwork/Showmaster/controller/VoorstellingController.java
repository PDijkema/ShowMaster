package nl.makeitwork.Showmaster.controller;
import nl.makeitwork.Showmaster.model.Voorstelling;
import nl.makeitwork.Showmaster.repository.VoorstellingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.time.LocalDateTime;
import java.time.Month;
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
        return "wijzigVoorstelling";
    }

    @GetMapping("/voorstelling/wijzigen/{voorstellingId}")
    protected String wijzigenVoorstellingen(@PathVariable Integer voorstellingId, Model model) {
        Optional<Voorstelling> voorstelling = voorstellingRepository.findById(voorstellingId);
        if (!voorstelling.isPresent()) {
            return "redirect:/alleVoorstellingen";
        } else {
            model.addAttribute("voorstelling", voorstelling.get());
            System.out.println(voorstelling);
            return "wijzigVoorstelling";
        }
    }

    @PostMapping("/voorstelling/toevoegen")
    protected String saveOrUpdateVoorstelling(@ModelAttribute("voorstelling") Voorstelling voorstelling, BindingResult result) {
        if (!result.hasErrors()) {
            voorstellingRepository.save(voorstelling);
        } else {
            return "wijzigVoorstelling";
        }
        return "redirect:/voorstellingen";
    }

    @GetMapping("/voorstelling/verwijderen/{voorstellingId}")
    protected String verwijderVoorstelling(@PathVariable Integer voorstellingId) {
        voorstellingRepository.deleteById(voorstellingId);
        return "redirect:/voorstellingen";
    }
}
