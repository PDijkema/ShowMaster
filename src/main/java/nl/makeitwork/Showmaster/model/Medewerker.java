package nl.makeitwork.Showmaster.model;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * @Author Gert Postma
 */
@Entity
public class Medewerker implements UserDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer medewerkerId;
    @Column(unique = true)
    private String gebruikersnaam;
    private String wachtwoord;
    private Boolean planner;



    @Transient
    private String wachtwoordBevestigen;

        @OneToOne(mappedBy = "medewerker", cascade = CascadeType.ALL,
                    fetch = FetchType.LAZY, optional = false)
        private VoorstellingsTaak voorstellingsTaak;


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

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
            List<GrantedAuthority> authorities = new ArrayList<>();

            if (this.planner){
                authorities.add(new SimpleGrantedAuthority("ROLE_PLANNER"));
            }
            authorities.add(new SimpleGrantedAuthority("ROLE_MEDEWERKER"));
            return authorities;
        }


    @Override
    public String getPassword() {
        return this.wachtwoord;
    }

    @Override
    public String getUsername() {
        return this.gebruikersnaam;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

}

