package nl.makeitwork.Showmaster.repository;

import nl.makeitwork.Showmaster.model.Medewerker;
import nl.makeitwork.Showmaster.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Integer> {
    User findByGebruikersnaam(String gebruikersnaam);
}
