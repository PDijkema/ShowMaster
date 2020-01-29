package nl.makeitwork.Showmaster.controller;

import nl.makeitwork.Showmaster.repository.VoorstellingRepository;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.jupiter.api.Assertions.*;

@RunWith(SpringRunner.class)
@SpringBootTest
@TestPropertySource(locations = "classpath:test.properties")
class ExcelControllerTest {

    @Autowired
    VoorstellingController voorstellingController;

    @Autowired
    VoorstellingRepository voorstellingRepository;

    @Test
    void testUploadFile() {
    }

    @Test
    void testExcelVoorstellingToevoegen() {
    }

    @Test
    void testReadExcelXlsx() {
    }

    @Test
    void datumStringFormatterenNaarLocalDateTime() {
    }
}