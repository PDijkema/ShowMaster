package nl.makeitwork.Showmaster.service;

import nl.makeitwork.Showmaster.model.Medewerker;
import nl.makeitwork.Showmaster.repository.MedewerkerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Set;


@Service
public class MedewerkerServiceImplementatie implements MedewerkerService {
    @Autowired
    private MedewerkerRepository medewerkerRepository;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    public void save(Medewerker medewerker) {
        medewerker.setWachtwoord(bCryptPasswordEncoder.encode(medewerker.getPassword()));
        medewerkerRepository.save(medewerker);
    }

    @Override
    public Medewerker findByUsername(String gebruikersnaam) {
        return medewerkerRepository.findByGebruikersnaam(gebruikersnaam);
    }

}
