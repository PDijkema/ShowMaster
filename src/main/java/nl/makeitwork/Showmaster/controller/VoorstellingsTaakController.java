package nl.makeitwork.Showmaster.controller;

import nl.makeitwork.Showmaster.model.Taak;
import nl.makeitwork.Showmaster.model.Voorstelling;
import nl.makeitwork.Showmaster.model.VoorstellingsTaak;
import nl.makeitwork.Showmaster.repository.TaakRepository;
import nl.makeitwork.Showmaster.repository.VoorstellingRepository;
import nl.makeitwork.Showmaster.repository.VoorstellingsTaakRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import java.util.Optional;


/**
 * @author Pieter Dijkema
 * beheren voorstellingsTaken
 */

@Controller
public class VoorstellingsTaakController {

    @Autowired
    private VoorstellingRepository voorstellingRepository;
    @Autowired
    private TaakRepository taakRepository;
    @Autowired
    private VoorstellingsTaakRepository voorstellingsTaakRepository;

    @GetMapping("/voorstellingsTaak/verwijderen/{voorstellingId}/{voorstellingsTaakId}")
    protected String verwijderenTaakBijVoorstelling(@PathVariable("voorstellingsTaakId") Integer voorstellingsTaakId,
                                                    @PathVariable("voorstellingId") Integer voorstellingId) {

        Optional<VoorstellingsTaak> voorstellingsTaak = voorstellingsTaakRepository.findById(voorstellingsTaakId);
        voorstellingsTaakRepository.deleteById(voorstellingsTaakId);

        return "redirect:/voorstelling/details/" + voorstellingId;
    }

    @GetMapping("/voorstellingsTaak/toevoegen/{voorstellingId}/{taakId}")
    protected String toevoegenTaakAanVoorstelling(@PathVariable("taakId") Integer taakId,
                                                  @PathVariable("voorstellingId") Integer voorstellingId) {

        Optional<Voorstelling> voorstelling = voorstellingRepository.findById(voorstellingId);
        Optional<Taak> taak = taakRepository.findById(taakId);

        VoorstellingsTaak voorstellingsTaak = new VoorstellingsTaak();
        voorstellingsTaak.setVoorstelling(voorstelling.get());
        voorstellingsTaak.setTaak(taak.get());

        voorstellingsTaakRepository.save(voorstellingsTaak);

        return "redirect:/voorstelling/details/" + voorstellingId;
    }


























/*    @PostMapping("/taken/toevoegen")
    protected String saveOrUpdateTakenBijVoorstelling(TaakSelectie taakSelectie, BindingResult result, HttpServletRequest request) {
        Integer voorstellingId = (Integer)(request.getSession().getAttribute("voorstellingId"));
        Voorstelling voorstelling = voorstellingRepository.findById(voorstellingId).get();

        if (!result.hasErrors()) {

            int bar = taakSelectie.getBar();
            int kaartVerkoop = taakSelectie.getKaartverkoop();
            int garderobe = taakSelectie.getGarderobe();

            takenOpslaanBijVoorstelling(bar, voorstelling, taakRepository.findByTaakNaam("Bar"));
            takenOpslaanBijVoorstelling(kaartVerkoop, voorstelling, taakRepository.findByTaakNaam("Kaartverkoop"));
            takenOpslaanBijVoorstelling(garderobe, voorstelling, taakRepository.findByTaakNaam("Garderobe"));

        } else {
        }
        return "redirect:/voorstellingen";
    }

    protected void takenOpslaanBijVoorstelling(int taakAantal, Voorstelling voorstelling, Taak taak) {

        for (int i = 0; i < taakAantal; i++) {
            VoorstellingsTaak voorstellingsTaak = new VoorstellingsTaak();
            voorstellingsTaak.setTaak(taak);
            voorstellingsTaak.setVoorstelling(voorstelling);
            voorstellingsTaakRepository.save(voorstellingsTaak);
        }
    }*/
}
