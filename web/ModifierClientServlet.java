package web;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Client;
import dao.AdminClientDao;

@WebServlet("/ModifierClientServlet")
public class ModifierClientServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AdminClientDao adminClientDao = new AdminClientDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int clientId = Integer.parseInt(request.getParameter("id"));
            String nom = request.getParameter("nom");
            String prenom = request.getParameter("prenom");
            String email = request.getParameter("email");
            Date dateNaissance = Date.valueOf(request.getParameter("date_naissance"));
            long tele = Long.parseLong(request.getParameter("tele"));
            String nomUtilisateur = request.getParameter("nom_utilisateur");
            String password = request.getParameter("password");

            Client client = new Client();
            client.setId(clientId);
            client.setNom(nom);
            client.setPrenom(prenom);
            client.setEmail(email);
            client.setDate_naissance(dateNaissance);
            client.setTele(tele);
            client.setNom_utilisateur(nomUtilisateur);
            client.setPassword(password);

            adminClientDao.updateClient(client);
            request.getSession().setAttribute("successMessageMod", "La Modification a été réalisée avec succès.");
            response.sendRedirect("AdminClientServlet");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Une erreur s'est produite lors de la mise à jour du client. Veuillez réessayer plus tard.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}


