package nl.makeitwork.Showmaster.controller;

import nl.makeitwork.Showmaster.model.Taak;
import nl.makeitwork.Showmaster.repository.TaakRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
            return "redirect:/takenLijst";
        } else {
            return "taakAanmaken";
        }
    }

    @GetMapping("/takenlijst")
    protected String showTakenlijst(Model model){
        model.addAttribute("alleTaken", taakRepository.findAll());
        model.addAttribute("taak", new Taak());
        return "takenlijst";
    }

    @GetMapping("/taak/setup")
    protected String setupTakenInDatabase() {
        Taak taak1 = new Taak();
        taak1.setTaakNaam("Bar");
        taak1.setStandaardBezetting(2);
        taakRepository.save(taak1);

        Taak taak2 = new Taak();
        taak2.setTaakNaam("Kaartverkoop");
        taak2.setStandaardBezetting(1);
        taakRepository.save(taak2);

        Taak taak3 = new Taak();
        taak3.setTaakNaam("Kaartcontrole");
        taak3.setStandaardBezetting(1);
        taakRepository.save(taak3);

        Taak taak4 = new Taak();
        taak4.setTaakNaam("Garderobe");
        taak4.setStandaardBezetting(2);
        taakRepository.save(taak4);

        Taak taak5 = new Taak();
        taak5.setTaakNaam("Foto");
        taak5.setStandaardBezetting(1);
        taakRepository.save(taak5);

        Taak taak6 = new Taak();
        taak6.setTaakNaam("Backstage");
        taak6.setStandaardBezetting(1);
        taakRepository.save(taak6);

        Taak taak7 = new Taak();
        taak7.setTaakNaam("Catering");
        taak7.setStandaardBezetting(2);
        taakRepository.save(taak7);

        Taak taak8 = new Taak();
        taak8.setTaakNaam("Steward");
        taak8.setStandaardBezetting(1);
        taakRepository.save(taak8);

        return "redirect:/takenlijst";
    }

}
