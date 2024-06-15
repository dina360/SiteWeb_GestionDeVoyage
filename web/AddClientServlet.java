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

@WebServlet("/AddClientServlet")
public class AddClientServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérer les paramètres du formulaire
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String email = request.getParameter("email");
        Date date_naissance = Date.valueOf(request.getParameter("date_naissance"));
        long tele = Long.parseLong(request.getParameter("tele"));
        String nom_utilisateur = request.getParameter("nom_utilisateur");
        String password = request.getParameter("password");
        
        // Créer un objet Client avec les données récupérées
        Client client = new Client();
        client.setNom(nom);
        client.setPrenom(prenom);
        client.setEmail(email);
        client.setDate_naissance(date_naissance);
        client.setTele(tele);
        client.setNom_utilisateur(nom_utilisateur);
        client.setPassword(password);
        
        // Ajouter le client à la base de données
        ClientDao ClientDao = new ClientDao();
        try {
			ClientDao.enregistreClient(client);

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        HttpSession session = request.getSession();
        session.setAttribute("successMessage", "L'ajout du client a été réalisé avec succès.");
        
        request.getRequestDispatcher("AdminClientServlet").forward(request, response);
    }
}
