package nl.makeitwork.Showmaster.repository;

import nl.makeitwork.Showmaster.model.VoorstellingsTaak;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


/**
 * @author Pieter Dijkema
 * repo voor voorstellingenTaken
 */

@Repository
public interface VoorstellingsTaakRepository extends JpaRepository<VoorstellingsTaak, Integer> {

    List<VoorstellingsTaak> findByVoorstellingVoorstellingIdOrderByTaakTaakNaam(Integer voorstellingId);

    List<VoorstellingsTaak> findByMedewerkerMedewerkerId(Integer medewerkerId);
}
