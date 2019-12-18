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
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.validation.BindingResult;
import org.springframework.web.context.WebApplicationContext;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;
import javax.servlet.ServletContext;

import java.time.LocalDate;

@RunWith(SpringRunner.class)
@WebAppConfiguration
@SpringBootTest
@AutoConfigureMockMvc
class MedewerkerControllerTest {

    @Autowired
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

        //Activate
        medewerkerController.saveGebruiker(medewerker1, bindingResult);

        //Assert
        Assert.assertNotNull(medewerkerRepository.findByGebruikersnaam("test1234"));
    }

    // deze test moet nog afgemaakt worden
    @Test
    void saveOrUpdateMedewerker() throws Exception {

        //Arrange
        BindingResult result = mock(BindingResult.class);
        when(result.hasErrors()).thenReturn(false);

        Medewerker medewerker = new Medewerker();
        medewerker.setVoornaam("Piet");
        medewerker.setTussenvoegsel("de");
        medewerker.setAchternaam("Vries");
        medewerker.setEmailadres("pdevries@blabla.com");
        medewerker.setGeboortedatum(LocalDate.parse("1956-8-1"));
        medewerker.setStraatnaam("Rondweg");
        medewerker.setHuisnummer(2);
        medewerker.setPostcode("8607HH");
        medewerker.setWoonplaats("Putten");
        medewerker.setTelefoonnummer("06-84431841");

        //Activate
        medewerkerController.saveOrUpdateMedewerker(medewerker, result);

        //Assert
        Medewerker opgehaaldeMedewerker = medewerkerRepository.findByGebruikersnaam("test");

    }





    }


