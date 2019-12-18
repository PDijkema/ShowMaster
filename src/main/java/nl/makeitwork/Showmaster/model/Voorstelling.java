package nl.makeitwork.Showmaster.model;


import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;


/**
 * @author Pieter Dijkema
 * aanmaken van een show/voorstelling
 */

@Entity
@Table(name = "voorstelling")
public class Voorstelling {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer voorstellingId;
    @NotNull
    private String naam;
    @NotNull
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    private LocalDateTime datum;

        @OneToMany(
            mappedBy = "voorstelling",
            cascade = CascadeType.ALL,
            orphanRemoval = true
        )
        private List<VoorstellingsTaak> voorstellingsTaak = new ArrayList<>();

    @Override
    public String toString() {
        return "Id "+ voorstellingId + " naam " + naam + " datum " + datum ;
    }

    public Integer getVoorstellingId() {
        return voorstellingId;
    }

    public void setVoorstellingId(Integer voorstellingId) {
        this.voorstellingId = voorstellingId;
    }

    public String getNaam() {
        return naam;
    }

    public void setNaam(String naam) {
        this.naam = naam;
    }

    public LocalDateTime getDatum() {
        return datum;
    }

    public void setDatum(LocalDateTime datum) {
        this.datum = datum;
    }

    public List<VoorstellingsTaak> getVoorstellingsTaak() {
        return voorstellingsTaak;
    }

    public void setVoorstellingsTaak(List<VoorstellingsTaak> voorstellingsTaak) {
        this.voorstellingsTaak = voorstellingsTaak;
    }
}
