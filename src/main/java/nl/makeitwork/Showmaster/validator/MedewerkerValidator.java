package nl.makeitwork.Showmaster.validator;

import nl.makeitwork.Showmaster.model.Medewerker;
import nl.makeitwork.Showmaster.repository.MedewerkerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class MedewerkerValidator implements Validator {

        @Autowired
        private MedewerkerRepository medewerkerRepository;

        @Override
        public boolean supports(Class<?> aClass) {
            return Medewerker.class.equals(aClass);
        }

        @Override
        public void validate(Object object, Errors errors) {
            Medewerker medewerker = (Medewerker) object;

            ValidationUtils.rejectIfEmptyOrWhitespace(errors, "gebruikersnaam", "NotEmpty");
            if (medewerker.getGebruikersnaam().length() < 6 || medewerker.getGebruikersnaam().length() > 32) {
                errors.rejectValue("gebruikersnaam", "Size.registratieFormulier.username");
            }
            if (medewerkerRepository.findByGebruikersnaam(medewerker.getGebruikersnaam()) != null) {
                errors.rejectValue("gebruikersnaam", "Duplicate.registratieFormulier.gebruikersnaam");
            }


            ValidationUtils.rejectIfEmptyOrWhitespace(errors, "wachtwoord", "NotEmpty");
            if (medewerker.getWachtwoord().length() < 8 || medewerker.getWachtwoord().length() > 32) {
                errors.rejectValue("wachtwoord", "Size.registratieFormulier.wachtwoord");
            }

            if (!medewerker.getWachtwoordBevestigen().equals(medewerker.getWachtwoord())) {
                errors.rejectValue("wachtwoordBevestigen", "Diff.registratieFormulier.wachtwoordBevestigen");
            }
        }
    }


