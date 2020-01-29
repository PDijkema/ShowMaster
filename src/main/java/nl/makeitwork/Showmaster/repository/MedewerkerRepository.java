
package nl.makeitwork.Showmaster.repository;

import nl.makeitwork.Showmaster.model.Medewerker;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @Author Gert Postma
 */

public interface MedewerkerRepository extends JpaRepository<Medewerker, Integer> {
    Medewerker findByGebruikersnaam(String gebruikersnaam);

}

