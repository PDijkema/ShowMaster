package nl.makeitwork.Showmaster.repository;

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

    @Query(value= "select * from voorstelling_heeft_taak where voorstelling_id = :voorstellingId", nativeQuery = true)
    List<VoorstellingsTaak> findVoorstellingstaakByVoorstellingId(@Param("voorstellingId")Integer voorstellingId);
}
