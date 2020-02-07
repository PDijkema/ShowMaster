package nl.makeitwork.Showmaster.controller;

import nl.makeitwork.Showmaster.model.Medewerker;
import nl.makeitwork.Showmaster.model.MedewerkerInschrijvingVoorstelling;
import nl.makeitwork.Showmaster.model.Voorstelling;
import nl.makeitwork.Showmaster.repository.MedewerkerInschrijvingVoorstellingRepository;
import nl.makeitwork.Showmaster.repository.TaakRepository;
import nl.makeitwork.Showmaster.repository.VoorstellingRepository;
import nl.makeitwork.Showmaster.repository.VoorstellingsTaakRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
public class MedewerkerInschrijvingVoorstellingController {

    @Autowired
    private VoorstellingRepository voorstellingRepository;
    @Autowired
    private TaakRepository taakRepository;
    @Autowired
    private VoorstellingsTaakRepository voorstellingsTaakRepository;
    @Autowired
    private MedewerkerInschrijvingVoorstellingRepository medewerkerInschrijvingVoorstellingRepository;

    @GetMapping("/rooster/openvoorstelling")
    public String openVoorstellingenOphalen(Model model, @AuthenticationPrincipal Medewerker ingelogdeMedewerker) {

        List<Voorstelling> voorstellingen = voorstellingRepository.findAll();

        List<MedewerkerInschrijvingVoorstelling> medewerkerInschrijvingVoorstellingList = medewerkerInschrijvingVoorstellingRepository.findInschrijvingByMedewerkerId(ingelogdeMedewerker.getMedewerkerId());

        medewerkerInschrijvingVoorstellingList.forEach(r -> voorstellingen.remove(r.getVoorstelling()));

        medewerkerInschrijvingVoorstellingList.forEach(r -> r.getVoorstelling().getNaam());

        model.addAttribute("aantalVoorstellingsTaken", voorstellingenMetAantalVoorstellingsTaken());
        model.addAttribute("aantalInschrijvingen", voorstellingenMetAantalInschrijvingen());
        model.addAttribute("inschrijvingen", medewerkerInschrijvingVoorstellingList);
        model.addAttribute("voorstellingLijst", voorstellingen);

        return "openVoorstellingen";
    }

    @GetMapping("/rooster/openvoorstelling/inschrijven/{voorstellingId}/{inschrijvingStatus}")
    public String inschrijvenVoorstelling(@PathVariable Integer voorstellingId, @PathVariable String inschrijvingStatus, @AuthenticationPrincipal Medewerker ingelogdeMedewerker) {

        MedewerkerInschrijvingVoorstelling alIngeschrevenMedewerker = medewerkerInschrijvingVoorstellingRepository.findByVoorstellingVoorstellingIdAndMedewerkerMedewerkerId(voorstellingId, ingelogdeMedewerker.getMedewerkerId());

        if (inschrijvingStatus.matches("Beschikbaar|Misschien|Niet Beschikbaar")) {
            if (alIngeschrevenMedewerker != null) {
                alIngeschrevenMedewerker.setInschrijvingStatus(inschrijvingStatus);
                medewerkerInschrijvingVoorstellingRepository.save(alIngeschrevenMedewerker);
            } else {
                Voorstelling voorstelling = voorstellingRepository.findByVoorstellingId(voorstellingId);
                MedewerkerInschrijvingVoorstelling medewerkerInschrijvingVoorstelling =
                        new MedewerkerInschrijvingVoorstelling(ingelogdeMedewerker, voorstelling, inschrijvingStatus);
                medewerkerInschrijvingVoorstellingRepository.save(medewerkerInschrijvingVoorstelling);
            }
        }
        return "redirect:/rooster/openvoorstelling";
    }

    private Map<Integer, Integer> voorstellingenMetAantalVoorstellingsTaken() {
        Map<Integer, Integer> aantalVoorstellingstaken = new HashMap<>();

        for (Voorstelling voorstelling : voorstellingRepository.findAll()) {
            aantalVoorstellingstaken.put(voorstelling.getVoorstellingId(), voorstellingsTaakRepository.countByVoorstellingVoorstellingId(voorstelling.getVoorstellingId()));
        }
        return aantalVoorstellingstaken;
    }

    private Map<Integer, Integer> voorstellingenMetAantalInschrijvingen() {
        Map<Integer, Integer> aantalInschrijvingen = new HashMap<>();

        for (Voorstelling voorstelling : voorstellingRepository.findAll()) {
            aantalInschrijvingen.put(voorstelling.getVoorstellingId(), medewerkerInschrijvingVoorstellingRepository.countByVoorstellingVoorstellingId(voorstelling.getVoorstellingId()));
        }
        return aantalInschrijvingen;
    }
}




