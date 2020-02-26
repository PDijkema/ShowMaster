package nl.makeitwork.Showmaster.controller;

import nl.makeitwork.Showmaster.model.Medewerker;
import nl.makeitwork.Showmaster.model.MedewerkerInschrijvingVoorstelling;
import nl.makeitwork.Showmaster.model.Taak;
import nl.makeitwork.Showmaster.model.Voorstelling;
import nl.makeitwork.Showmaster.repository.MedewerkerInschrijvingVoorstellingRepository;
import nl.makeitwork.Showmaster.repository.MedewerkerRepository;
import nl.makeitwork.Showmaster.repository.TaakRepository;
import nl.makeitwork.Showmaster.repository.VoorstellingRepository;
import nl.makeitwork.Showmaster.service.MedewerkerService;
import nl.makeitwork.Showmaster.service.VoorstellingsTaakService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.time.LocalDateTime;
import java.time.Month;
import java.time.format.DateTimeFormatter;

@Controller
public class SetupController {

    @Autowired
    private MedewerkerService medewerkerService;
    @Autowired
    TaakRepository taakRepository;
    @Autowired
    private VoorstellingRepository voorstellingRepository;
    @Autowired
    @Qualifier("voorstellingsTaakService")
    private VoorstellingsTaakService voorstellingsTaakService;
    @Autowired
    private MedewerkerInschrijvingVoorstellingRepository medewerkerInschrijvingVoorstellingRepository;
    @Autowired
    MedewerkerRepository medewerkerRepository;

