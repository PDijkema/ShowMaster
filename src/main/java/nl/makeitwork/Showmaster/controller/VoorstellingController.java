package nl.makeitwork.Showmaster.controller;
import nl.makeitwork.Showmaster.model.Taak;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
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
    @Autowired
    private TaakRepository taakRepository;
    @Autowired
    private VoorstellingsTaakRepository voorstellingsTaakRepository;


    @GetMapping("/voorstellingen")
    protected String alleVoorstellingen(Model model) {
        model.addAttribute("alleVoorstellingen", voorstellingRepository.findAll());
        return "alleVoorstellingen";
    }

    @GetMapping("/voorstelling/toevoegen")
    protected String toevoegenVoorstellingen(Voorstelling voorstelling, Model model) {
        model.addAttribute("alleTaken", taakRepository.findAll());
        return "toevoegenVoorstelling";
    }

    @GetMapping("/voorstelling/wijzigen/{voorstellingId}")
    protected String wijzigenVoorstellingen(@PathVariable Integer voorstellingId, Model model, HttpServletRequest request) {

        Optional<Voorstelling> voorstelling = voorstellingRepository.findById(voorstellingId);
        model.addAttribute("alleTaken", taakRepository.findAll());
        if (!voorstelling.isPresent()) {
            return "redirect:/alleVoorstellingen";
        } else {
            request.getSession().setAttribute("voorstellingId", voorstellingId);
            model.addAttribute("voorstelling", voorstelling.get());
            return "wijzigVoorstelling";
        }
    }

    @GetMapping("/voorstelling/details/{voorstellingId}")
    protected String detailsVoorstelling(@PathVariable Integer voorstellingId, Model model, HttpServletRequest request) {

        model.addAttribute("alleTaken", taakRepository.findAll());
        Optional<Voorstelling> voorstelling = voorstellingRepository.findById(voorstellingId);
        List<VoorstellingsTaak> voorstellingsTaken = voorstellingsTaakRepository.findVoorstellingstaakByVoorstellingId(voorstellingId);

        if (!voorstelling.isPresent()) {
            return "redirect:/alleVoorstellingen";
        } else {
            request.getSession().setAttribute("voorstellingId", voorstellingId);
            model.addAttribute("takenBijVoorstelling", voorstellingsTaken);
            model.addAttribute("voorstelling", voorstelling.get());
            return "detailsVoorstelling";
        }
    }

    @PostMapping("/voorstelling/toevoegen")
    protected String saveVoorstelling(@ModelAttribute("voorstelling") Voorstelling voorstelling, BindingResult result) {

        if (!result.hasErrors()) {
            voorstellingRepository.save(voorstelling);
            for (Taak taak : taakRepository.findAll()) {
                standaardTakenOpslaanBijVoorstelling(taak.getStandaardBezetting(), voorstelling, taak);
            }

        } else {
            return "toevoegenVoorstelling";
        }
        return "redirect:/voorstellingen";
    }

    @PostMapping("/voorstelling/wijzigen")
    protected String UpdateVoorstelling(@ModelAttribute("voorstelling") Voorstelling voorstelling, BindingResult result) {

        if (!result.hasErrors()) {
            voorstellingRepository.save(voorstelling);
        } else {
            return "wijzigVoorstelling";
        }
        return "redirect:/voorstellingen";
    }

    protected void standaardTakenOpslaanBijVoorstelling(int taakAantal, Voorstelling voorstelling, Taak taak) {

        for (int i = 0; i < taakAantal; i++) {
            VoorstellingsTaak voorstellingsTaak = new VoorstellingsTaak();
            voorstellingsTaak.setTaak(taak);
            voorstellingsTaak.setVoorstelling(voorstelling);
            voorstellingsTaakRepository.save(voorstellingsTaak);
        }
    }

    @GetMapping("/voorstelling/verwijderen/{voorstellingId}")
    protected String verwijderVoorstelling(@PathVariable Integer voorstellingId) {
        voorstellingRepository.deleteById(voorstellingId);
        return "redirect:/voorstellingen";
    }

    @GetMapping("/voorstellingen/setup")
    protected String setupTakenInDatabase() {

        Voorstelling voorstelling1 = new Voorstelling();
        voorstelling1.setNaam("Lion King");
        voorstelling1.setDatum(LocalDateTime.of(2020, Month.JANUARY, 18, 20, 30));
        voorstellingRepository.save(voorstelling1);

        Voorstelling voorstelling2 = new Voorstelling();
        voorstelling2.setNaam("Soldaat van Oranje");
        voorstelling2.setDatum(LocalDateTime.of(2020, Month.JANUARY, 16, 20, 00));
        voorstellingRepository.save(voorstelling2);

        Voorstelling voorstelling3 = new Voorstelling();
        voorstelling3.setNaam("Assepoester");
        voorstelling3.setDatum(LocalDateTime.of(2020, Month.FEBRUARY, 5, 16, 00));
        voorstellingRepository.save(voorstelling3);

        return "redirect:/voorstellingen";
    }
}
