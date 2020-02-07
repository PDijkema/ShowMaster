package nl.makeitwork.Showmaster.controller;

import nl.makeitwork.Showmaster.model.MedewerkerInschrijvingVoorstelling;
import nl.makeitwork.Showmaster.model.Taak;
import nl.makeitwork.Showmaster.model.Voorstelling;
import nl.makeitwork.Showmaster.model.VoorstellingsTaak;
import nl.makeitwork.Showmaster.repository.MedewerkerInschrijvingVoorstellingRepository;
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
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
    @Autowired
    private VoorstellingController voorstellingController;
    @Autowired
    private MedewerkerInschrijvingVoorstellingRepository medewerkerInschrijvingVoorstellingRepository;


    @GetMapping("/planner/voorstellingen")
    protected String alleVoorstellingen(Model model) {
        model.addAttribute("alleVoorstellingen", voorstellingRepository.findAllByOrderByLocalDateTimeAsc());

        Map<Integer, Integer> openstaandeTaken = new HashMap<>();

        for (Voorstelling voorstelling : voorstellingRepository.findAll()) {
            openstaandeTaken.put(voorstelling.getVoorstellingId(), voorstellingsTaakRepository.countByVoorstellingVoorstellingIdAndMedewerkerIsNull(voorstelling.getVoorstellingId()));
        }
        model.addAttribute("openstaandeTaken", openstaandeTaken);

        return "alleVoorstellingen";
    }

    @GetMapping("/planner/voorstellingen/voorstelling/toevoegen")
    protected String toevoegenVoorstellingen(Voorstelling voorstelling, Model model) {
        model.addAttribute("alleTaken", taakRepository.findAll());
        return "toevoegenVoorstelling";
    }

    @GetMapping("/planner/voorstellingen/voorstelling/wijzigen/{voorstellingId}")
    protected String wijzigenVoorstellingen(@PathVariable Integer voorstellingId, Model model, HttpServletRequest request) {

        Optional<Voorstelling> voorstelling = voorstellingRepository.findById(voorstellingId);
        model.addAttribute("alleTaken", taakRepository.findAll());
        if (!voorstelling.isPresent() || voorstelling.get().getStatus().equals("Geannuleerd")) {
            return "redirect:/planner/voorstellingen";
        } else {
            request.getSession().setAttribute("voorstellingId", voorstellingId);
            model.addAttribute("voorstelling", voorstelling.get());
            return "wijzigVoorstelling";
        }
    }

    @GetMapping("/rooster/voorstelling/{voorstellingId}")
    protected String roosterVoorstelling(@PathVariable Integer voorstellingId, Model model) {

        List<VoorstellingsTaak> voorstellingOverzicht = voorstellingsTaakRepository.findByVoorstellingVoorstellingId(voorstellingId);
        voorstellingOverzicht.removeIf(r -> r.getMedewerker() == null);

        Voorstelling voorstelling = voorstellingRepository.findByVoorstellingId(voorstellingId);

        model.addAttribute("voorstellingOverzicht", voorstellingOverzicht);
        model.addAttribute("voorstelling", voorstelling);

        return "persoonlijkRoosterVoorstelling";
    }

    @GetMapping("/planner/voorstellingen/voorstelling/rooster/{voorstellingId}")
    protected String roosterVoorstelling(@PathVariable Integer voorstellingId, Model model, HttpServletRequest request) {

        model.addAttribute("alleTaken", taakRepository.findAll());
        Optional<Voorstelling> voorstelling = voorstellingRepository.findById(voorstellingId);

        // Lijst alle inschrijvingen op één voorstelling met status beschikbaar
        List<MedewerkerInschrijvingVoorstelling> inschrijvingenBijVoorstellingId =
                medewerkerInschrijvingVoorstellingRepository.findByVoorstellingVoorstellingIdAndInschrijvingStatus(voorstellingId, "Beschikbaar");

        // Lijst alle taken bij één voorstelling
        List<VoorstellingsTaak> alleVoorstellingsTakenBijVoorstellingId =
                voorstellingsTaakRepository.findByVoorstellingVoorstellingIdOrderByTaakTaakNaam(voorstellingId);

        // Reeds ingevulde taken filteren om alle nog beschikbare medewerkers te kunnen laten zien
        alleVoorstellingsTakenBijVoorstellingId.forEach
                (d-> inschrijvingenBijVoorstellingId.removeIf(r-> r.getMedewerker() == d.getMedewerker()));

        List<VoorstellingsTaak> voorstellingsTaken = voorstellingsTaakRepository.findByVoorstellingVoorstellingIdOrderByTaakTaakNaam(voorstellingId);

        if (!voorstelling.isPresent() || voorstelling.get().getStatus().equals("Geannuleerd")) {
            return "redirect:/planner/voorstellingen";
        } else {
            request.getSession().setAttribute("voorstellingId", voorstellingId);
            model.addAttribute("takenBijVoorstelling", voorstellingsTaken);
            model.addAttribute("voorstelling", voorstelling.get());
            model.addAttribute("beschikbareMedewerkers", inschrijvingenBijVoorstellingId);
            return "roosterVoorstelling";
        }
    }

    @GetMapping("/planner/voorstellingen/voorstelling/publiceren/{voorstellingId}")
    protected String publiceerVoorstelling(@PathVariable Integer voorstellingId) {
        Optional<Voorstelling> voorstelling = voorstellingRepository.findById(voorstellingId);

        voorstelling.ifPresent(value -> value.setStatus("Gepubliceerd"));
        voorstelling.ifPresent(value -> voorstellingRepository.save(value));

        return "redirect:/planner/voorstellingen";
    }

    @GetMapping("/planner/voorstellingen/voorstelling/annuleren/{voorstellingId}")
    protected String annuleerVoorstelling(@PathVariable Integer voorstellingId) {
        Optional<Voorstelling> voorstelling = voorstellingRepository.findById(voorstellingId);

        voorstelling.ifPresent(value -> value.setStatus("Geannuleerd"));
        voorstelling.ifPresent(value -> voorstellingRepository.save(value));

        return "redirect:/planner/voorstellingen";
    }

    @PostMapping("/planner/voorstellingen/voorstelling/toevoegen")
    protected String saveVoorstelling(@ModelAttribute("voorstelling") Voorstelling voorstelling, BindingResult result) {

        if (!result.hasErrors()) {
           voorstellingOpslaanInclTaken(voorstelling);
        } else {
            return "toevoegenVoorstelling";
        }
        return "redirect:/planner/voorstellingen";
    }

    @PostMapping("/planner/voorstellingen/voorstelling/wijzigen")
    protected String UpdateVoorstelling(@ModelAttribute("voorstelling") Voorstelling voorstelling, BindingResult result) {

        if (!result.hasErrors()) {
            voorstelling.localDateTimeFormatterenNaarString();

            voorstellingRepository.save(voorstelling);
        } else {
            return "wijzigVoorstelling";
        }
        return "redirect:/planner/voorstellingen";
    }

    protected void standaardTakenOpslaanBijVoorstelling(int taakAantal, Voorstelling voorstelling, Taak taak) {

        for (int i = 0; i < taakAantal; i++) {
            VoorstellingsTaak voorstellingsTaak = new VoorstellingsTaak();
            voorstellingsTaak.setTaak(taak);
            voorstellingsTaak.setVoorstelling(voorstelling);
            voorstellingsTaakRepository.save(voorstellingsTaak);
        }
    }

    @GetMapping("/planner/voorstellingen/voorstelling/verwijderen/{voorstellingId}")
    protected String verwijderVoorstelling(@PathVariable Integer voorstellingId) {
        voorstellingRepository.deleteById(voorstellingId);
        return "redirect:/planner/voorstellingen";
    }

    public void voorstellingOpslaanInclTaken(Voorstelling voorstelling) {
        voorstelling.setStatus("Ongepubliceerd");

       voorstelling.localDateTimeFormatterenNaarString();

        voorstellingRepository.save(voorstelling);
        for (Taak taak : taakRepository.findAll()) {
            standaardTakenOpslaanBijVoorstelling(taak.getStandaardBezetting(), voorstelling, taak);
        }
    }


    @GetMapping("/voorstellingen/setup")
    protected String setupTakenInDatabase() {

        Voorstelling voorstelling1 = new Voorstelling();

        voorstelling1.setNaam("Lion King");
        voorstelling1.setLocalDateTime(LocalDateTime.of(2020, Month.JANUARY, 18, 20, 30));
        voorstelling1.setStatus("Gepubliceerd");

        DateTimeFormatter aFormatter = DateTimeFormatter.ofPattern("dd MMMM yyyy HH:mm");
        LocalDateTime localDateTime = voorstelling1.getLocalDateTime();
        String formattedString = localDateTime.format(aFormatter);

        voorstelling1.setDatum(formattedString);

        voorstellingRepository.save(voorstelling1);


        for (Taak taak : taakRepository.findAll()) {
            standaardTakenOpslaanBijVoorstelling(taak.getStandaardBezetting(), voorstelling1, taak);
        }

        Voorstelling voorstelling2 = new Voorstelling();

        voorstelling2.setNaam("Soldaat van Oranje");
        voorstelling2.setLocalDateTime(LocalDateTime.of(2020, Month.JANUARY, 16, 20, 0));
        voorstelling2.setStatus("Gepubliceerd");

        LocalDateTime localDateTime2 = voorstelling2.getLocalDateTime();
        String formattedString2 = localDateTime2.format(aFormatter);

        voorstelling2.setDatum(formattedString2);

        voorstellingRepository.save(voorstelling2);


        for (Taak taak : taakRepository.findAll()) {
            standaardTakenOpslaanBijVoorstelling(taak.getStandaardBezetting(), voorstelling2, taak);
        }


        Voorstelling voorstelling3 = new Voorstelling();

        voorstelling3.setNaam("Assepoester");
        voorstelling3.setLocalDateTime(LocalDateTime.of(2020, Month.FEBRUARY, 8, 21, 0));
        voorstelling3.setStatus("Ongepubliceerd");

        LocalDateTime localDateTime3 = voorstelling3.getLocalDateTime();
        String formattedString3 = localDateTime3.format(aFormatter);

        voorstelling3.setDatum(formattedString3);

        voorstellingRepository.save(voorstelling3);


        for (Taak taak : taakRepository.findAll()) {
            standaardTakenOpslaanBijVoorstelling(taak.getStandaardBezetting(), voorstelling2, taak);
        }
        return "redirect:/planner/voorstellingen";
    }
}
