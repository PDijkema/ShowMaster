package nl.makeitwork.Showmaster.controller;

import io.github.millij.poi.SpreadsheetReadException;
import nl.makeitwork.Showmaster.model.Voorstelling;
import nl.makeitwork.Showmaster.repository.VoorstellingRepository;
import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;

import java.io.File;



/**
 * @author Karin Zoetendal
 * deze test gaat er vanuit dat de aangeleverde data in de Excelfile correct is, foutieve data worden dus niet getest
 */

@RunWith(SpringRunner.class)
@SpringBootTest
@TestPropertySource(locations = "classpath:test.properties")
class ExcelControllerTest {

    @Autowired
    ExcelController excelController;

    @Autowired
    VoorstellingRepository voorstellingRepository;

    @Test
    public void readExcelXlsx() throws SpreadsheetReadException {
        //Arrange
        ClassLoader classLoader = this.getClass().getClassLoader();

        File testBestand1 = new File(classLoader.getResource("testVoorstellingen1.xlsx").getFile());
        File testBestand2 = new File(classLoader.getResource("testVoorstellingen2.xlsx").getFile());

        //activate
        excelController.readExcelXlsx(testBestand1.getAbsolutePath());
        excelController.readExcelXlsx(testBestand2.getAbsolutePath());

        Voorstelling opgehaaldeVoorstelling = voorstellingRepository.findByNaam("Lordi - + Almanac + Flesh Roxon");
        Voorstelling tweedeOpgehaaldeVoorstelling = voorstellingRepository.findByNaam("Hit The North/ Diamond Head");

        //assert
        Assert.assertNotNull(opgehaaldeVoorstelling);

    }
}
