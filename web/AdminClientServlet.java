package web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Client;
import dao.AdminClientDao;

@WebServlet("/AdminClientServlet")
public class AdminClientServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AdminClientDao adminClientDao = new AdminClientDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Client> clients = adminClientDao.getAllClients();
        // Récupérer la session
        HttpSession session = request.getSession();
        // Mettre à jour la session avec la liste des clients
        session.setAttribute("clients", clients);
	    
        // Vérifier si le message de succès est présent dans la session

        String successMessage = (String) session.getAttribute("successMessage");
        if (successMessage != null) {
            request.setAttribute("successMessage", successMessage);
            session.removeAttribute("successMessage");
        }
       
        String successMessageDelete = (String) session.getAttribute("successMessageDelete");
        if (successMessageDelete != null) {
            request.setAttribute("successMessageDelete", successMessageDelete);
            session.removeAttribute("successMessageDelete");
        }
        String  successMessageMod = (String) session.getAttribute(" successMessageMod");
        if ( successMessageMod != null) {
            request.setAttribute(" successMessageMod",  successMessageMod);
            session.removeAttribute(" successMessageMod");
        }
        // Rediriger vers HomeAdmin.jsp
        request.getRequestDispatcher("HomeAdmin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
            response.sendRedirect("HomeAdmin.jsp");
        }
    
}