<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>
    <!-- Votre propre fichier CSS -->
    
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>	    
	<link href="css/LoginStyle.css" rel="stylesheet" type="text/css">

</head>

<body>
    <div class="envlopper">
        <form method="POST" action="LoginServlet">
        
            <h1>Login</h1>
			   <div id="errorMessage" class="error-message">
	       <% 
					  String errorMessage = (String) request.getAttribute("errorMessage");
				 if(errorMessage != null) {
			 %>
			<p><%= errorMessage %></p>
			<% } %>
                </div>
                <div class="saisir">
                    <input type="text" placeholder="nom d'utilisateur" name="user" required>
                    <i class='bx bxs-user'></i>
                </div>
                
                <div class="saisir">
                    <input type="password" placeholder="Mot de passe" name="pwd" required>
                    <i class='bx bxs-lock-alt'></i>
                </div>

                <div class="visible">
                    
                    <a href="#">Mot de passe oublié ?</a>
                </div>

                <button type="submit" class="btn">Login</button>

                <div class="enregistrer"><br>
                    <p>Vous n'avez pas de compte ?<a href="creercompte.jsp"> Créer Compte </a> <p>
                </div>
        </form>

        </div>

</body>
</html>