package nl.makeitwork.Showmaster.controller;

import nl.makeitwork.Showmaster.model.Taak;
import nl.makeitwork.Showmaster.model.Voorstelling;
import nl.makeitwork.Showmaster.model.VoorstellingsTaak;
import nl.makeitwork.Showmaster.repository.TaakRepository;
import nl.makeitwork.Showmaster.repository.VoorstellingRepository;
import nl.makeitwork.Showmaster.repository.VoorstellingsTaakRepository;
import nl.makeitwork.Showmaster.service.VoorstellingsTaakService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Optional;

/**
 * @author Karin Zoetendal
 * 13-02-20: met deze klasse kan een standaardtaak worden aangemaakt, gewijzigd of verwijderd
 * Bij het aanpassen van standaardbezetting, of verwijderen van een standaardtaak, worden deze veranderingen ook
 * doorgevoerd bij ongepubliceerde voorstellingen
 */

@Controller
public class TaakController {

    @Autowired
    private TaakRepository taakRepository;
    @Autowired
    private VoorstellingRepository voorstellingRepository;
    @Autowired
    private VoorstellingsTaakRepository voorstellingsTaakRepository;
    @Autowired
    @Qualifier("voorstellingsTaakService")
    private VoorstellingsTaakService voorstellingsTaakService;

    @GetMapping("/planner/taak/beheer")
    protected String showAlleTaken(Model model, Boolean ingeplandBijGepubliceerdeVoorstelling) {
        List<VoorstellingsTaak> voorstellingsTaakBijGepubliceerdeVoorstelling = voorstellingsTaakRepository.findByVoorstellingStatus("Gepubliceerd");
        List<Taak> alleTaken = taakRepository.findAll();

            for (Taak taak : alleTaken) {
                if (voorstellingsTaakBijGepubliceerdeVoorstelling.contains(taak)) {
                    ingeplandBijGepubliceerdeVoorstelling = true;
                } else {
                    ingeplandBijGepubliceerdeVoorstelling = false;
                }
                model.addAttribute("ingeplandBijGepubliceerdeVoorstelling", ingeplandBijGepubliceerdeVoorstelling);
            }

        model.addAttribute("alleTaken", alleTaken);
        return "taakBeheer";
    }

    @GetMapping("/planner/taak/aanmaken")
    protected String showTaakAanmaken(Taak taak) {
        return "taakAanmaken";
    }


    @PostMapping("/planner/taak/aanmaken")
    protected String saveOrUpdateTaak(Taak taak) {
        if (taak.getTaakNaam() != null && !taak.getTaakNaam().isEmpty() &&
                taak.getStandaardBezetting() != null) {
            taakRepository.save(taak);
            return "redirect:/rooster";
        } else {
            return "taakAanmaken";
        }
    }

    @GetMapping("/planner/taak/wijzigen/{taakId}")
    protected String wijzigenTaak(@PathVariable Integer taakId, Model model, HttpServletRequest request) {

        Optional<Taak> taak = taakRepository.findById(taakId);
        if (!taak.isPresent()) {
            return "redirect:/planner/taak/beheer";
        } else {
            request.getSession().setAttribute("taakId", taakId);
            model.addAttribute("taak", taak.get());
            return "wijzigTaak";
        }
    }

    @PostMapping("/planner/taak/wijzigen")
    protected String UpdateTaak(@ModelAttribute("taak") Taak taak, BindingResult result) {

        if (!result.hasErrors()) {

            taakRepository.save(taak);

            for (Voorstelling voorstelling : voorstellingRepository.findAllByStatus("Ongepubliceerd")) {

                Integer nieuweStandaardBezetting = taak.getStandaardBezetting();
                Integer aantalKeerIngeplandAlsVoorstellingsTaak =
                        voorstellingsTaakRepository.countByVoorstellingVoorstellingIdAndTaakTaakId(voorstelling.getVoorstellingId(), taak.getTaakId());

                if (nieuweStandaardBezetting > aantalKeerIngeplandAlsVoorstellingsTaak) {
                    voorstellingsTaakService.standaardTaakOpslaanBijVoorstelling((nieuweStandaardBezetting-aantalKeerIngeplandAlsVoorstellingsTaak), voorstelling, taak);
                } else if (nieuweStandaardBezetting.equals(aantalKeerIngeplandAlsVoorstellingsTaak)) {

                } else {
                    voorstellingsTaakRepository.deleteByTaakAndVoorstelling(taak, voorstelling);
                    voorstellingsTaakService.standaardTaakOpslaanBijVoorstelling(nieuweStandaardBezetting, voorstelling, taak);
                }
            }
        } else {
            return "wijzigTaak";
        }
        return "redirect:/planner/taak/beheer";
    }

    @GetMapping("/planner/taak/verwijderen/{taakId}")
    public String verwijderStandaardTaak(@PathVariable Integer taakId) {
        voorstellingsTaakRepository.deleteByTaakTaakIdAndVoorstellingStatus(taakId, "Ongepubliceerd");
        taakRepository.deleteById(taakId);
        return "redirect:/planner/taak/beheer";
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
        taak5.setStandaardBezetting(0);
        taakRepository.save(taak5);

        Taak taak6 = new Taak();
        taak6.setTaakNaam("Backstage");
        taak6.setStandaardBezetting(0);
        taakRepository.save(taak6);

        Taak taak7 = new Taak();
        taak7.setTaakNaam("Catering");
        taak7.setStandaardBezetting(0);
        taakRepository.save(taak7);

        Taak taak8 = new Taak();
        taak8.setTaakNaam("Steward");
        taak8.setStandaardBezetting(0);
        taakRepository.save(taak8);

        return "redirect:/rooster";
    }

}
