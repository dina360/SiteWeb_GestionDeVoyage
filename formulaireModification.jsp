<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="beans.Client" %>
<%@ page import="dao.AdminClientDao" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modifier Client</title>
    <!-- Inclure Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Ajouter des styles personnalisés ici */
        body {
            padding: 20px;
        }
        form {
            max-width: 500px;
            margin: 0 auto;
        }
        h1 {
            text-align: center;
        }
    </style>
</head>
<body>
    <h1>Modifier Client</h1>
    
    <% 
    try {
        // Récupérer l'ID du client à partir du paramètre de requête
        int clientId = Integer.parseInt(request.getParameter("id"));
        
        // Récupérer les détails du client à partir de la base de données en fonction de l'ID
        AdminClientDao adminClientDao = new AdminClientDao();
        Client client = adminClientDao.getClientById(clientId);
    %>
    
    <form action="ModifierClientServlet" method="post">
        <input type="hidden" name="id" value="<%= client.getId() %>">
        <div class="form-group">
            <label for="nom">Nom :</label>
            <input type="text" class="form-control" name="nom" value="<%= client.getNom() %>">
        </div>
        <div class="form-group">
            <label for="prenom">Prénom :</label>
            <input type="text" class="form-control" name="prenom" value="<%= client.getPrenom() %>">
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="text" class="form-control" name="email" value="<%= client.getEmail() %>">
        </div>
        <div class="form-group">
            <label for="date_naissance">Date de Naissance:</label>
            <input type="text" class="form-control" name="date_naissance" value="<%= client.getDate_naissance()  %>">
        </div>
        <div class="form-group">
            <label for="tele">Téléphone:</label>
            <input type="text" class="form-control" name="tele" value="<%= client.getTele()  %>">
        </div>
        <div class="form-group">
            <label for="nom_utilisateur">Nom d'utilisateur:</label>
            <input type="text" class="form-control" name="nom_utilisateur" value="<%= client.getNom_utilisateur()%>">
        </div>
        <div class="form-group">
            <label for="password">Mot de passe:</label>
            <input type="text" class="form-control" name="password" value="<%= client.getPassword() %>">
        </div>
       
        <button type="submit" class="btn btn-primary">Modifier</button>
        
    </form>
    
    <% 
    } catch (Exception e) {
        e.printStackTrace();
        // Gestion de l'exception : affichage d'un message d'erreur
        out.println("Une erreur s'est produite lors de la récupération des informations du client.");
    }
    %>

    <!-- Inclure Bootstrap JS (facultatif, mais nécessaire pour certaines fonctionnalités de Bootstrap) -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
