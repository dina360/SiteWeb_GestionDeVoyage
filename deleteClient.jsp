<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.AdminClientDao" %>
<%@ page import="java.util.List" %>
<%@ page import="beans.Client" %>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>
<%
    // Récupérer l'ID du client à supprimer depuis les paramètres de requête
    int clientId = Integer.parseInt(request.getParameter("id"));

    // Supprimer le client
    AdminClientDao adminClientDao = new AdminClientDao();
    adminClientDao.deleteClient(clientId);
    
    // Récupérer à nouveau la liste des clients
    List<Client> clients = adminClientDao.getAllClients();
    // Définir la liste des clients comme attribut de requête pour l'affichage dans la page
    request.setAttribute("clients", clients);
    
    // Ajouter le message de succès de suppression à la requête
   session.setAttribute("successMessageDelete", "Le client a été supprimé avec succès.");
 %>

<%
    // Rediriger vers la servlet AdminClientServlet après la suppression
    response.sendRedirect("AdminClientServlet");
%>
