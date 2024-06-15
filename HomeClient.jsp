<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="beans.Client" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HomeClient</title>
       
    <!-- Box Icons  -->
    <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
    <!-- Styles  -->
    <link rel="shortcut icon" href="assets/img/kxp_fav.png" type="image/x-icon">
    <link rel="stylesheet" href="css/suppOffre.css">
    
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <!-- Lien vers la feuille de style Bootstrap -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/2.0.5/css/dataTables.bootstrap5.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
    <link href="css/pageclient.css" rel="stylesheet" type="text/css">

    <style>

@import url('https://fonts.googleapis.com/css2?family=Bowlby+One&family=Cabin:ital,wght@0,400..700;1,400..700&display=swap');

        .flex-container {
            display: flex;
            align-items: center;
        }

        .flex-container a {
            margin-right: 10px; /* Espace entre le lien et le bouton */
        }

        .flex-container button {
            background: none; /* Supprime le style de fond par défaut */
            border: none; /* Supprime les bordures par défaut */
            cursor: pointer;
        }

        .container {
            position: absolute;
            height: 120vh;
            left: 25%;
            max-width: 120vh;
            margin: 5% auto;
            height:105vh;
            padding: 20px;
            background-color:#EEEEEE;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color:#2D3F51;
            font-size: 34px;
            margin-bottom: 20px;
            text-align: center;
			font-family: "Cabin", sans-serif;
			  font-optical-sizing: auto;
			  font-weight: <weight>;
			  font-style: normal;
			  font-variation-settings:
			    "wdth" 100;
			}           
       
        label {
            font-weight: bold;
        }

        .form-control {
            margin-bottom: 15px;
        }
        .btn-primary {
            background-color: #adb5bd;
            border-color: #adb5bd;
        }
	.btn-primary:hover {
    background-color:  #343a40; /* Couleur de fond au survol */
    border-color:  #343a40;
}

        a {
            color: #343a40;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<body>
<!-- Header -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">
        <img src="./css/image/logo.png" alt="Explore Maroc" class="navbar-logo">
        EXPLOREMAROC
    </a>
    <ul class="navbar-nav ml-auto">
        <li class="nav-item">
            <a class="nav-link" href="#">
                <img src="./css/image/icone1.png" width="30%" height="30%"> <b>Bonjour <%= ((Client) request.getSession().getAttribute("client")).getNom() %> </b>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="LogoutServlet">
                <i class="material-icons">power_settings_new</i>
            </a>
        </li>
    </ul>
</nav>
<!-- Sidebar -->
<div class="sidebar">
    <div class="sidebar-header">
        <img src="./css/image/icone4.png" alt="Profile Picture" >
        <div class="sidebar-user-info">
          <b><span><h5><%= ((Client) request.getSession().getAttribute("client")).getPrenom() %> <%= ((Client) request.getSession().getAttribute("client")).getNom() %></h5></span></b>
            <strong><span>Client</span></strong>
        </div>
    </div>
    <ul class="components">
        <li>
            <a href="accueil.jsp">
                <img class="icon" src="./css/icones/accueil1.png" width="29%" height="29%">   Accueil
            </a>    
        </li>
        <li>
            <a href="HomeClient.jsp">
                <img class="icon" src="./css/icones/cv.png" width="29%" height="29%"> Information personnelle
            </a>
        </li>
     <li>
            <a href="ListeReservClient.jsp">
                <img class="icon" src="./css/icones/travel.png" width="29%" height="29%">  liste des réservations 
            </a>
        </li>
        <li>
            <a href="Contact.jsp">
                <img class="icon" src="./css/icones/contact1.png" width="29%" height="29%"> Contact
            </a>
        </li>
    </ul>
</div>
<div class="main-content"> 
<% 
            // Vérifiez si le message de succès est présent dans la session
            String successMessage = (String) session.getAttribute("successMessage");
            if (successMessage != null) {
        %>
            <div class="alert alert-success" role="alert" onclick="this.remove();">
                <%= successMessage %>
            </div>
        <% 
            // Supprimez le message de succès après l'affichage
            session.removeAttribute("successMessage");
            }
        %>
<br><br><h1 class="mb-4"><b>Espace des Clients </b></h1>
    <div class="container mt-5"> 
        <!-- Formulaire de mise à jour des informations du client -->
        <form method="POST" action="MettreAJourClientServlet">
            <div class="mb-3">
                <label for="nom" class="form-label">Nom:</label>
                <input type="text" class="form-control" id="nom" name="nom" value="<%= ((Client) request.getSession().getAttribute("client")).getNom() %>">
            </div>

            <div class="mb-3">
                <label for="prenom" class="form-label">Prénom:</label>
                <input type="text" class="form-control" id="prenom" name="prenom" value="<%= ((Client) request.getSession().getAttribute("client")).getPrenom() %>">
            </div>

            <div class="mb-3">
                <label for="email" class="form-label">Email:</label>
                <input type="email" class="form-control" id="email" name="email" value="<%= ((Client) request.getSession().getAttribute("client")).getEmail() %>">
            </div>

            <div class="mb-3">
                <label for="date_naissance" class="form-label">Date de Naissance:</label>
                <input type="date" class="form-control" id="date_naissance" name="date_naissance" value="<%= ((Client) request.getSession().getAttribute("client")).getDate_naissance() %>">
            </div>

            <div class="mb-3">
                <label for="tele" class="form-label">Téléphone:</label>
                <input type="tel" class="form-control" id="tele" name="tele" value="<%= ((Client) request.getSession().getAttribute("client")).getTele() %>">
            </div>

            <div class="mb-3">
                <label for="nom_utilisateur" class="form-label">Nom d'utilisateur:</label>
                <input type="text" class="form-control" id="nom_utilisateur" name="nom_utilisateur" value="<%= ((Client) request.getSession().getAttribute("client")).getNom_utilisateur() %>">
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Mot de passe:</label>
                <input type="password" class="form-control" id="password" name="password" value="<%= ((Client) request.getSession().getAttribute("client")).getPassword() %>">
            </div>

            <button type="submit" class="btn btn-primary">Mettre à jour</button><br><br>
        </form>

    </div>
</div>


<!-- Inclusion des scripts JavaScript nécessaires -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- Script Bootstrap (JavaScript) -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>
