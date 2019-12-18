package nl.makeitwork.Showmaster.controller;


import nl.makeitwork.Showmaster.model.Medewerker;
import nl.makeitwork.Showmaster.repository.MedewerkerRepository;

import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;


import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;

@RunWith(SpringRunner.class)
@SpringBootTest
@TestPropertySource(locations = "classpath:test.properties")
class MedewerkerControllerTest {

    @Autowired
    MedewerkerController medewerkerController;

    @Autowired
    MedewerkerRepository medewerkerRepository;


    @Test
    void showRegistratieFormulier() {
        Assert.assertNotNull(medewerkerController);
    }


    @Test
    void saveGebruiker() {
        Medewerker medewerker = new Medewerker();
        medewerker.setGebruikersnaam("test");
        medewerker.setWachtwoord("test");
        medewerkerController.saveGebruiker(medewerker);

        Optional<Medewerker> opgehaaldeMedewerker = medewerkerRepository.findByGebruikersnaam("test");

        Assert.assertNotNull(opgehaaldeMedewerker);
    }


    @Test
    void saveOrUpdateMedewerker() {
        Medewerker medewerker = new Medewerker();
        medewerker.setVoornaam("Piet");
        medewerker.setTussenvoegsel("de");
        medewerker.setAchternaam("Vries");
        medewerker.setEmailadres("pdevries@blabla.com");
        //dit moet nog gecheckt
       // medewerker.setGeboortedatum(new LocalDate(1956,8,01));
        medewerker.setStraatnaam("Rondweg");
        medewerker.setHuisnummer(2);
        medewerker.setPostcode("8607HH");
        medewerker.setWoonplaats("Putten");
        medewerker.setTelefoonnummer("06-84431841");

        medewerkerController.saveOrUpdateMedewerker(medewerker, null);

        Optional<Medewerker> opgehaaldeMedewerker = medewerkerRepository.findByGebruikersnaam("test");

        Assert.assertNotNull(opgehaaldeMedewerker);
    }
}