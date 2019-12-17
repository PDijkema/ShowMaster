package nl.makeitwork.Showmaster.controller;

import nl.makeitwork.Showmaster.model.Voorstelling;
import nl.makeitwork.Showmaster.repository.VoorstellingRepository;
import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.validation.BindingResult;

import javax.naming.Binding;
import java.time.LocalDateTime;
import java.time.Month;


@RunWith(SpringRunner.class)
@SpringBootTest
@TestPropertySource(locations = "classpath:test.properties")
class VoorstellingControllerTest {

    @Autowired
    private VoorstellingController voorstellingController;

    @Autowired
    private VoorstellingRepository voorstellingRepository;

/*
    @Test
    void saveorupdateVoorstelling() {

        //arrange
        BindingResult result
        Voorstelling voorstelling = new Voorstelling();
        LocalDateTime datum = LocalDateTime.of(2020, Month.OCTOBER, 10, 20, 30);
        voorstelling.setNaam("Lion King");
        voorstelling.setDatum(datum);

        //activate
        voorstellingController.saveOrUpdateVoorstelling(voorstelling, BindingResult result);

        //assert
        Assert.assertNotNull(voorstellingRepository.findById(voorstelling.getVoorstellingId()));
    }
*/

    @Test
    void alleVoorstellingen() {
        Assert.assertNotNull(voorstellingController);

    }


/*    @Test
    void verwijderVoorstelling() {

        //arrange
        Voorstelling voorstelling = new Voorstelling();
        LocalDateTime datum = LocalDateTime.of(2020, Month.JANUARY, 18, 20, 30);
        voorstelling.setNaam("Soldaat van Oranje");
        voorstelling.setDatum(datum);

        //activate
        voorstellingController.saveOrUpdateVoorstelling(voorstelling);
        voorstellingController.verwijderVoorstelling(voorstelling.getVoorstellingId());

        //assert
        Assert.assertFalse(voorstellingRepository.existsById(voorstelling.getVoorstellingId()));

    }*/
}