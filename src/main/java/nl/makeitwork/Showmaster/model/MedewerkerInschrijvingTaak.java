package nl.makeitwork.Showmaster.model;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;

@Entity(name = "medewerkerInschrijvingTaak")
@Table(name = "medewerker_inschrijving_taak")
public class MedewerkerInschrijvingTaak {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer medewerkerInschrijvingTaakId;

    @ManyToOne
    @JoinColumn(name = "medewerkerId", referencedColumnName = "medewerkerId")
    @OnDelete(action = OnDeleteAction.CASCADE)
    private Medewerker medewerker;

    @ManyToOne
    @JoinColumn(name = "voorstellingsTaakId", referencedColumnName = "voorstellingsTaakId")
    @OnDelete(action = OnDeleteAction.CASCADE)
    private VoorstellingsTaak voorstellingsTaak;

    public Integer getMedewerkerInschrijvingTaakId() {
        return medewerkerInschrijvingTaakId;
    }

    public void setMedewerkerInschrijvingTaakId(Integer medewerkerInschrijvingTaakId) {
        this.medewerkerInschrijvingTaakId = medewerkerInschrijvingTaakId;
    }

    public Medewerker getMedewerker() {
        return medewerker;
    }

    public void setMedewerker(Medewerker medewerker) {
        this.medewerker = medewerker;
    }


    public VoorstellingsTaak getVoorstellingsTaak() {
        return voorstellingsTaak;
    }

    public void setVoorstellingsTaak(VoorstellingsTaak voorstellingsTaak) {
        this.voorstellingsTaak = voorstellingsTaak;
    }
}
