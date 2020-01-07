package nl.makeitwork.Showmaster.model;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@Entity
public class User implements UserDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer userId;

    @Column(unique = true)
    private String gebruikersnaam;

    private String wachtwoord;

    @Transient
    private String wachtwoordBevestigen;

    private Boolean planner;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
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

    public String getWachtwoordBevestigen() {
        return wachtwoordBevestigen;
    }

    public void setWachtwoordBevestigen(String wachtwoordBevestigen) {
        this.wachtwoordBevestigen = wachtwoordBevestigen;
    }

    public Boolean getPlanner() {
        return planner;
    }

    public void setPlanner(Boolean planner) {
        this.planner = planner;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        List<GrantedAuthority> authorities = new ArrayList<>();

        if (this.planner) {
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
