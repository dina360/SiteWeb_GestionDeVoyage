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

public class AdminClientDao {

	private Connection connection =Connexion.getConnexion();


    public List<Client> getAllClients() {
    	
    	if(this.connection==null)
			return null;
    	
        List<Client> clients = new ArrayList<>();
        String query = "SELECT * FROM client";

        try (
                PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                Client client = new Client();
                client.setId(rs.getInt("id"));
                client.setNom(rs.getString("nom"));
                client.setPrenom(rs.getString("prenom"));
                client.setEmail(rs.getString("email"));
                client.setDate_naissance(rs.getDate("date_naissance"));
                client.setTele(rs.getLong("tele"));
                client.setNom_utilisateur(rs.getString("nom_utilisateur"));
                client.setPassword(rs.getString("password"));
                clients.add(client);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return clients;
    }
    public List<Reservation> getAllReservations() {
    	
    	if(this.connection==null)
			return null;
    	
        List<Reservation> reservations = new ArrayList<>();
        String query = "SELECT * FROM reservation";
        try (
             PreparedStatement stmt = this.connection.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Reservation reservation = new Reservation();
                reservation.setId(rs.getInt("id"));
                reservation.setTitre(rs.getString("title"));
                reservation.setVille_depart(rs.getString("ville_depart"));
                reservation.setDate_depart(rs.getDate("date_depart"));
                reservation.setDuree(rs.getInt("duree"));
                reservation.setNbr_per(rs.getInt("nbr_per"));
                reservation.setMoy(rs.getString("moy"));
                reservation.setPrix_total(rs.getFloat("prix_t"));
                reservation.setClientId(rs.getInt("clientId"));
                reservation.setEtat(rs.getString("etat"));
                reservations.add(reservation);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return reservations;
    }

    public Client getClientById(int id) {
        String sql = "SELECT * FROM client WHERE id = ?";
        Client client = null;

        if(this.connection==null)
			return null;
        try (
                PreparedStatement preparedStatement = this.connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, id);
            try (ResultSet rs = preparedStatement.executeQuery()) {
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

    public void updateClient(Client client) {
    	
    	if(this.connection==null)
			return ;
    	
        String sql = "UPDATE client SET nom=?, prenom=?, email=?, date_naissance=?, tele=?, nom_utilisateur=?, password=? WHERE id=?";
        try (
                PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, client.getNom());
            statement.setString(2, client.getPrenom());
            statement.setString(3, client.getEmail());
            statement.setDate(4,(Date)client.getDate_naissance());
            statement.setLong(5, client.getTele());
            statement.setString(6, client.getNom_utilisateur());
            statement.setString(7, client.getPassword());
            statement.setInt(8, client.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void deleteClient(int id) {
    	if(this.connection==null)
			return ;
    	
        String sql = "DELETE FROM client WHERE id=?";
        try (
                PreparedStatement statement = this.connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    	


    public void deleteReservation(int reservationId) {
        if (this.connection == null) {
            System.out.println("La connexion n'est pas initialisée.");
            return;
        }
        
        try {
            // Requête SQL pour supprimer la réservation avec l'ID donné
            String query = "DELETE FROM reservation WHERE id = ?";
            
            // Préparer la déclaration SQL
            try (PreparedStatement preparedStatement = this.connection.prepareStatement(query)) {
                preparedStatement.setInt(1, reservationId);
                
                // Exécuter la requête de suppression
                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println("Une erreur s'est produite lors de la suppression de la réservation : " + e.getMessage());
            e.printStackTrace();
        }
    }
    
    public boolean validerReservation(int reservationId) {
        if(this.connection == null)
            return false;
        boolean success = false;

        try {           
            String query = "UPDATE reservation SET etat = ? WHERE id = ?";
            PreparedStatement stmt = this.connection.prepareStatement(query);
            stmt.setString(1, "Valide"); // Mettez à jour l'état de la réservation à "Valide"
            stmt.setInt(2, reservationId);
            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                success = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();        
        }

        return success;
    }

    
    
}
