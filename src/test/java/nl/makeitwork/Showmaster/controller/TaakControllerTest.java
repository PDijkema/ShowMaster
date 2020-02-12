package nl.makeitwork.Showmaster.controller;

import nl.makeitwork.Showmaster.model.Taak;
import nl.makeitwork.Showmaster.repository.TaakRepository;
import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Optional;


@RunWith(SpringRunner.class)
@SpringBootTest
@TestPropertySource(locations = "classpath:test.properties")
class TaakControllerTest {


    @Autowired
    TaakController taakController;

    @Autowired
    TaakRepository taakRepository;

    @Test
    public void testShowTaakAanmaken() throws Exception {
        Assert.assertNotNull(taakController);
    }

    @Test
    public void testSaveOrUpdateTaak() {
        //Arrange
        Taak testTaak = new Taak();
        testTaak.setTaakNaam("Bar");
        testTaak.setStandaardBezetting(2);

        //activate
        taakController.saveOrUpdateTaak(testTaak);


        Optional<Taak> opgehaaldeTaak = taakRepository.findById(testTaak.getTaakId());

        //assert
        Assert.assertNotNull(opgehaaldeTaak);

    }
}