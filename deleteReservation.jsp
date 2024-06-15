<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.AdminClientDao" %>
<%@ page import="java.util.List" %>
<%@ page import="beans.Reservation" %>
<%
    
    int reservationId = Integer.parseInt(request.getParameter("reservId"));

    AdminClientDao adminClientDao = new AdminClientDao();
    adminClientDao.deleteReservation(reservationId);

  
    List<Reservation> reservations = adminClientDao.getAllReservations();
    session.setAttribute("successMessage", "Suppression réalisée avec succès");
    request.setAttribute("reservations", reservations);
%>

<%
    
response.sendRedirect("SuiviReservationAdmin.jsp");

%>