<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.AdminClientDao" %>

<%
    // Récupérer l'identifiant de la réservation à valider
    int reservationId = Integer.parseInt(request.getParameter("reservationId"));
    
    // Mettre à jour l'état de la réservation dans la base de données
    AdminClientDao adminClientDao = new AdminClientDao();
    adminClientDao.validerReservation(reservationId);
    
    
    // Rediriger l'utilisateur vers la page HomeAdmin.jsp
       response.sendRedirect("SuiviReservationAdmin.jsp");

%>
