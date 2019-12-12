package nl.makeitwork.Showmaster.controller;

import nl.makeitwork.Showmaster.model.Taak;
import nl.makeitwork.Showmaster.repository.TaakRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

/**
 * @author Karin Zoetendal
 * 11-12-19: deze klasse checkt of alle tekstvelden zijn ingevuld en zorgt er dan voor dat een taak wordt opgeslagen in
 * de database.
 */

@Controller
public class TaakController {

    @Autowired
    public TaakRepository taakRepository;

    @GetMapping("/taak/aanmaken")
    protected String showTaakAanmaken(Taak taak) {
        return "taakAanmaken";
    }


    @PostMapping("/taak/aanmaken")
    protected String saveOrUpdateTaakAanmaken(Taak taak) {
        if (taak.getTaakNaam() != null && !taak.getTaakNaam().isEmpty() &&
                taak.getStandaardBezetting() != null) {
            taakRepository.save(taak);
            return "redirect:/taak";
        } else {
            return "taakAanmaken";
        }
    }
}
