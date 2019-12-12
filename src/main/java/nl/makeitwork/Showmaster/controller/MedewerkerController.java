package nl.makeitwork.Showmaster.controller;

import nl.makeitwork.Showmaster.model.Medewerker;
import nl.makeitwork.Showmaster.repository.MedewerkerRepository;
import nl.makeitwork.Showmaster.validator.MedewerkerValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;


/**
 * @Author Gert Postma
 */
@Controller
public class MedewerkerController {

    @Autowired
    MedewerkerValidator medewerkerValidator;

    @Autowired
    MedewerkerRepository medewerkerRepository;

    @GetMapping("/registreer")
    protected String showRegistratieFormulier(Model model) {
        model.addAttribute("registratieFormulier",new Medewerker());
        return "registratieFormulier";
    }

    @PostMapping("/registreer")
    public String saveGebruiker (@ModelAttribute("registratieFormulier")Medewerker registratieFormulier, BindingResult bindingResult){
        medewerkerValidator.validate(registratieFormulier,bindingResult);

        if (bindingResult.hasErrors()){
            return "registratieFormulier";
        }

        medewerkerRepository.save(registratieFormulier);
        return "redirect:/registreer";
    }



    }






