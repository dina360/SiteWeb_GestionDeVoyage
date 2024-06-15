package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Offre;

public class OffreDAO {
    private Connection connection = Connexion.getConnexion();

    public List<Offre> getAllOffres() {
        if (this.connection == null) {
            return null;
        }

        List<Offre> offres = new ArrayList<>();
        String query = "SELECT * FROM packages";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                Offre offre = new Offre();
                offre.setId(rs.getInt("id"));
                offre.setTitre(rs.getString("titre"));
                offre.setDescription(rs.getString("description"));
                offre.setImage(rs.getString("image"));
                offre.setHotel(rs.getString("hotel"));
                offre.setRestaurant(rs.getString("restaurant"));
                offre.setVille(rs.getString("ville"));
                offre.setP_i(rs.getFloat("p_i"));
                offre.setP_a(rs.getFloat("p_a"));
                offre.setRemise(rs.getInt("remise"));
                offre.setNbr(rs.getInt("nbr"));
                offres.add(offre);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return offres;
    }

    public boolean addOffre(Offre offre) {
        if (this.connection == null) {
            return false;
        }

        boolean success = false;
        String sql = "INSERT INTO packages (titre, description, image, hotel, restaurant, ville, p_i, p_a, remise,nbr) VALUES (?,?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, offre.getTitre());
            statement.setString(2, offre.getDescription());
            statement.setString(3, offre.getImage());
            statement.setString(4, offre.getHotel());
            statement.setString(5, offre.getRestaurant());
            statement.setString(6, offre.getVille());
            statement.setFloat(7, offre.getP_i());
            statement.setFloat(8, offre.getP_a());
            statement.setInt(9, offre.getRemise());
            statement.setInt(10, offre.getNbr());
            statement.executeUpdate();
            
            success = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return success;
    }
}
