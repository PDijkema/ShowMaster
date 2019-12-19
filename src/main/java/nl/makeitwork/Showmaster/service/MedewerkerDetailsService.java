package nl.makeitwork.Showmaster.service;

import nl.makeitwork.Showmaster.model.Medewerker;
import nl.makeitwork.Showmaster.repository.MedewerkerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.security.Principal;
import java.util.HashSet;
import java.util.Set;

@Service
public class MedewerkerDetailsService implements UserDetailsService {

    @Autowired
    private MedewerkerRepository medewerkerRepository;

    @Override
    @Transactional(readOnly = true)
    public UserDetails loadUserByUsername(String gebruikersnaam) {
        Medewerker medewerker = medewerkerRepository.findByGebruikersnaam(gebruikersnaam);
        if (medewerker == null) throw new UsernameNotFoundException(gebruikersnaam);

        return medewerker;
    }
}

