package nl.makeitwork.Showmaster.service;

import nl.makeitwork.Showmaster.model.Medewerker;
import nl.makeitwork.Showmaster.model.User;
import nl.makeitwork.Showmaster.repository.MedewerkerRepository;
import nl.makeitwork.Showmaster.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;



@Service
public class MedewerkerServiceImplementatie implements MedewerkerService {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    public void save(User user) {
        user.setWachtwoord(bCryptPasswordEncoder.encode(user.getPassword()));
        userRepository.save(user);
    }

    @Override
    public User findByUsername(String gebruikersnaam) {
        return userRepository.findByGebruikersnaam(gebruikersnaam);
    }

}
