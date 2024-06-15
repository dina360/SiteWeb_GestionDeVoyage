package web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Reservation;
import dao.ClientDao;
import dao.Connexion;

@WebServlet("/Reserve")
public class ReserveServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Connection connection = Connexion.getConnexion();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");

        // Récupération des paramètres de la requête
        String packId = request.getParameter("packId");
        String title = request.getParameter("title");
        String depart = request.getParameter("depart");
        String departDate = request.getParameter("departDate");
        int duration = Integer.parseInt(request.getParameter("duration"));
        int nbr_per = Integer.parseInt(request.getParameter("guests"));
        String transport = request.getParameter("transport");
        float prix_totale = Float.parseFloat(request.getParameter("totalPrice"));
        int clientId = Integer.parseInt(request.getParameter("clientId"));

        if (this.connection == null) {
            // Si la connexion est nulle, retourner une erreur
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database connection is not available.");
            return;
        }

        try {
            // Insertion de la réservation dans la base de données
            String sql = "INSERT INTO reservation (title, ville_depart, date_depart, duree, nbr_per, moy, prix_t, clientId, etat) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement pstmt = this.connection.prepareStatement(sql)) {
                pstmt.setString(1, title);
                pstmt.setString(2, depart);
                pstmt.setString(3, departDate);
                pstmt.setInt(4, duration);
                pstmt.setInt(5, nbr_per);
                pstmt.setString(6, transport);
                pstmt.setFloat(7, prix_totale);
                pstmt.setInt(8, clientId);
                pstmt.setString(9, "En Cours");

                pstmt.executeUpdate();
            }

            // Décrémenter le nombre de packs disponibles
            decrementerPacksDisponibles(connection, Integer.parseInt(packId));

            // Récupérer la liste mise à jour des réservations
            ClientDao clientDao = new ClientDao();
            List<Reservation> reservations = clientDao.getReservationsByClientId(clientId);

            // Mettre à jour la session avec la liste mise à jour des réservations
            request.getSession().setAttribute("reservations", reservations);
            request.getSession().setAttribute("successMessage", "La réservation réalisée avec succès.");
            // Redirection vers la page Offre.jsp après la réservation
            response.sendRedirect("Offre.jsp");

        } catch (SQLException e) {
            e.printStackTrace();
            // Envoyer une erreur HTTP 500 avec un message d'erreur approprié
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error processing the reservation: " + e.getMessage());
        }
    }

    // Méthode pour décrémenter le nombre de packs disponibles
    private void decrementerPacksDisponibles(Connection conn, int packId) throws SQLException {
        String updateSql = "UPDATE packages SET nbr = nbr - 1 WHERE id = ?";
        try (PreparedStatement updateStmt = conn.prepareStatement(updateSql)) {
            updateStmt.setInt(1, packId);
            updateStmt.executeUpdate();
        }
    }
}
