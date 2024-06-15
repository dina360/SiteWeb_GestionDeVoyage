<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    // Récupérer l'ID de l'offre à modifier depuis les paramètres de la requête
    int offreId = Integer.parseInt(request.getParameter("id"));

    // Déclarer les variables pour stocker les informations de l'offre
    int id = 0;
    String titre = "";
    String description = "";
    String image = "";
    String hotel = "";
    String restaurant = "";
    String ville = "";
    float p_i = 0;
    float p_a = 0;
    int remise = 0;
    int nbr = 0;

    // Connexion à la base de données et récupération des informations de l'offre à modifier
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestionvoyage", "root", "");

        // Requête SQL pour récupérer les informations de l'offre à partir de son ID
        String query = "SELECT * FROM packages WHERE id = ?";
        preparedStatement = connection.prepareStatement(query);
        preparedStatement.setInt(1, offreId);
        rs = preparedStatement.executeQuery();

        // Si une offre correspondante est trouvée, récupérer ses informations
        if (rs.next()) {
            id = rs.getInt("id");
            titre = rs.getString("titre");
            description = rs.getString("description");
            image = rs.getString("image");
            hotel = rs.getString("hotel");
            restaurant = rs.getString("restaurant");
            ville = rs.getString("ville");
            p_i =rs.getInt("p_i");
            p_a=rs.getInt("p_a");
            remise = rs.getInt("remise");
            nbr = rs.getInt("nbr");
            
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (preparedStatement != null) preparedStatement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

<!-- Formulaire de modification d'offre -->
<!-- Formulaire de modification d'offre -->
<form id="formModifierOffre" action="ModifierOffreServlet" method="post" enctype="multipart/form-data">
    <input type="hidden" id="offreId" name="offreId" value="<%= id %>">
    <div class="form-group">
        <label for="titre">Titre</label>
        <input type="text" class="form-control" id="titre" name="titre" value="<%= titre %>">
    </div>
    <div class="form-group">
        <label for="description">Description</label>
        <textarea class="form-control" id="description" name="description"><%= description %></textarea>
    </div>
    <div class="form-group">
        <label for="image">Image actuelle</label>
        <br>
        <img src="<%= image %>" alt="Image de l'offre" style="max-width: 200px; max-height: 200px;">
    </div>
    <div class="form-group">
        <label for="nouvelleImage">Nouvelle image (optionnel)</label>
        <input type="file" class="form-control" id="nouvelleImage" name="nouvelleImage" accept="image/jpeg, image/png, image/gif">
    </div>
    <div class="form-group">
        <label for="hotelImage">Image actuelle de l'hôtel</label>
        <br>
        <img src="<%= hotel %>" alt="Image de l'hôtel" style="max-width: 200px; max-height: 200px;">
    </div>
    <div class="form-group">
        <label for="nouvelleImageHotel">Nouvelle image de l'hôtel (optionnel)</label>
        <input type="file" class="form-control" id="nouvelleImageHotel" name="nouvelleImageHotel" accept="image/jpeg, image/png, image/gif">
    </div>
    <div class="form-group">
        <label for="restaurantImage">Image actuelle du restaurant</label>
        <br>
        <img src="<%= restaurant %>" alt="Image du restaurant" style="max-width: 200px; max-height: 200px;">
    </div>
    <div class="form-group">
        <label for="nouvelleImageRestaurant">Nouvelle image du restaurant (optionnel)</label>
        <input type="file" class="form-control" id="nouvelleImageRestaurant" name="nouvelleImageRestaurant" accept="image/jpeg, image/png, image/gif">
    </div>
    <div class="form-group">
        <label for="villeImage">Image actuelle de la ville</label>
        <br>
        <img src="<%= ville %>" alt="Image de la ville" style="max-width: 200px; max-height: 200px;">
    </div>
    <div class="form-group">
        <label for="nouvelleImageVille">Nouvelle image de la ville (optionnel)</label>
        <input type="file" class="form-control" id="nouvelleImageVille" name="nouvelleImageVille" accept="image/jpeg, image/png, image/gif">
    </div>
    <div class="form-group">
        <label for="prixInitial">Prix initial</label>
        <input type="number" class="form-control" id="prixInitial" name="prixInitial" value="<%= p_i %>">
    </div>
    <div class="form-group">
        <label for="prixActuel">Prix actuel</label>
        <input type="number" class="form-control" id="prixActuel" name="prixActuel" value="<%= p_a %>">
    </div>
    <div class="form-group">
        <label for="remise">Remise</label>
        <input type="number" class="form-control" id="remise" name="remise" value="<%= remise %>">
    </div>
    <div class="form-group">
        <label for="nombrePaquetRestants">Nombre de paquets restants</label>
        <input type="number" class="form-control" id="nombrePaquetRestants" name="nombrePaquetRestants" value="<%= nbr %>">
    </div>
    <button type="submit" class="btn btn-primary">Modifier</button>
</form>

