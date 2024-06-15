package web;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Client;
import beans.Reservation;
import dao.ClientDao;

@WebServlet("/ClientServlet")
public class ClientServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ClientDao clientDao = new ClientDao();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 response.setCharacterEncoding("UTF-8");
    	    request.setCharacterEncoding("UTF-8");
        // Récupérer l'ID du client à partir de la session
        Client client = (Client) request.getSession().getAttribute("client");
        int clientId = client.getId();

        // Récupérer les réservations par l'ID du client
        List<Reservation> reservations = clientDao.getReservationsByClientId(clientId);

        // Mettre à jour la session avec la liste des réservations
        HttpSession session = request.getSession();
        session.setAttribute("reservations", reservations);

        // Rediriger vers la page ListeReservClient.jsp
        request.getRequestDispatcher("ListeReservClient.jsp").forward(request, response);
    }	
   
    

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String email = request.getParameter("email");
        String dateNaissanceStr = request.getParameter("datenaissance");
        String tele = request.getParameter("tele");
        String nomUtilisateur = request.getParameter("user");
        String password = request.getParameter("pwd");
        
        // Conversion de la date de naissance
        Date dateNaissance = Date.valueOf(dateNaissanceStr);
        boolean emailExists = clientDao.emailExists(email);
        boolean usernameExists = clientDao.usernameExists(nomUtilisateur);
        boolean passwordExists = clientDao.passwordExists(password);

        if (emailExists) {
            // Ajout d'un message d'erreur pour l'email
            request.setAttribute("emailError", "L'email existe déjà!");
        }
        if (usernameExists) {
            // Ajout d'un message d'erreur pour le nom d'utilisateur
            request.setAttribute("usernameError", "Le nom d'utilisateur existe déjà!");
        }
        if (passwordExists) {
            // Ajout d'un message d'erreur pour le mot de passe
            request.setAttribute("passwordError", "Le mot de passe existe déjà!");
        }

        if (emailExists || usernameExists || passwordExists) {
            // Redirection vers la page de création de compte avec les messages d'erreur
            request.getRequestDispatcher("creercompte.jsp").forward(request, response);
            return; // Arrêter l'exécution de la méthode
        }
        // Création de l'objet Client
        Client client = new Client();
        client.setNom(nom);
        client.setPrenom(prenom);
        client.setEmail(email);
        client.setDate_naissance(dateNaissance);
        client.setTele(Long.parseLong(tele));
        client.setNom_utilisateur(nomUtilisateur);
        client.setPassword(password);
        
        try {
            // Enregistrement du client dans la base de données et récupération de son ID
            int clientId = clientDao.enregistreClient(client);
            
            // Redirection vers la page d'accueil
            response.sendRedirect("HomeClient.jsp");
        } catch (Exception e) {
            // Gestion des exceptions
            e.printStackTrace();
            // Redirection vers une page d'erreur
            response.sendRedirect("error.jsp");
        }
    }
}
