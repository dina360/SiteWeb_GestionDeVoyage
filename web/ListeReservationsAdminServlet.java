package web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Reservation;
import dao.Connexion;

@WebServlet("/listeReservationsAdmin")
public class ListeReservationsAdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Liste des réservations
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        List<Reservation> reservationsA = new ArrayList<>();

        // Connexion à la base de données
        Connection connection = Connexion.getConnexion();

        if (connection != null) {
            try {
                // Requête SQL pour récupérer toutes les réservations
                String query = "SELECT * FROM reservation";
                PreparedStatement preparedStatement = connection.prepareStatement(query);
                ResultSet resultSet = preparedStatement.executeQuery();

                // Parcours des résultats et création des objets Réservation
                while (resultSet.next()) {
                    Reservation reservationA = new Reservation();
                    reservationA.setId(resultSet.getInt("id"));
                    reservationA.setTitre(resultSet.getString("title"));
                    reservationA.setVille_depart(resultSet.getString("ville_depart"));
                    reservationA.setDate_depart(resultSet.getDate("date_depart"));
                    reservationA.setDuree(resultSet.getInt("duree"));
                    reservationA.setNbr_per(resultSet.getInt("nbr_per"));
                    reservationA.setMoy(resultSet.getString("moy"));
                    reservationA.setPrix_total(resultSet.getFloat("prix_t"));
                    reservationA.setClientId(resultSet.getInt("clientId"));
                    reservationsA.add(reservationA);
                }

                // Fermeture des ressources
                resultSet.close();
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        // Ajout de la liste des réservations à la requête
        request.setAttribute("reservationsA", reservationsA);

        // Affichage de la page SuiviReservationAdmin.jsp
        request.getRequestDispatcher("SuiviReservationAdmin.jsp").forward(request, response);
    }
}