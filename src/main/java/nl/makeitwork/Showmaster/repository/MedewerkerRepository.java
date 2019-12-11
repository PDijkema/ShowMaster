package nl.makeitwork.Showmaster.repository;

import nl.makeitwork.Showmaster.model.Medewerker;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface MedewerkerRepository extends JpaRepository<Medewerker, Integer> {
    Optional<Medewerker> findByGebruikersnaam(String gebruikersnaam);
}
