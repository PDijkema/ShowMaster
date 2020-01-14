package nl.makeitwork.Showmaster.controller;

import nl.makeitwork.Showmaster.model.*;
import nl.makeitwork.Showmaster.repository.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.persistence.criteria.CriteriaBuilder;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.CopyOnWriteArrayList;


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

    @GetMapping("/planner/voorstellingsTaak/verwijderen/{voorstellingId}/{voorstellingsTaakId}")
    protected String verwijderenTaakBijVoorstelling(@PathVariable("voorstellingsTaakId") Integer voorstellingsTaakId,
                                                    @PathVariable("voorstellingId") Integer voorstellingId) {

        Optional<VoorstellingsTaak> voorstellingsTaak = voorstellingsTaakRepository.findById(voorstellingsTaakId);
        voorstellingsTaakRepository.deleteById(voorstellingsTaakId);

        return "redirect:planner/voorstelling/details/" + voorstellingId;
    }

    @GetMapping("/planner/voorstellingsTaak/toevoegen/{voorstellingId}/{taakId}")
    protected String toevoegenTaakAanVoorstelling(@PathVariable("taakId") Integer taakId,
                                                  @PathVariable("voorstellingId") Integer voorstellingId) {

        Optional<Voorstelling> voorstelling = voorstellingRepository.findById(voorstellingId);
        Optional<Taak> taak = taakRepository.findById(taakId);

        VoorstellingsTaak voorstellingsTaak = new VoorstellingsTaak();

        voorstelling.ifPresent(voorstellingsTaak::setVoorstelling);
        taak.ifPresent(voorstellingsTaak::setTaak);

        voorstellingsTaakRepository.save(voorstellingsTaak);

        return "redirect:/planner/voorstelling/details/" + voorstellingId;
    }

    @GetMapping("/planner/voorstellingsTaak/medewerkerKoppelen/{voorstellingId}/{voorstellingsTaakId}")
    protected String koppelenMedewerkerAanVoorstellingsTaak(@PathVariable("voorstellingId") Integer voorstellingId
                                                            ,@PathVariable("voorstellingsTaakId") Integer voorstellingsTaakId,
                                                            Model model) {

        Optional<VoorstellingsTaak> voorstellingsTaak = voorstellingsTaakRepository.findById(voorstellingsTaakId);
        Optional<Voorstelling> voorstelling = voorstellingRepository.findById(voorstellingId);

        // haal alle medewerkerinschrijvingen op een voorstelling op en maak er een lijst van medewerkers van
        List<MedewerkerInschrijvingVoorstelling> inschrijvingByVoorstellingId =
            medewerkerInschrijvingVoorstellingRepository.findInschrijvingByVoorstellingId(voorstellingId);

        // haal reeds ingevulde taken van dezelfde voorstelling op en maak er een lijst van (ingeplande) medewerkers
        List<VoorstellingsTaak> alleVoorstellingsTaken = voorstellingsTaakRepository.findByVoorstellingVoorstellingIdOrderByTaakTaakNaam(voorstellingId);

        //---TIJDELIJK VOOR PRINTEN
        System.out.println("voor filteren");
        for (MedewerkerInschrijvingVoorstelling m: inschrijvingByVoorstellingId) {
            System.out.println(m.getMedewerker());
        }

        // haal reeds ingevulde taken van dezelfde voorstelling op en maak er een lijst van (ingeplande) medewerkers van
        List<MedewerkerInschrijvingVoorstelling> beschikbareMedewerkers = new ArrayList<>();
        for (MedewerkerInschrijvingVoorstelling m : inschrijvingByVoorstellingId) {
            for (VoorstellingsTaak v : alleVoorstellingsTaken) {

            }
        }


        //---TIJDELIJK VOOR PRINTEN
        System.out.println("na filteren");
        for (MedewerkerInschrijvingVoorstelling m: inschrijvingByVoorstellingId) {
            System.out.println(m.getMedewerker());

        }

        // bovenstaande levert een lijst beschikbare medewerkers op die gekoppeld kunnen worden aan de voorstellingstaak.
        // deze toevoegen aan model
        voorstellingsTaak.ifPresent(taak -> model.addAttribute("voorstellingsTaak", taak));
        model.addAttribute("voorstellingId", voorstellingId);
        model.addAttribute("beschikbareMedewerkers", inschrijvingByVoorstellingId);
        voorstellingsTaak.ifPresent(taak -> model.addAttribute("taak", taak.getTaak().getTaakNaam()));
        voorstelling.ifPresent(value -> model.addAttribute("voorstelling", value.getNaam()));

        return "medewerkerKoppelenAanVoorstellingsTaak";

    }

    @GetMapping("/planner/voorstellingsTaak/medewerkerKoppelen/{voorstellingId}/{voorstellingsTaakId}/{medewerkerId}")
    protected String opslaanMedewerkerBijVoorstellingstaak(@PathVariable("voorstellingId") Integer voorstellingId,
                                                           @PathVariable("voorstellingsTaakId") Integer voorstellingsTaakId,
                                                           @PathVariable("medewerkerId") Integer medewerkerId) {

        Optional<VoorstellingsTaak> voorstellingsTaak = voorstellingsTaakRepository.findById(voorstellingsTaakId);
        Optional<Medewerker> medewerker = medewerkerRepository.findById(medewerkerId);

        if (voorstellingsTaak.isPresent() && medewerker.isPresent()) {
            voorstellingsTaak.get().setMedewerker(medewerker.get());
            voorstellingsTaakRepository.save(voorstellingsTaak.get());
        } else {
            return "redirect:/planner/voorstelling/details/" + voorstellingId;
        }
        return "redirect:/planner/voorstelling/details/" + voorstellingId;
    }


























/*    @PostMapping("/taken/toevoegen")
    protected String saveOrUpdateTakenBijVoorstelling(TaakSelectie taakSelectie, BindingResult result, HttpServletRequest request) {
        Integer voorstellingId = (Integer)(request.getSession().getAttribute("voorstellingId"));
        Voorstelling voorstelling = voorstellingRepository.findById(voorstellingId).get();

        if (!result.hasErrors()) {

            int bar = taakSelectie.getBar();
            int kaartVerkoop = taakSelectie.getKaartverkoop();
            int garderobe = taakSelectie.getGarderobe();

            takenOpslaanBijVoorstelling(bar, voorstelling, taakRepository.findByTaakNaam("Bar"));
            takenOpslaanBijVoorstelling(kaartVerkoop, voorstelling, taakRepository.findByTaakNaam("Kaartverkoop"));
            takenOpslaanBijVoorstelling(garderobe, voorstelling, taakRepository.findByTaakNaam("Garderobe"));

        } else {
        }
        return "redirect:/voorstellingen";
    }

    protected void takenOpslaanBijVoorstelling(int taakAantal, Voorstelling voorstelling, Taak taak) {

        for (int i = 0; i < taakAantal; i++) {
            VoorstellingsTaak voorstellingsTaak = new VoorstellingsTaak();
            voorstellingsTaak.setTaak(taak);
            voorstellingsTaak.setVoorstelling(voorstelling);
            voorstellingsTaakRepository.save(voorstellingsTaak);
        }
    }*/
}
