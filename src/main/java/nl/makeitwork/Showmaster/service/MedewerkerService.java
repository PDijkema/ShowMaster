package nl.makeitwork.Showmaster.service;


import nl.makeitwork.Showmaster.model.User;

public interface MedewerkerService {
    void save(User user);

    User findByUsername(String username);
}
