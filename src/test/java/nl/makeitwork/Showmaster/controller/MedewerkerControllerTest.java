package nl.makeitwork.Showmaster.controller;


import nl.makeitwork.Showmaster.model.Medewerker;
import nl.makeitwork.Showmaster.repository.MedewerkerRepository;

import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;


import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;

@RunWith(SpringRunner.class)
@SpringBootTest
@TestPropertySource(locations = "classpath:test.properties")
@AutoConfigureMockMvc
class MedewerkerControllerTest {

    @Autowired
    MedewerkerController medewerkerController;

    @Autowired
    MedewerkerRepository medewerkerRepository;

    @Autowired
    private MockMvc mockMvc;

    @Test
    void showRegistratieFormulier() {
        Assert.assertNotNull(medewerkerController);
    }



    /*@Test
    void saveGebruiker() {
        Medewerker medewerker = new Medewerker();
        medewerker.setGebruikersnaam("test");
        medewerker.setWachtwoord("test");
        medewerkerController.saveGebruiker(medewerker);

        Optional<Medewerker> opgehaaldeMedewerker = medewerkerRepository.findByGebruikersnaam("test");

        Assert.assertNotNull(opgehaaldeMedewerker);
    }*/
}