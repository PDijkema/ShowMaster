package nl.makeitwork.Showmaster.controller;


import nl.makeitwork.Showmaster.model.Medewerker;
import nl.makeitwork.Showmaster.model.MedewerkerInschrijvingVoorstelling;
import nl.makeitwork.Showmaster.model.Voorstelling;
import nl.makeitwork.Showmaster.model.VoorstellingsTaak;
import nl.makeitwork.Showmaster.repository.MedewerkerInschrijvingVoorstellingRepository;
import nl.makeitwork.Showmaster.repository.TaakRepository;
import nl.makeitwork.Showmaster.repository.VoorstellingRepository;
import nl.makeitwork.Showmaster.repository.VoorstellingsTaakRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.LinkedList;
import java.util.List;


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

    @GetMapping("/voorstelling/weergeven/openvoorstelling")
    public String openVoorstellingenOphalen(Model model, @AuthenticationPrincipal Medewerker ingelogdeMedewerker) {

        List<Voorstelling> voorstellingen = voorstellingRepository.findAll();

        List<MedewerkerInschrijvingVoorstelling> medewerkerInschrijvingVoorstellingList = medewerkerInschrijvingVoorstellingRepository.findInschrijvingByMedewerkerId(ingelogdeMedewerker.getMedewerkerId());

        medewerkerInschrijvingVoorstellingList.forEach(r->voorstellingen.remove(r.getVoorstelling()));

        medewerkerInschrijvingVoorstellingList.forEach(r->r.getVoorstelling().getNaam());




        model.addAttribute("inschrijvingen",medewerkerInschrijvingVoorstellingList);
        model.addAttribute("voorstellingLijst", voorstellingen);

        return "openVoorstellingen";
    }

    @GetMapping("/voorstelling/weergeven/openvoorstelling/inschrijven/{voorstellingId}")
    public String inschrijvenVoorstelling(@PathVariable Integer voorstellingId, @AuthenticationPrincipal Medewerker ingelogdeMedewerker) {

        List<MedewerkerInschrijvingVoorstelling> medewerkerInschrijvingVoorstellingList = medewerkerInschrijvingVoorstellingRepository.findAll();

        if (!medewerkerInschrijvingVoorstellingList.isEmpty()) {
            if (medewerkerInschrijvingVoorstellingList.stream().anyMatch(r ->
                    r.getVoorstelling().getVoorstellingId().equals(voorstellingId) &&
                            r.getMedewerker().getMedewerkerId().equals(ingelogdeMedewerker.getMedewerkerId()))) {
                return "redirect:/voorstelling/weergeven/openvoorstelling";
            }
        }

        Voorstelling voorstelling = voorstellingRepository.findByVoorstellingId(voorstellingId);
        MedewerkerInschrijvingVoorstelling medewerkerInschrijvingVoorstelling = new MedewerkerInschrijvingVoorstelling();
        medewerkerInschrijvingVoorstelling.setMedewerker(ingelogdeMedewerker);
        medewerkerInschrijvingVoorstelling.setVoorstelling(voorstelling);

        medewerkerInschrijvingVoorstellingRepository.save(medewerkerInschrijvingVoorstelling);
        return "redirect:/voorstelling/weergeven/openvoorstelling";
    }
}



