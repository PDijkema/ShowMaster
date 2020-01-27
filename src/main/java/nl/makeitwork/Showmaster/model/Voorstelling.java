package nl.makeitwork.Showmaster.model;

import io.github.millij.poi.ss.model.annotations.Sheet;
import io.github.millij.poi.ss.model.annotations.SheetColumn;
import org.springframework.format.annotation.DateTimeFormat;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;


/**
 * @author Pieter Dijkema
 * aanmaken van een show/voorstelling
 */

@Sheet
@Entity
@Table(name = "voorstelling")
public class Voorstelling {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer voorstellingId;
    @NotNull
    private String naam;

    @NotNull
    @DateTimeFormat(pattern = "dd-MM-yyyy HH:mm")
    private LocalDateTime localDateTime;

    private String datum;

    public String getDatum() {
        return datum;
    }

    public void setDatum(String datum) {
        this.datum = datum;
    }

    private String status;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getVoorstellingId() {
        return voorstellingId;
    }

    public void setVoorstellingId(Integer voorstellingId) {
        this.voorstellingId = voorstellingId;
    }

    @SheetColumn("Voorstelling")
    public String getNaam() {
        return naam;
    }

    public void setNaam(String naam) {
        this.naam = naam;
    }

    @SheetColumn("Datum")
    public LocalDateTime getLocalDateTime() {
        return localDateTime;
    }

    public void setLocalDateTime(LocalDateTime localDateTime) {
        this.localDateTime = localDateTime;
    }

    @Override
    public String toString() {
        return "Voorstelling{" +
            "voorstellingId=" + voorstellingId +
            ", naam='" + naam + '\'' +
            ", localDateTime=" + localDateTime +
            ", datum='" + datum + '\'' +
            ", status='" + status + '\'' +
            '}';
    }
}
