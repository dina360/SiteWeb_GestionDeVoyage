<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="fr">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Créer Compte</title>
    <!-- Votre propre fichier CSS -->
    <link href="css/LoginStyle.css" rel="stylesheet" type="text/css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

</head>

<body>
    <div class="envlopper">
        <form method="POST" action="ClientServlet">
            <h1>Sign Up</h1>
             <div id="errorMessage" class="error-message">
                <!-- Votre contenu existant ... -->
    <% String error = (String) request.getAttribute("error");
       if (error != null) { %>
           <div class="error-message">
               <%= error %>
           </div>
    <% } %></div>
                <div class="saisir">
                    <input type="text" placeholder="Nom" name="nom" required>
                </div>
                
                <div class="saisir">
                    <input type="text" placeholder="Prenom" name="prenom" required>
                </div>
                <div class="saisir">
                    <input type="email" placeholder="xxxxx@gmail.com" name="email" required>
                    <i class='bx bx-envelope'></i>
                    <% String emailError = (String) request.getAttribute("emailError");
               if (emailError != null) { %>
                   <span class="error-message">
                       <%= emailError %>
                   </span>
            <% } %>
                </div>
                <div class="saisir">
                    <input type="date" placeholder="Date de naissance" name="datenaissance" required>
                    <i class='bx bx-calendar'></i>
                </div>
                <div class="saisir">
                    <input type="tel" placeholder="Numero de telephone" name="tele" required>
                    <i class='bx bx-phone-call'></i>
                </div>
                <div class="saisir">
                    <input type="text" placeholder="Nom d'utilisateur" name="user" required>
                    <i class='bx bxs-user-circle'></i>
                    <% String usernameError = (String) request.getAttribute("usernameError");
               if (usernameError != null) { %>
                   <span class="error-message">
                       <%= usernameError %>
                   </span>
            <% } %>
                </div>
                <div class="saisir">
                    <input type="password" placeholder="Mot de passe" name="pwd" required>
                    <i class='bx bxs-lock-alt'></i>
                    <% String passwordError = (String) request.getAttribute("passwordError");
               if (passwordError != null) { %>
                   <span class="error-message">
                       <%= passwordError %>
                   </span>
            <% } %>
                </div>
                
                <button type="submit" class="btn">Créer Compte</button>

                <div class="enregistrer"><br>
                    <p>Vous avez déjà créer un compte ? <a href="login.jsp"> Se Connecter </a> <p>
                </div>
        </form>
        
    </div>



</body>
</html>