    @GetMapping("/setup")
    protected String setupTakenVoorstellingenMedewerkersInschrijvingen() {

        Taak taak1 = new Taak();
        taak1.setTaakNaam("Bar");
        taak1.setStandaardBezetting(2);

        Taak taak2 = new Taak();
        taak2.setTaakNaam("Kaartverkoop");
        taak2.setStandaardBezetting(1);

        Taak taak4 = new Taak();
        taak4.setTaakNaam("Kaartcontrole");
        taak4.setStandaardBezetting(1);

        Taak taak3 = new Taak();
        taak3.setTaakNaam("Garderobe");
        taak3.setStandaardBezetting(2);

        taakRepository.save(taak1);
        taakRepository.save(taak2);
        taakRepository.save(taak3);
        taakRepository.save(taak4);


        Medewerker medewerker1 = new Medewerker();
        medewerker1.setGebruikersnaam("gert@test.com");
        medewerker1.setWachtwoord("test1234");
        medewerker1.setWachtwoordBevestigen("test1234");
        medewerker1.setPlanner(true);
        medewerker1.getMedewerkerProfielGegevens().setVoornaam("Gert");
        medewerker1.getMedewerkerProfielGegevens().setAchternaam("Postma");
        medewerker1.getMedewerkerProfielGegevens().setVoorkeurstaak(taakRepository.findByTaakTaakNaam("Bar"));

        Medewerker medewerker2 = new Medewerker();
        medewerker2.setGebruikersnaam("pieter@test.com");
        medewerker2.setWachtwoord("test1234");
        medewerker2.setWachtwoordBevestigen("test1234");
        medewerker2.setPlanner(true);
        medewerker2.getMedewerkerProfielGegevens().setVoornaam("Pieter");
        medewerker2.getMedewerkerProfielGegevens().setAchternaam("Dijkema");
        medewerker1.getMedewerkerProfielGegevens().setVoorkeurstaak(taakRepository.findByTaakTaakNaam("Bar"));

        Medewerker medewerker3 = new Medewerker();
        medewerker3.setGebruikersnaam("karin@test.com");
        medewerker3.setWachtwoord("test1234");
        medewerker3.setWachtwoordBevestigen("test1234");
        medewerker3.setPlanner(true);
        medewerker3.getMedewerkerProfielGegevens().setVoornaam("Karin");
        medewerker3.getMedewerkerProfielGegevens().setAchternaam("Zoetendal");
        medewerker1.getMedewerkerProfielGegevens().setVoorkeurstaak(taakRepository.findByTaakTaakNaam("Bar"));

        Medewerker medewerker4 = new Medewerker();
        medewerker4.setGebruikersnaam("tabitha@test.com");
        medewerker4.setWachtwoord("test1234");
        medewerker4.setWachtwoordBevestigen("test1234");
        medewerker4.setPlanner(true);
        medewerker4.getMedewerkerProfielGegevens().setVoornaam("Tabitha");
        medewerker4.getMedewerkerProfielGegevens().setAchternaam("Krist-Kainama");
        medewerker4.getMedewerkerProfielGegevens().setVoorkeurstaak(taakRepository.findByTaakTaakNaam("Kaartverkoop"));

        Medewerker medewerker5 = new Medewerker();
        medewerker5.setGebruikersnaam("wouter@test.com");
        medewerker5.setWachtwoord("test1234");
        medewerker5.setWachtwoordBevestigen("test1234");
        medewerker5.setPlanner(true);
        medewerker5.getMedewerkerProfielGegevens().setVoornaam("Wouter");
        medewerker5.getMedewerkerProfielGegevens().setAchternaam("Meindertsma");

        Medewerker medewerker6 = new Medewerker();
        medewerker6.setGebruikersnaam("daniel@test.com");
        medewerker6.setWachtwoord("test1234");
        medewerker6.setWachtwoordBevestigen("test1234");
        medewerker6.setPlanner(true);
        medewerker6.getMedewerkerProfielGegevens().setVoornaam("Daniël");
        medewerker6.getMedewerkerProfielGegevens().setAchternaam("Kuperus");

        medewerkerService.save(medewerker1);
        medewerkerService.save(medewerker2);
        medewerkerService.save(medewerker3);
        medewerkerService.save(medewerker4);
        medewerkerService.save(medewerker5);
        medewerkerService.save(medewerker6);

        Voorstelling voorstelling1 = new Voorstelling();

        voorstelling1.setNaam("Lordi - + Almanac + Flesh Roxon");
        voorstelling1.setLocalDateTime(LocalDateTime.of(2020, Month.MARCH, 7, 21, 0));
        voorstelling1.setStatus("Gepubliceerd");

        DateTimeFormatter aFormatter = DateTimeFormatter.ofPattern("dd MMMM yyyy HH:mm");
        LocalDateTime localDateTime = voorstelling1.getLocalDateTime();
        String formattedString = localDateTime.format(aFormatter);

        voorstelling1.setDatum(formattedString);

        voorstellingRepository.save(voorstelling1);

        for (Taak taak : taakRepository.findAll()) {
            voorstellingsTaakService.standaardTaakOpslaanBijVoorstelling(taak.getStandaardBezetting(), voorstelling1, taak);
        }

        Voorstelling voorstelling2 = new Voorstelling();

        voorstelling2.setNaam("Hit The North/ Diamond Head");
        voorstelling2.setLocalDateTime(LocalDateTime.of(2020, Month.MARCH, 8, 21, 0));
        voorstelling2.setStatus("Gepubliceerd");

        LocalDateTime localDateTime2 = voorstelling2.getLocalDateTime();
        String formattedString2 = localDateTime2.format(aFormatter);

        voorstelling2.setDatum(formattedString2);

        voorstellingRepository.save(voorstelling2);

        for (Taak taak : taakRepository.findAll()) {
            voorstellingsTaakService.standaardTaakOpslaanBijVoorstelling(taak.getStandaardBezetting(), voorstelling2, taak);
        }

        Voorstelling voorstelling3 = new Voorstelling();

        voorstelling3.setNaam("Comedy Club Sneek #6 - Knock Out Comedy Crew");
        voorstelling3.setLocalDateTime(LocalDateTime.of(2020, Month.MARCH, 13, 21, 0));
        voorstelling3.setStatus("Gepubliceerd");

        LocalDateTime localDateTime3 = voorstelling3.getLocalDateTime();
        String formattedString3 = localDateTime3.format(aFormatter);

        voorstelling3.setDatum(formattedString3);

        voorstellingRepository.save(voorstelling3);

        for (Taak taak : taakRepository.findAll()) {
            voorstellingsTaakService.standaardTaakOpslaanBijVoorstelling(taak.getStandaardBezetting(), voorstelling2, taak);
        }

        for (Medewerker medewerker :medewerkerRepository.findAll()) {
            MedewerkerInschrijvingVoorstelling medewerkerInschrijvingVoorstelling =
                    new MedewerkerInschrijvingVoorstelling(medewerker, voorstelling1, "Beschikbaar");
            medewerkerInschrijvingVoorstellingRepository.save(medewerkerInschrijvingVoorstelling);
        }

        return "redirect:/";
    }
}
