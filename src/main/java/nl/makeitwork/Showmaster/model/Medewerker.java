package nl.makeitwork.Showmaster.model;

import javax.persistence.*;

@Entity
public class Medewerker {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer medewerkerId;

    @Column(unique = true)
    private String gebruikersnaam;

    private String wachtwoord;

    private Boolean planner;

    public Boolean getPlanner() {
        return planner;
    }

    public void setPlanner(Boolean planner) {
        this.planner = planner;
    }

    @Transient
    private String wachtwoordBevestigen;

    public String getWachtwoordBevestigen() {
        return wachtwoordBevestigen;
    }

    public void setWachtwoordBevestigen(String wachtwoordBevestigen) {
        this.wachtwoordBevestigen = wachtwoordBevestigen;
    }

    public Integer getMedewerkerId() {
        return medewerkerId;
    }

    public void setMedewerkerId(Integer medewerkerId) {
        this.medewerkerId = medewerkerId;
    }

    public String getGebruikersnaam() {
        return gebruikersnaam;
    }

    public void setGebruikersnaam(String gebruikersnaam) {
        this.gebruikersnaam = gebruikersnaam;
    }

    public String getWachtwoord() {
        return wachtwoord;
    }

    public void setWachtwoord(String wachtwoord) {
        this.wachtwoord = wachtwoord;
    }
}

