package nl.makeitwork.Showmaster.service;

import nl.makeitwork.Showmaster.model.Medewerker;

public interface MedewerkerService {
    void save(Medewerker medewerker);

    Medewerker findByUsername(String username);
}
