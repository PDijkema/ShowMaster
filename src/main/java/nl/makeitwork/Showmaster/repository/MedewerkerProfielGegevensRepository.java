package nl.makeitwork.Showmaster.repository;

import nl.makeitwork.Showmaster.model.Medewerker;
import nl.makeitwork.Showmaster.model.MedewerkerInschrijvingVoorstelling;
import nl.makeitwork.Showmaster.model.MedewerkerProfielGegevens;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MedewerkerProfielGegevensRepository extends JpaRepository<MedewerkerProfielGegevens, Integer> {

    MedewerkerProfielGegevens findByMedewerker(Medewerker medewerker);

}
