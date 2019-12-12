package nl.makeitwork.Showmaster.controller;

import nl.makeitwork.Showmaster.model.Voorstelling;
import nl.makeitwork.Showmaster.repository.VoorstellingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;


@Controller
public class VoorstellingController {

    @Autowired
    VoorstellingRepository voorstellingRepository;

    @GetMapping("/voorstelling/toevoegen")
    protected String showBooks(Model model){
        model.addAttribute("alleVoorstellingen", voorstellingRepository.findAll());
        model.addAttribute("voorstelling", new Voorstelling());
        return "nieuweVoorstelling";
    }

    @PostMapping("/voorstelling/toevoegen")
    protected String saveOrUpdateVoorstelling(@ModelAttribute("voorstelling") Voorstelling voorstelling, BindingResult result){
        if (result.hasErrors()) {
            return "nieuweVoorstelling";
        } else {
            System.out.println(voorstelling.getDatum());
            voorstellingRepository.save(voorstelling);
            return "redirect:/voorstelling/toevoegen";
        }
    }



}
