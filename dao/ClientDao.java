package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Client;
import beans.Reservation;

public class ClientDao {
	private Connection connection =Connexion.getConnexion();
	
	public int enregistreClient(Client client) throws ClassNotFoundException {
		
		String INSERT_USERS_SQL = "INSERT INTO client" + "(nom, prenom, email, date_naissance, tele, nom_utilisateur, password) VALUES "+
		" (?, ?, ?, ?, ?, ?, ?);";
		
		int resultat = 0;
		
		if(this.connection==null)
			return 0;
		try(
				
				
				PreparedStatement pre = connection.prepareStatement(INSERT_USERS_SQL)){
			// Définition des valeurs pour les paramètres de la requête SQL
				pre.setString(1,client.getNom());
				pre.setString(2,client.getPrenom());
				pre.setString(3,client.getEmail());
				pre.setDate(4,(Date) client.getDate_naissance());
				pre.setLong(5,client.getTele());
				pre.setString(6,client.getNom_utilisateur());
				pre.setString(7,client.getPassword());
				
				//System.out.println(pre);
				resultat = pre.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}		
		return resultat;
	}

	
	public boolean authentifier(String username, String password) {
        String sql = "SELECT * FROM client WHERE nom_utilisateur = ? AND password = ?";

		if(this.connection == null)
		return false;
        
       try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            
            stmt.setString(1, username);
            stmt.setString(2, password);
           try (ResultSet rs = stmt.executeQuery()) {
                return rs.next(); // Si l'utilisateur est trouvé, rs.next() renverra true
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
	
	public boolean authentifierAdmin(String username, String password) {
	    String sql = "SELECT * FROM admin WHERE nom_utilisateur = ? AND password = ?";

		if(this.connection == null)
		return false;
	    try (
	         PreparedStatement stmt = connection.prepareStatement(sql)) {
	        
	        stmt.setString(1, username);
	        stmt.setString(2, password);
	        try (ResultSet rs = stmt.executeQuery()) {
	            return rs.next(); // Si l'administrateur est trouvé, rs.next() renverra true
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    }
	}

	 public Client getClientInfo(String username) {
	        String sql = "SELECT * FROM client WHERE nom_utilisateur = ?";
	        Client client = null;

			if(this.connection == null)
			return null;
	        
	        try (
	             PreparedStatement stmt = connection.prepareStatement(sql)) {
	        	
	            stmt.setString(1, username);
	            try (ResultSet rs = stmt.executeQuery()) {
	                if (rs.next()) {
	                    client = new Client();
	                    client.setId(rs.getInt("id"));
	                    client.setNom(rs.getString("nom"));
	                    client.setPrenom(rs.getString("prenom"));
	                    client.setEmail(rs.getString("email"));
	                    client.setDate_naissance(rs.getDate("date_naissance"));
	                    client.setTele(rs.getLong("tele"));
	                    client.setNom_utilisateur(rs.getString("nom_utilisateur"));
	                    client.setPassword(rs.getString("password"));
	                }
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return client;
	    }
	 public int mettreAJourClient(int idClient, Client client) throws SQLException, ClassNotFoundException {
	        // Requête SQL pour mettre à jour un client
	        String UPDATE_CLIENT_SQL = "UPDATE client SET nom=?, prenom=?, email=?, date_naissance=?, tele=?, nom_utilisateur=?, password=? WHERE id=?";

	        int resultat = 0;

			if(this.connection == null)
			return 0;

	        // Connexion à la base de données
	        try (
	             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CLIENT_SQL)) {
	            // Paramètres de la requête
	            preparedStatement.setString(1, client.getNom());
	            preparedStatement.setString(2, client.getPrenom());
	            preparedStatement.setString(3, client.getEmail());
	            preparedStatement.setDate(4,(Date)client.getDate_naissance());
	            preparedStatement.setLong(5, client.getTele());
	            preparedStatement.setString(6, client.getNom_utilisateur());
	            preparedStatement.setString(7, client.getPassword());
	            preparedStatement.setInt(8, idClient);

	            // Exécution de la requête
	            resultat = preparedStatement.executeUpdate();
	        } catch (SQLException e) {
	            // Gestion des exceptions SQL
	            throw e;
	        }

	        return resultat;
	    }
	 
	 public boolean emailExists(String email) {
	        String sql = "SELECT * FROM client WHERE email = ?";
	        boolean exists = false;

	        

			if(this.connection == null)
			return false;
	        try (
	                PreparedStatement stmt = connection.prepareStatement(sql)) {

	            stmt.setString(1, email);
	            try (ResultSet rs = stmt.executeQuery()) {
	                exists = rs.next(); // Si l'email est trouvé, rs.next() renverra true
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return exists;
	    }

	    public boolean usernameExists(String username) {
	        String sql = "SELECT * FROM client WHERE nom_utilisateur = ?";
	        boolean exists = false;

			if(this.connection == null)
			return false;

	        try (
	                PreparedStatement stmt = connection.prepareStatement(sql)) {

	            stmt.setString(1, username);
	            try (ResultSet rs = stmt.executeQuery()) {
	                exists = rs.next(); // Si le nom d'utilisateur est trouvé, rs.next() renverra true
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return exists;
	    }

	    public boolean passwordExists(String password) {
	        String sql = "SELECT * FROM client WHERE password = ?";
	        boolean exists = false;

			if(this.connection == null)
			return false;
	        try (
	                PreparedStatement stmt = connection.prepareStatement(sql)) {

	            stmt.setString(1, password);
	            try (ResultSet rs = stmt.executeQuery()) {
	                exists = rs.next(); // Si le mot de passe est trouvé, rs.next() renverra true
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return exists;
	    }
	 
	    
	    public List<Reservation> getReservationsByClientId(int clientId) {
	        List<Reservation> reservations = new ArrayList<>();
	        Connection connection = Connexion.getConnexion();
	        
	        String query = "SELECT * FROM reservation WHERE clientId = ?";
	        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
	            preparedStatement.setInt(1, clientId);
	            ResultSet resultSet = preparedStatement.executeQuery();
	            while (resultSet.next()) {
	                Reservation reservation = new Reservation();
	                reservation.setId(resultSet.getInt("id"));
	                reservation.setTitre(resultSet.getString("title"));
	                reservation.setVille_depart(resultSet.getString("ville_depart"));
	                reservation.setDate_depart(resultSet.getDate("date_depart"));
	                reservation.setDuree(resultSet.getInt("duree"));
	                reservation.setNbr_per(resultSet.getInt("nbr_per"));
	                reservation.setMoy(resultSet.getString("moy"));
	                reservation.setPrix_total(resultSet.getFloat("prix_t"));
	                reservation.setClientId(resultSet.getInt("clientId"));
	                reservation.setEtat(resultSet.getString("etat"));
	                reservations.add(reservation);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return reservations;
	    }
	    
	   

	    
	    
	    
}