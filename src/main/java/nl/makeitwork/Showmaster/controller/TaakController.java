package nl.makeitwork.Showmaster.controller;

import nl.makeitwork.Showmaster.model.Taak;
import nl.makeitwork.Showmaster.model.Voorstelling;
import nl.makeitwork.Showmaster.model.VoorstellingsTaak;
import nl.makeitwork.Showmaster.repository.TaakRepository;
import nl.makeitwork.Showmaster.repository.VoorstellingRepository;
import nl.makeitwork.Showmaster.repository.VoorstellingsTaakRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Optional;

/**
 * @author Karin Zoetendal
 * 11-12-19: deze klasse checkt of alle tekstvelden zijn ingevuld en zorgt er dan voor dat een taak wordt opgeslagen in
 * de database.
 */

@Controller
public class TaakController {

    @Autowired
    public TaakRepository taakRepository;
    @Autowired
    private VoorstellingRepository voorstellingRepository;
    @Autowired
    private VoorstellingsTaakRepository voorstellingsTaakRepository;

    @GetMapping("/taak/aanmaken")
    protected String showTaakAanmaken(Taak taak) {
        return "taakAanmaken";
    }


    @PostMapping("/taak/aanmaken")
    protected String saveOrUpdateTaakAanmaken(Taak taak) {
        if (taak.getTaakNaam() != null && !taak.getTaakNaam().isEmpty() &&
                taak.getStandaardBezetting() != null) {
            taakRepository.save(taak);
            return "redirect:/takenlijst";
        } else {
            return "taakAanmaken";
        }
    }

    @GetMapping("/taak/add/{taakId}")
    protected String addTaak(@PathVariable("taakId") final Integer taakId, HttpServletRequest request ) {
        Optional<Taak> taak = taakRepository.findById(taakId);

        Integer voorstellingId = (Integer)(request.getSession().getAttribute("voorstellingId"));
        Voorstelling voorstelling = voorstellingRepository.findById(voorstellingId).get();

        if (taak.isPresent()){
            VoorstellingsTaak voorstellingsTaak = new VoorstellingsTaak();
            voorstellingsTaak.setVoorstelling(voorstelling);
            voorstellingsTaak.setTaak(taak.get());

            voorstellingsTaakRepository.save(voorstellingsTaak);
        }
        return "redirect:/voorstelling/details/{voorstellingId}";
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

        Taak taak4 = new Taak();
        taak4.setTaakNaam("Kaartcontrole");
        taak4.setStandaardBezetting(1);
        taakRepository.save(taak4);

        Taak taak3 = new Taak();
        taak3.setTaakNaam("Garderobe");
        taak3.setStandaardBezetting(1);
        taakRepository.save(taak3);

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

    @GetMapping("/taak/verwijderen/{taakId}")
    public String verwijderStandaardTaak(@PathVariable Integer taakId) {
        taakRepository.deleteById(taakId);
        return "redirect:/takenlijst";
    }

}
