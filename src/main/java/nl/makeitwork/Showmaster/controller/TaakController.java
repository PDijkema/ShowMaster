package nl.makeitwork.Showmaster.controller;

import nl.makeitwork.Showmaster.model.Taak;
import nl.makeitwork.Showmaster.repository.TaakRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TaakController {

    @Autowired
    public TaakRepository taakRepository;

    @GetMapping("/taak/aanmaken")
    protected String showTaakAanmaken(Taak taak) {
        if (taak.getTaakNaam() != null && !taak.getTaakNaam().isEmpty() &&
                taak.getStandaardBezetting() != null) {
            taakRepository.save(taak);
            return "redirect:/taak";
        } else {
            return "taakAanmaken";
        }
    }

}
