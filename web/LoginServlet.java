package web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Client;
import dao.ClientDao;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ClientDao clientDao = new ClientDao();

    
    
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("user");
        String password = request.getParameter("pwd"); 	
        
        boolean isClientAuthenticated = clientDao.authentifier(username, password);
        boolean isAdminAuthenticated = clientDao.authentifierAdmin(username, password);
        
        if (isClientAuthenticated) {
            HttpSession session = request.getSession(true);
            Client client = clientDao.getClientInfo(username);
            session.setAttribute("client", client);
            response.sendRedirect("ClientServlet");
        } else if (isAdminAuthenticated) {
            HttpSession session = request.getSession(true);
            session.setAttribute("admin", true);
            response.sendRedirect("AdminClientServlet");
        } else {
        	
        	request.setAttribute("errorMessage", "Username or password incorrect");
        	request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
