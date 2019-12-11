package nl.makeitwork.Showmaster.repository;

import nl.makeitwork.Showmaster.model.Taak;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TaakRepository extends JpaRepository<Taak, Integer> {
}
