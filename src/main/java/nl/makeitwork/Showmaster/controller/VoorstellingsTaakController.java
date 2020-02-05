package nl.makeitwork.Showmaster.controller;

import nl.makeitwork.Showmaster.model.*;
import nl.makeitwork.Showmaster.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.json.GsonBuilderUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import java.util.*;

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
    @Autowired
    private MedewerkerInschrijvingVoorstellingRepository medewerkerInschrijvingVoorstellingRepository;
    @Autowired
    private MedewerkerRepository medewerkerRepository;

    @GetMapping("/planner/voorstellingen/voorstellingsTaak/verwijderen/{voorstellingId}/{voorstellingsTaakId}")
    protected String verwijderenTaakBijVoorstelling(@PathVariable("voorstellingsTaakId") Integer voorstellingsTaakId,
                                                    @PathVariable("voorstellingId") Integer voorstellingId) {

        Optional<VoorstellingsTaak> voorstellingsTaak = voorstellingsTaakRepository.findById(voorstellingsTaakId);
        voorstellingsTaakRepository.deleteById(voorstellingsTaakId);

        return "redirect:/planner/voorstellingen/voorstelling/rooster/" + voorstellingId;
    }

    @GetMapping("/planner/voorstellingen/voorstellingsTaak/toevoegen/{voorstellingId}/{taakId}")
    protected String toevoegenTaakAanVoorstelling(@PathVariable("taakId") Integer taakId,
                                                  @PathVariable("voorstellingId") Integer voorstellingId) {

        Optional<Voorstelling> voorstelling = voorstellingRepository.findById(voorstellingId);
        Optional<Taak> taak = taakRepository.findById(taakId);

        VoorstellingsTaak voorstellingsTaak = new VoorstellingsTaak();

        voorstelling.ifPresent(voorstellingsTaak::setVoorstelling);
        taak.ifPresent(voorstellingsTaak::setTaak);

        voorstellingsTaakRepository.save(voorstellingsTaak);

        return "redirect:/planner/voorstellingen/voorstelling/rooster/" + voorstellingId;
    }

    @GetMapping("/planner/voorstellingen/voorstellingsTaak/medewerkerKoppelen/{voorstellingId}/{voorstellingsTaakId}")
    protected String koppelenMedewerkerAanVoorstellingsTaak(@PathVariable("voorstellingId") Integer voorstellingId,
                                                            @PathVariable("voorstellingsTaakId") Integer voorstellingsTaakId,
                                                            Model model) {

        Optional<VoorstellingsTaak> voorstellingsTaak = voorstellingsTaakRepository.findById(voorstellingsTaakId);
        Optional<Voorstelling> voorstelling = voorstellingRepository.findById(voorstellingId);

        // Lijst alle inschrijvingen op één voorstelling
        List<MedewerkerInschrijvingVoorstelling> inschrijvingenBijVoorstellingId =
            medewerkerInschrijvingVoorstellingRepository.findInschrijvingByVoorstellingId(voorstellingId);

        // Lijst alle taken bij één voorstelling
        List<VoorstellingsTaak> alleVoorstellingsTakenBijVoorstellingId =
            voorstellingsTaakRepository.findByVoorstellingVoorstellingIdOrderByTaakTaakNaam(voorstellingId);

        // Reeds ingevulde taken filteren om alle nog beschikbare medewerkers te kunnen laten zien
        alleVoorstellingsTakenBijVoorstellingId.forEach
            (d-> inschrijvingenBijVoorstellingId.removeIf(r-> r.getMedewerker() == d.getMedewerker()));

        voorstellingsTaak.ifPresent(taak -> model.addAttribute("voorstellingsTaak", taak));
        model.addAttribute("voorstellingId", voorstellingId);
        model.addAttribute("beschikbareMedewerkers", inschrijvingenBijVoorstellingId);
        voorstellingsTaak.ifPresent(taak -> model.addAttribute("taak", taak.getTaak().getTaakNaam()));
        voorstelling.ifPresent(value -> model.addAttribute("voorstelling", value.getNaam()));

        return "medewerkerKoppelenAanVoorstellingsTaak";
    }

    @GetMapping("/planner/voorstellingen/voorstellingsTaak/medewerkerKoppelen/{voorstellingId}/{voorstellingsTaakId}/{medewerkerId}")
    protected String opslaanMedewerkerBijVoorstellingstaak(@PathVariable("voorstellingId") Integer voorstellingId,
                                                           @PathVariable("voorstellingsTaakId") Integer voorstellingsTaakId,
                                                           @PathVariable("medewerkerId") Integer medewerkerId) {

        Optional<VoorstellingsTaak> voorstellingsTaak = voorstellingsTaakRepository.findById(voorstellingsTaakId);
        Optional<Medewerker> medewerker = medewerkerRepository.findById(medewerkerId);

        List<VoorstellingsTaak> takenBijVoorstelling = voorstellingsTaakRepository.findByVoorstellingVoorstellingId(voorstellingId);
        for (VoorstellingsTaak taak: takenBijVoorstelling) {
            if (taak.getMedewerker() != null) {
                if (taak.getMedewerker().getMedewerkerId().equals(medewerkerId)) {
                    taak.setMedewerker(null);
                    voorstellingsTaakRepository.save(taak);
                }
            }
        }

        if (voorstellingsTaak.isPresent() && medewerker.isPresent()) {
            voorstellingsTaak.get().setMedewerker(medewerker.get());
            voorstellingsTaakRepository.save(voorstellingsTaak.get());
        }
        return "redirect:/planner/voorstellingen/voorstelling/rooster/" + voorstellingId;
    }

    @GetMapping("/planner/voorstellingen/voorstellingsTaak/taakVrijGeven/{voorstellingId}/{voorstellingsTaakId}")
    protected String taakBijVoorstellingenVrijgeven(@PathVariable("voorstellingId") Integer voorstellingId,
                                                    @PathVariable("voorstellingsTaakId") Integer voorstellingsTaakId) {

        VoorstellingsTaak voorstellingsTaak = voorstellingsTaakRepository.findByVoorstellingsTaakId(voorstellingsTaakId);

        if (voorstellingsTaak.getMedewerker() != null) {
            voorstellingsTaak.setMedewerker(null);
            voorstellingsTaakRepository.save(voorstellingsTaak);
        }
        return "redirect:/planner/voorstellingen/voorstelling/rooster/" + voorstellingId;
    }

    @GetMapping("/planner/voorstellingen/voorstelling/rooster/genereer/{voorstellingId}")
    protected void genereerRooster(@PathVariable("voorstellingId") Integer voorstellingId) {


    }
}
