package web;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Client;
import dao.ClientDao;

@WebServlet("/MettreAJourClientServlet")
public class MettreAJourClientServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ClientDao clientDao = new ClientDao();

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupération des autres paramètres du formulaire
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String email = request.getParameter("email");
        String dateNaissanceStr = request.getParameter("date_naissance");
        String teleStr = request.getParameter("tele");
        String nomUtilisateur = request.getParameter("nom_utilisateur");
        String password = request.getParameter("password");

        // Récupération de l'ID du client à partir de la session
        HttpSession session = request.getSession();
        Client client = (Client) session.getAttribute("client");
        
        // Vérification de la présence de l'ID du client dans la session
        if (client == null) {
            // Redirection vers une page d'erreur si l'ID du client n'est pas trouvé dans la session
            response.sendRedirect("error.jsp");
            return;
        }

        try {
            // Conversion des autres types de données
            Date dateNaissance = Date.valueOf(dateNaissanceStr);
            long tele = Long.parseLong(teleStr);

            // Mise à jour des données du client
            client.setNom(nom);
            client.setPrenom(prenom);
            client.setEmail(email);
            client.setDate_naissance(dateNaissance);
            client.setTele(tele);
            client.setNom_utilisateur(nomUtilisateur);
            client.setPassword(password);

            // Mise à jour du client dans la base de données
            clientDao.mettreAJourClient(client.getId(), client);
            
            // Définir le message de succès dans la session
            session.setAttribute("successMessage", "La mise à jour du client a été réalisée avec succès.");
            
            
            // Redirection vers une page de succès
            response.sendRedirect("HomeClient.jsp");
        } catch (Exception e) {
            // Gestion des exceptions
            e.printStackTrace();
            // Redirection vers une page d'erreur avec un message d'erreur
            request.setAttribute("errorMessage", "Une erreur s'est produite lors de la mise à jour du client. Veuillez réessayer plus tard.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
