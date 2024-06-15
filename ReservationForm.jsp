<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="beans.Client"%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulaire de Réservation</title>
    <link href="css/offre.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<style>
.reservation-form {
    background-color: #ffffff; /* Fond blanc pour le formulaire */
    padding: 20px; /* Ajoute un peu d'espace à l'intérieur du formulaire */
    border-radius: 10px; /* Coins arrondis pour le formulaire */
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); /* Ombre légère pour le formulaire */
}


</style>
<body>

	<%
	    // Utilisez la session implicite disponible dans JSP
	    Client client = (session != null) ? (Client) session.getAttribute("client") : null;
	
	    if (client == null) {
	        response.sendRedirect("login.jsp");
	        return;
	    }
	%>
 <div class="container">
    <div class="row">
        <div class="col-md-6 mx-auto">
            <h2 class="text-center mb-4">Formulaire de Réservation</h2>
            <form class="reservation-form">
                <div class="form-group">
                    <label for="nom">Nom</label>
                    <input type="text" class="form-control" id="nom" placeholder="Entrez votre nom">
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" placeholder="Entrez votre email">
                </div>
                <div class="form-group">
                    <label for="telephone">Téléphone</label>
                    <input type="tel" class="form-control" id="telephone" placeholder="Entrez votre numéro de téléphone">
                </div>
                <div class="form-group">
                    <label for="date">Date de Réservation</label>
                    <input type="date" class="form-control" id="date">
                </div>
                <div class="form-group">
                    <label for="commentaire">Commentaire</label>
                    <textarea class="form-control" id="commentaire" rows="3" placeholder="Entrez votre commentaire"></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Envoyer</button>
            </form>
        </div>
    </div>
</div>
 

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

 	
</body>
</html>
