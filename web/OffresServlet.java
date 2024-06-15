package web;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Offre;
import dao.OffreDAO;

@WebServlet("/OffresServlet")
public class OffresServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        OffreDAO offreDAO = new OffreDAO();
        List<Offre> offres = offreDAO.getAllOffres();
        request.setAttribute("offres", offres);
        RequestDispatcher dispatcher = request.getRequestDispatcher("offres.jsp");
        dispatcher.forward(request, response);
    }
}
