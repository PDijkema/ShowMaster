package nl.makeitwork.Showmaster.service;

import nl.makeitwork.Showmaster.repository.MedewerkerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class MedewerkerDetailsService implements UserDetailsService {

    @Autowired
    MedewerkerRepository medewerkerRepository;

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        return medewerkerRepository.findByGebruikersnaam(s);

    }
}
