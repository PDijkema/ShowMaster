package nl.makeitwork.Showmaster.controller;


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
import org.springframework.web.bind.annotation.PostMapping;

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

    @GetMapping("/taken/weergeven/opentaken")
    public String nietIngevuldeTakenOphalen (Model model){
        List<VoorstellingsTaak> voorstellingsTaken = voorstellingsTaakRepository.findAll();
        List<Voorstelling> voorstellingen = voorstellingRepository.findAll();


        voorstellingsTaken.removeIf(r -> r.getMedewerker() != null);



        model.addAttribute("voorstellingLijst", voorstellingen);

        return "openVoorstellingsTaken";
    }

    @PostMapping("/taken/weergeven/opentaken")
    public String saveGebruiker(@ModelAttribute(value = "voorstelling") Voorstelling voorstelling, Model model, BindingResult bindingResult) {


        System.out.println(voorstelling.getNaam());



        return "redirect:/taken/weergeven/opentaken";
    }


}
