package beans;

import java.util.Date;

public class Client {
	private int id ;
	private String nom ; 
	private String prenom ; 
	private String email ; 
	private Date date_naissance ; 
	private long tele ; 
	private String nom_utilisateur ; 
	private String password ;
	
	
	

	public Client() {
		super();
	}
	public Client(String nom, String prenom, String email, Date date_naissance, long tele, String nom_utilisateur,
			String password) {
		super();
		this.nom = nom;
		this.prenom = prenom;
		this.email = email;
		this.date_naissance = date_naissance;
		this.tele = tele;
		this.nom_utilisateur = nom_utilisateur;
		this.password = password;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getDate_naissance() {
		return date_naissance;
	}
	public void setDate_naissance(Date date_naissance) {
		this.date_naissance = date_naissance;
	}
	public long getTele() {
		return tele;
	}
	public void setTele(long tele) {
		this.tele = tele;
	}
	public String getNom_utilisateur() {
		return nom_utilisateur;
	}
	public void setNom_utilisateur(String nom_utilisateur) {
		this.nom_utilisateur = nom_utilisateur;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}	
}
