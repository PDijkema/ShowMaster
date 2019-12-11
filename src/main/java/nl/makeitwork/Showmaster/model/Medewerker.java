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

