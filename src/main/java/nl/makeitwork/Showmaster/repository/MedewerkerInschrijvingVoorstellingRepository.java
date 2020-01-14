package nl.makeitwork.Showmaster.repository;

import nl.makeitwork.Showmaster.model.MedewerkerInschrijvingVoorstelling;
import nl.makeitwork.Showmaster.model.VoorstellingsTaak;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;


/**
 * @author Gert Postma
 */
public interface MedewerkerInschrijvingVoorstellingRepository extends JpaRepository <MedewerkerInschrijvingVoorstelling, Integer> {

    @Query(value= "select * from medewerker_inschrijving_voorstelling where medewerker_id = :medewerkerId", nativeQuery = true)
    List<MedewerkerInschrijvingVoorstelling> findInschrijvingByMedewerkerId(@Param("medewerkerId")Integer medewerkerId);

    @Query(value= "select * from medewerker_inschrijving_voorstelling where voorstelling_id = :voorstellingId", nativeQuery = true)
    List<MedewerkerInschrijvingVoorstelling> findInschrijvingByVoorstellingId(@Param("voorstellingId")Integer voorstellingId);
}
