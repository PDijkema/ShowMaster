package nl.makeitwork.Showmaster.repository;

import nl.makeitwork.Showmaster.model.Medewerker;
import nl.makeitwork.Showmaster.model.Voorstelling;
import nl.makeitwork.Showmaster.model.VoorstellingsTaak;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


/**
 * @author Pieter Dijkema
 * repo voor voorstellingenTaken
 */

@Repository
public interface VoorstellingsTaakRepository extends JpaRepository<VoorstellingsTaak, Integer> {

    @Query(value= "SELECT * FROM voorstelling_heeft_taak AS v WHERE voorstelling_id = :voorstellingId ORDER BY v.taak_id", nativeQuery = true)
    List<VoorstellingsTaak> findVoorstellingstaakByVoorstellingId(@Param("voorstellingId")Integer voorstellingId);

    @Query(value= "SELECT * FROM voorstelling_heeft_taak WHERE medewerker_id = :medewerkerId", nativeQuery = true)
    List<VoorstellingsTaak> findVoorstellingstaakByMedewerkerId(@Param("medewerkerId")Integer medewerkerId);

}
