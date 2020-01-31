package nl.makeitwork.Showmaster.repository;

import nl.makeitwork.Showmaster.model.Medewerker;
import nl.makeitwork.Showmaster.model.MedewerkerInschrijvingVoorstelling;
import nl.makeitwork.Showmaster.model.Voorstelling;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author Gert Postma
 */

@Repository
public interface MedewerkerInschrijvingVoorstellingRepository extends JpaRepository <MedewerkerInschrijvingVoorstelling, Integer> {

    MedewerkerInschrijvingVoorstelling findByVoorstellingVoorstellingIdAndMedewerkerMedewerkerId(Integer voorstellingId, Integer medewerkerId);

    @Query(value= "select * from medewerker_inschrijving_voorstelling where medewerker_id = :medewerkerId", nativeQuery = true)
    List<MedewerkerInschrijvingVoorstelling> findInschrijvingByMedewerkerId(@Param("medewerkerId")Integer medewerkerId);

    @Query(value= "select * from medewerker_inschrijving_voorstelling where voorstelling_id = :voorstellingId", nativeQuery = true)
    List<MedewerkerInschrijvingVoorstelling> findInschrijvingByVoorstellingId(@Param("voorstellingId")Integer voorstellingId);
}
