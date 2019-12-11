package nl.makeitwork.Showmaster.controller;

import nl.makeitwork.Showmaster.model.Medewerker;
import nl.makeitwork.Showmaster.repository.MedewerkerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;


@Controller
public class MedewerkerController {

    @Autowired
    MedewerkerRepository medewerkerRepository;

    @GetMapping("/registreer")
    protected String registreer(Model model) {
        model.addAttribute("userForm",new Medewerker());
        return "registratieFormulier";
    }

    @PostMapping("/registreer")
    public String registreer (@ModelAttribute("userForm")Medewerker userForm, BindingResult bindingResult){
        if (bindingResult.hasErrors()) {
            return "registration";
        }
        medewerkerRepository.save(userForm);
        return "registratieFormulier";
    }



    }






