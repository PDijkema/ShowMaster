package nl.makeitwork.Showmaster.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Taak {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer taakId;

    private String taakNaam;

    private Integer standaardBezetting;

    public Taak() {}

    public Integer getTaakId() {
        return taakId;
    }

    public void setTaakId(Integer taakId) {
        this.taakId = taakId;
    }

    public String getTaakNaam() {
        return taakNaam;
    }

    public void setTaakNaam(String taakNaam) {
        this.taakNaam = taakNaam;
    }

    public Integer getStandaardBezetting() {
        return standaardBezetting;
    }

    public void setStandaardBezetting(Integer standaardBezetting) {
        this.standaardBezetting = standaardBezetting;
    }
}
