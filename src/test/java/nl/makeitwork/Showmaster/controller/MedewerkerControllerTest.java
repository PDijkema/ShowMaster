package nl.makeitwork.Showmaster.controller;


import nl.makeitwork.Showmaster.model.Medewerker;
import nl.makeitwork.Showmaster.repository.MedewerkerRepository;
import nl.makeitwork.Showmaster.service.MedewerkerService;
import org.junit.Assert;
import org.junit.Before;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.mock.web.MockServletContext;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.validation.BindingResult;
import org.springframework.web.context.WebApplicationContext;

import javax.servlet.ServletContext;


import static org.mockito.Mockito.*;

@RunWith(SpringRunner.class)
@WebAppConfiguration
@SpringBootTest
@AutoConfigureMockMvc
@TestPropertySource(locations = "classpath:test.properties")
class MedewerkerControllerTest {

   /* @Autowired
    private MedewerkerService medewerkerService;

    @Autowired
    private MedewerkerController medewerkerController;

    @Autowired
    private MedewerkerRepository medewerkerRepository;

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private WebApplicationContext webApplicationContext;


    @Before
    public void setup() throws Exception {
        this.mockMvc = MockMvcBuilders.webAppContextSetup(this.webApplicationContext).build();
    }

    @Test
    public void beanTestmedewerkerController() {
        //Arrange
        //Activate
        ServletContext servletContext = webApplicationContext.getServletContext();


        Assert.assertNotNull(servletContext);
        Assert.assertTrue(servletContext instanceof MockServletContext);
        Assert.assertNotNull(webApplicationContext.getBean("medewerkerController"));
    }

    @Test
    public void saveGebruikerTest() throws Exception {

        //Arrange
        BindingResult bindingResult = mock(BindingResult.class);
        when(bindingResult.hasErrors()).thenReturn(false);
        Medewerker medewerker1 = new Medewerker();

        medewerker1.setGebruikersnaam("test1234");
        medewerker1.setWachtwoord("test1234");
        medewerker1.setWachtwoordBevestigen("test1234");
        medewerker1.setPlanner(false);

        //Activate
        medewerkerController.saveGebruiker(medewerker1, bindingResult);

        //Assert
        Assert.assertNotNull(medewerkerRepository.findByGebruikersnaam("test1234"));
    }

    @Test
    void testUpdateMedewerker() throws Exception {

        // Arrange
        Medewerker testmedewerker1 = new Medewerker();
        setGebruikersgegevensTestMedewerker1(testmedewerker1);
        medewerkerRepository.save(testmedewerker1);

        BindingResult result = mock(BindingResult.class);
        when(result.hasErrors()).thenReturn(false);
        String verwachteAchternaam = "Vries";

        vulProfielgegevens(testmedewerker1);

        // Activate
        medewerkerController.updateMedewerker(testmedewerker1, result);

        // Assert
        Assert.assertEquals(testmedewerker1.getAchternaam(), verwachteAchternaam);
    }


    @Test
    public void verwijderGebruikerTest() throws Exception {
        //Arrange
        BindingResult bindingResult = mock(BindingResult.class);
        when(bindingResult.hasErrors()).thenReturn(false);
        Medewerker medewerker1 = new Medewerker();

        medewerker1.setGebruikersnaam("test12345");
        medewerker1.setWachtwoord("test12345");
        medewerker1.setWachtwoordBevestigen("test12345");
        medewerker1.setPlanner(false);

        //Activate
        medewerkerController.saveGebruiker(medewerker1, bindingResult);

        medewerker1 = medewerkerRepository.findByGebruikersnaam("test12345");

        medewerkerController.verwijderGebruiker(medewerker1.getMedewerkerId());

        //Assert
        Assert.assertNull(medewerkerRepository.findByGebruikersnaam("test12345"));

    }

    public void setGebruikersgegevensTestMedewerker1(Medewerker testMedewerker) {
        testMedewerker.setGebruikersnaam("test4567");
        testMedewerker.setWachtwoord("test4567");
        testMedewerker.setWachtwoordBevestigen("test4567");
        testMedewerker.setPlanner(false);
    }

    public void vulProfielgegevens(Medewerker opgehaaldeMedewerker) {
        opgehaaldeMedewerker.setVoornaam("Piet");
        opgehaaldeMedewerker.setTussenvoegsel("de");
        opgehaaldeMedewerker.setAchternaam("Vries");
        opgehaaldeMedewerker.setEmailadres("pdevries@blabla.com");
        //updateMedewerker.setGeboortedatum(LocalDate.parse("1956-8-1"));
        opgehaaldeMedewerker.setStraatnaam("Rondweg");
        opgehaaldeMedewerker.setHuisnummer(2);
        opgehaaldeMedewerker.setPostcode("8607HH");
        opgehaaldeMedewerker.setWoonplaats("Putten");
        opgehaaldeMedewerker.setTelefoonnummer("06-84431841");
    }*/
}



