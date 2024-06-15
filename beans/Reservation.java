package beans;

import java.sql.Date;

public class Reservation {
    private int id;
    private String titre;
    private String ville_depart;
    private Date date_depart;
    private int duree;
    private int nbr_per;
    private String moy;
    private float prix_total;
    private int clientId; // Nouvel ajout pour inclure l'ID du client
    private String etat;
    public Reservation() {
        super();
    }
	public Reservation(String titre, String ville_depart, Date date_depart, int duree, int nbr_per, String moy,
			float prix_total, int clientId, String etat) {
		super();
		this.titre = titre;
		this.ville_depart = ville_depart;
		this.date_depart = date_depart;
		this.duree = duree;
		this.nbr_per = nbr_per;
		this.moy = moy;
		this.prix_total = prix_total;
		this.clientId = clientId;
		this.etat = etat;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitre() {
		return titre;
	}
	public void setTitre(String titre) {
		this.titre = titre;
	}
	public String getVille_depart() {
		return ville_depart;
	}
	public void setVille_depart(String ville_depart) {
		this.ville_depart = ville_depart;
	}
	public Date getDate_depart() {
		return date_depart;
	}
	public void setDate_depart(Date date_depart) {
		this.date_depart = date_depart;
	}
	public int getDuree() {
		return duree;
	}
	public void setDuree(int duree) {
		this.duree = duree;
	}
	public int getNbr_per() {
		return nbr_per;
	}
	public void setNbr_per(int nbr_per) {
		this.nbr_per = nbr_per;
	}
	public String getMoy() {
		return moy;
	}
	public void setMoy(String moy) {
		this.moy = moy;
	}
	public float getPrix_total() {
		return prix_total;
	}
	public void setPrix_total(float prix_total) {
		this.prix_total = prix_total;
	}
	public int getClientId() {
		return clientId;
	}
	public void setClientId(int clientId) {
		this.clientId = clientId;
	}
	public String getEtat() {
		return etat;
	}
	public void setEtat(String etat) {
		this.etat = etat;
	}
    

	    }