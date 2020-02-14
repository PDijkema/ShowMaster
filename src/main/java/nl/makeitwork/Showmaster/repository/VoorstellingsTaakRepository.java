package nl.makeitwork.Showmaster.repository;

import nl.makeitwork.Showmaster.model.Taak;
import nl.makeitwork.Showmaster.model.Voorstelling;
import nl.makeitwork.Showmaster.model.VoorstellingsTaak;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;


/**
 * @author Pieter Dijkema
 * repo voor voorstellingenTaken
 */

@Repository
public interface VoorstellingsTaakRepository extends JpaRepository<VoorstellingsTaak, Integer> {

    VoorstellingsTaak findByVoorstellingsTaakId(Integer voorstellingsTaakId);

    List<VoorstellingsTaak> findByVoorstellingVoorstellingIdOrderByTaakTaakNaam(Integer voorstellingId);

    CopyOnWriteArrayList<VoorstellingsTaak> findByVoorstellingVoorstellingId(Integer voorstellingId);

    List<VoorstellingsTaak> findByMedewerkerMedewerkerId(Integer medewerkerId);

    @Query(value = "select * from voorstelling_heeft_taak where medewerker_id is not null and voorstelling_id = :voorstellingId", nativeQuery = true)
    List<VoorstellingsTaak> findIngeplandeVoorstellingsTakenByVoorstellingId(@Param("voorstellingId") Integer voorstellingId);

    Integer countByVoorstellingVoorstellingIdAndMedewerkerIsNull(Integer voorstelling);

    Integer countByVoorstellingVoorstellingIdAndTaakTaakId(Integer voorstellingId, Integer taakId);

    @Transactional
    void deleteByTaakAndVoorstelling(Taak taak,Voorstelling voorstelling);

    void deleteByTaakIdAndVoorstellingStatus(Integer taakId, String VoorstellingStatus);
}
