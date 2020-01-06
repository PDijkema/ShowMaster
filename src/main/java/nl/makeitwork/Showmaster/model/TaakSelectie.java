package nl.makeitwork.Showmaster.model;

/**
 * @author Pieter Dijkema
 * tijdelijk klasse om taken bij voorstellingen op te kunnen slaan. Later vervangen door een meer flexibele vorm
 */

public class TaakSelectie {
   private Integer bar;
   private Integer kaartverkoop;
   private Integer garderobe;

    @Override
    public String toString() {
        return "TaakSelectie{" +
            "bar=" + bar +
            ", kaartverkoop=" + kaartverkoop +
            ", garderobe=" + garderobe +
            '}';
    }

    public Integer getBar() {
        return bar;
    }

    public void setBar(Integer bar) {
        this.bar = bar;
    }

    public Integer getKaartverkoop() {
        return kaartverkoop;
    }

    public void setKaartverkoop(Integer kaartverkoop) {
        this.kaartverkoop = kaartverkoop;
    }

    public Integer getGarderobe() {
        return garderobe;
    }

    public void setGarderobe(Integer garderobe) {
        this.garderobe = garderobe;
    }
}
