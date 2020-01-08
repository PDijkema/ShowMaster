package nl.makeitwork.Showmaster.controller;

import nl.makeitwork.Showmaster.model.Medewerker;
import nl.makeitwork.Showmaster.model.MedewerkerInschrijvingVoorstelling;
import nl.makeitwork.Showmaster.model.Voorstelling;
import nl.makeitwork.Showmaster.repository.*;
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
import org.springframework.ui.Model;
import org.springframework.web.context.WebApplicationContext;
import javax.servlet.ServletContext;
import java.time.LocalDateTime;
import java.time.Month;
import static org.mockito.Mockito.mock;

@RunWith(SpringRunner.class)
@WebAppConfiguration
@SpringBootTest
@AutoConfigureMockMvc
@TestPropertySource(locations = "classpath:test.properties")
class VoorstellingsTaakControllerTest {

    @Autowired
    private VoorstellingRepository voorstellingRepository;

    @Autowired
    private TaakRepository taakRepository;

    @Autowired
    private VoorstellingsTaakRepository voorstellingsTaakRepository;

    @Autowired
    private MedewerkerInschrijvingVoorstellingRepository medewerkerInschrijvingVoorstellingRepository;

    @Autowired
    private WebApplicationContext webApplicationContext;

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private MedewerkerInschrijvingVoorstellingController medewerkerInschrijvingVoorstellingController;

    @Autowired
    private MedewerkerRepository medewerkerRepository;

    @Autowired
    private VoorstellingsTaakController voorstellingsTaakController;

    @Before
    public void setup() throws Exception {
        this.mockMvc = MockMvcBuilders.webAppContextSetup(this.webApplicationContext).build();
    }

    @Test
    public void beanTestVoorstellingsTaakController() {

        ServletContext servletContext = webApplicationContext.getServletContext();

        Assert.assertNotNull(servletContext);
        Assert.assertTrue(servletContext instanceof MockServletContext);
        Assert.assertNotNull(webApplicationContext.getBean("voorstellingsTaakController"));
    }
}