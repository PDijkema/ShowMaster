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

    @Test
    void saveOrUpdateVoorstelling() {

        //arrange
        Voorstelling voorstelling2 = new Voorstelling();
        LocalDateTime datum = LocalDateTime.of(2020, Month.OCTOBER, 10, 20, 30);
        voorstelling2.setNaam("Lion King");
        voorstelling2.setDatum(datum);

        //activate
        voorstellingController.saveOrUpdateVoorstelling(voorstelling2);

        //assert
        Assert.assertNotNull(voorstellingRepository.findById(voorstelling2.getVoorstellingId()));
    }

    @Test
    void alleVoorstellingen() {
        Assert.assertNotNull(voorstellingController);

    }
}