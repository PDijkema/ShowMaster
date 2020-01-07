package nl.makeitwork.Showmaster.model;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Set;

/**
 * @Author Gert Postma
 */
@Entity
public class Medewerker {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer medewerkerId;

    @Column(unique = true)
    private String gebruikersnaam;

    private String wachtwoord;

    @Transient
    private String wachtwoordBevestigen;

    private Boolean planner;

    private String voornaam;

    private String tussenvoegsel;

    private String achternaam;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate geboortedatum;

    private String straatnaam;

    private Integer huisnummer;

    private String toevoeging;

    private String postcode;

    private String woonplaats;

    private String emailadres;

    private String telefoonnummer;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "voorkeurstaakId", referencedColumnName = "taakId")
    @OnDelete(action = OnDeleteAction.NO_ACTION)
    private Taak voorkeurstaak;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "vasteTaakId", referencedColumnName = "taakId")
    @OnDelete(action = OnDeleteAction.NO_ACTION)
    private Taak vasteTaak;


    public Boolean getPlanner() {
        return planner;
    }

    public void setPlanner(Boolean planner) {
        this.planner = planner;
    }

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

    public String getVoornaam() {
        return voornaam;
    }

    public void setVoornaam(String voornaam) {
        this.voornaam = voornaam;
    }

    public String getTussenvoegsel() {
        return tussenvoegsel;
    }

    public void setTussenvoegsel(String tussenvoegsel) {
        this.tussenvoegsel = tussenvoegsel;
    }

    public String getAchternaam() {
        return achternaam;
    }

    public void setAchternaam(String achternaam) {
        this.achternaam = achternaam;
    }

    public LocalDate getGeboortedatum() {
        return geboortedatum;
    }

    public void setGeboortedatum(LocalDate geboortedatum) {
        this.geboortedatum = geboortedatum;
    }

    public String getStraatnaam() {
        return straatnaam;
    }

    public void setStraatnaam(String straatnaam) {
        this.straatnaam = straatnaam;
    }

    public Integer getHuisnummer() {
        return huisnummer;
    }

    public void setHuisnummer(Integer huisnummer) {
        this.huisnummer = huisnummer;
    }

    public String getToevoeging() {
        return toevoeging;
    }

    public void setToevoeging(String toevoeging) {
        this.toevoeging = toevoeging;
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public String getWoonplaats() {
        return woonplaats;
    }

    public void setWoonplaats(String woonplaats) {
        this.woonplaats = woonplaats;
    }

    public String getEmailadres() {
        return emailadres;
    }

    public void setEmailadres(String emailadres) {
        this.emailadres = emailadres;
    }

    public String getTelefoonnummer() {
        return telefoonnummer;
    }

    public void setTelefoonnummer(String telefoonnummer) {
        this.telefoonnummer = telefoonnummer;
    }

    public Taak getVoorkeurstaak() {
        return voorkeurstaak;
    }

    public void setVoorkeurstaak(Taak voorkeurstaak) {
        this.voorkeurstaak = voorkeurstaak;
    }

    public Taak getVasteTaak() {
        return vasteTaak;
    }

    public void setVasteTaak(Taak vasteTaak) {
        this.vasteTaak = vasteTaak;
    }


}

