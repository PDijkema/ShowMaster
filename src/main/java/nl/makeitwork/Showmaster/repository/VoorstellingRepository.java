package nl.makeitwork.Showmaster.repository;

import nl.makeitwork.Showmaster.model.Voorstelling;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface VoorstellingRepository extends JpaRepository<Voorstelling, Integer> {
}
