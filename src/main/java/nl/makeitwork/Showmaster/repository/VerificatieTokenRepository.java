package nl.makeitwork.Showmaster.repository;

import nl.makeitwork.Showmaster.model.VerificatieToken;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author Gert Postma
 */

public interface VerificatieTokenRepository extends JpaRepository<VerificatieToken, Integer> {

    VerificatieToken findByToken(String token);
}
