package nl.makeitwork.Showmaster;
import nl.makeitwork.Showmaster.mail.MailServiceConfiguratie;
import nl.makeitwork.Showmaster.mail.MailService;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;


@ServletComponentScan
@SpringBootApplication
public class ShowmasterApplication extends SpringBootServletInitializer {

		@Override
		protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
			return application.sources(ShowmasterApplication.class);
		}

	public static void main(String[] args) {
		SpringApplication.run(ShowmasterApplication.class, args);


	}
}
