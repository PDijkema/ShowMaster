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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

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
    public String nietIngevuldeTakenOphalen (Model model){
        List<VoorstellingsTaak> voorstellingsTaken = voorstellingsTaakRepository.findAll();
        List<Voorstelling> voorstellingen = voorstellingRepository.findAll();


        voorstellingsTaken.removeIf(r -> r.getMedewerker() != null);



        model.addAttribute("voorstellingLijst", voorstellingen);

        return "openVoorstellingen";
    }

    @GetMapping("/voorstelling/weergeven/openvoorstelling/inschrijven/{voorstellingId}")
    public String inschrijvenVoorstelling(@PathVariable Integer voorstellingId, @AuthenticationPrincipal Medewerker ingelogdeMedewerker) {

       Voorstelling voorstelling = voorstellingRepository.findByVoorstellingId(voorstellingId);

       MedewerkerInschrijvingVoorstelling medewerkerInschrijvingVoorstelling = new MedewerkerInschrijvingVoorstelling();
       medewerkerInschrijvingVoorstelling.setMedewerker(ingelogdeMedewerker);
       medewerkerInschrijvingVoorstelling.setVoorstelling(voorstelling);
       medewerkerInschrijvingVoorstellingRepository.save(medewerkerInschrijvingVoorstelling);

        return "redirect:/voorstelling/weergeven/openvoorstelling";
    }

    @PostMapping("/voorstelling/weergeven/openvoorstelling")
    public String saveGebruiker(@ModelAttribute(value = "voorstellingen") Voorstelling voorstelling, Model model, BindingResult bindingResult) {




        System.out.println(voorstelling.getVoorstellingId());



        return "redirect:/voorstelling/weergeven/openvoorstelling";
    }


}
