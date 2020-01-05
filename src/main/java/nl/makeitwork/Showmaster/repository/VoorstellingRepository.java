package nl.makeitwork.Showmaster.repository;

import nl.makeitwork.Showmaster.model.Voorstelling;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * @author Pieter Dijkema
 * repo voor voorstellingenManagement
 */


@Repository
public interface VoorstellingRepository extends JpaRepository<Voorstelling, Integer> {
    Voorstelling findByVoorstellingId(Integer voorstellingId);

}
