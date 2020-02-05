package nl.makeitwork.Showmaster.repository;

import nl.makeitwork.Showmaster.model.UitnodigingMedewerker;
import nl.makeitwork.Showmaster.model.VerificatieToken;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UitnodigingMedewerkerRepository extends JpaRepository<UitnodigingMedewerker, Integer> {

    UitnodigingMedewerker findByVerificatieToken(VerificatieToken verificatieToken);


}
