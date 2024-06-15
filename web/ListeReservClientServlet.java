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
import javax.servlet.http.HttpSession;

import beans.Client;
import beans.Reservation;
import dao.Connexion;

@WebServlet("/listeReservClient")
public class ListeReservClientServlet extends HttpServlet {
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        Client client = (Client) session.getAttribute("client");
        if (client == null) {
            // Redirigez vers la page de connexion si la session client n'est pas valide
            response.sendRedirect("connexion.jsp");
            return;
        }

        // Récupérez l'ID du client à partir de la session
        int clientId = client.getId();

        // Liste des réservations du client
        List<Reservation> reservations = new ArrayList<>();

        // Connexion à la base de données
        Connection connection = Connexion.getConnexion();

        if (connection != null) {
            try {
                // Requête SQL pour récupérer les réservations du client
                String query = "SELECT * FROM reservation WHERE clientId = ?";
                PreparedStatement preparedStatement = connection.prepareStatement(query);
                preparedStatement.setInt(1, clientId);
                ResultSet resultSet = preparedStatement.executeQuery();

                // Parcours des résultats et création des objets Réservation
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
        request.setAttribute("reservations", reservations);

        // Affichage de la page ListeReservClient.jsp
        request.getRequestDispatcher("ListeReservClient.jsp").forward(request, response);
    }
}
