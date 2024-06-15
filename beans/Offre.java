package beans;

public class Offre {
    private int id;
    private String titre;
    private String description;
    private String image;
    private String hotel;
    private String restaurant;
    private String ville;
    private float p_i;
    private float p_a;
    private int remise;
    private int nbr;
    
    public Offre() {
		super();
	}

	public Offre(String titre, String description, String image, String hotel, String restaurant, String ville,
			float p_i, float p_a, int remise, int nbr) {
		super();
		this.titre = titre;
		this.description = description;
		this.image = image;
		this.hotel = hotel;
		this.restaurant = restaurant;
		this.ville = ville;
		this.p_i = p_i;
		this.p_a = p_a;
		this.remise = remise;
		this.nbr = nbr;
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getHotel() {
		return hotel;
	}

	public void setHotel(String hotel) {
		this.hotel = hotel;
	}

	public String getRestaurant() {
		return restaurant;
	}

	public void setRestaurant(String restaurant) {
		this.restaurant = restaurant;
	}

	public String getVille() {
		return ville;
	}

	public void setVille(String ville) {
		this.ville = ville;
	}

	public float getP_i() {
		return p_i;
	}

	public void setP_i(float p_i) {
		this.p_i = p_i;
	}

	public float getP_a() {
		return p_a;
	}

	public void setP_a(float p_a) {
		this.p_a = p_a;
	}

	public int getRemise() {
		return remise;
	}

	public void setRemise(int remise) {
		this.remise = remise;
	}

	public int getNbr() {
		return nbr;
	}

	public void setNbr(int nbr) {
		this.nbr = nbr;
	}
    
	}