package nl.makeitwork.Showmaster.controller;

import nl.makeitwork.Showmaster.model.Taak;
import nl.makeitwork.Showmaster.model.Voorstelling;
import nl.makeitwork.Showmaster.model.VoorstellingsTaak;
import nl.makeitwork.Showmaster.repository.VoorstellingsTaakRepository;
import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.validation.BindingResult;

import java.time.LocalDateTime;
import java.time.Month;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

@RunWith(SpringRunner.class)
@WebAppConfiguration
@SpringBootTest
@AutoConfigureMockMvc
@TestPropertySource(locations = "classpath:test.properties")
class VoorstellingsTaakControllerTest {

    @Autowired
    private VoorstellingsTaakRepository voorstellingsTaakRepository;

    @Autowired
    private VoorstellingsTaakController voorstellingsTaakController;


    @Test
    void verwijderenTaakBijVoorstelling() {


        //Arrange
        BindingResult bindingResult = mock(BindingResult.class);
        when(bindingResult.hasErrors()).thenReturn(false);

        VoorstellingsTaak voorstellingsTaak = new VoorstellingsTaak();

        Voorstelling voorstelling = new Voorstelling();
        LocalDateTime datum = LocalDateTime.of(2020, Month.OCTOBER, 10, 20, 30);
        voorstelling.setNaam("Lion King");
        voorstelling.setDatum(datum);

        Taak testTaak = new Taak();
        testTaak.setTaakNaam("Bar");
        testTaak.setStandaardBezetting(2);

        voorstellingsTaak.setTaak(testTaak);
        voorstellingsTaak.setVoorstelling(voorstelling);

        //Activate & Assert

        voorstellingsTaakRepository.save(voorstellingsTaak);

        Assert.assertNotNull(voorstellingsTaakRepository.findById(voorstellingsTaak.getVoorstellingsTaakId()));

        voorstellingsTaakController.verwijderenTaakBijVoorstelling(voorstellingsTaak.getVoorstellingsTaakId(), voorstelling.getVoorstellingId());

        Assert.assertNull(voorstellingsTaakRepository.getOne(voorstellingsTaak.getVoorstellingsTaakId()));

    }
}