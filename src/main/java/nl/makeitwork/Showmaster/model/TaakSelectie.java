package nl.makeitwork.Showmaster.model;


public class TaakSelectie {
    private Integer taakId;
    private Integer aantal;

    public Integer getTaakId() {
        return taakId;
    }

    public void setTaakId(Integer taakId) {
        this.taakId = taakId;
    }

    public Integer getAantal() {
        return aantal;
    }

    public void setAantal(Integer aantal) {
        this.aantal = aantal;
    }

    @Override
    public String toString() {
        return "TaakSelectie{" +
            "taakId=" + taakId +
            ", aantal=" + aantal +
            '}';
    }
}
