package nl.makeitwork.Showmaster.model;


import javax.persistence.*;

/**
 * @author Pieter Dijkema
 * in voorstellingsTaken komen de andere entiteiten samen
 */

@Entity(name = "voorstellingsTaak")
@Table(name = "voorstelling_heeft_taak")
public class VoorstellingsTaak {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer voorstellingsTaakId;

        @ManyToOne(fetch = FetchType.LAZY, optional = false)
        @MapsId("voorstellingId")
        private Voorstelling voorstelling;

        @ManyToOne(fetch = FetchType.LAZY, optional = false)
        @MapsId("taakId")
        private Taak taak;

        @OneToOne(fetch = FetchType.LAZY)
        @JoinColumn(name = "medewerkersId")
        private Medewerker medewerker;

    public Voorstelling getVoorstelling() {
        return voorstelling;
    }

    public void setVoorstelling(Voorstelling voorstelling) {
        this.voorstelling = voorstelling;
    }

    public Taak getTaak() {
        return taak;
    }

    public void setTaak(Taak taak) {
        this.taak = taak;
    }
}
