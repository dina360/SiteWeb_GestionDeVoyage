<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="beans.Client" %>
<%@ page import ="javax.servlet.http.HttpSession"%>

<%
Client client = (session != null) ? (Client) session.getAttribute("client") : null;

    boolean isLoggedIn = (client != null);
%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Paquet de Voyage</title>
    <link href="css/offre.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
   <style>
   
          .navbar-logo {
			    width: 56px; /* Largeur de l'image du logo */
			    height: 56px; /* Hauteur de l'image du logo */
			}
.navbar {
    padding: 0.5rem 1rem; /* Ajustez les valeurs pour obtenir la hauteur désirée */
    height: 57px; /* Fixez la hauteur de la navbar */
    display: flex;
    align-items: center;
     background-color: rgb(206, 206, 206);
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}
    .additional-images {
            display: flex;
            justify-content: center;
            margin-top:0.75px;
        }
        .additional-images img {
            padding:0px;
            width: 115px;
            height:130px;
            margin: 0 1px;
        }
        
	.card h6{
			text-align:left;	
	
	}
	    .price-section {
        display: flex;
        align-items: center;
        gap: 5px; /* Espacement entre l'icône et le texte */
    }
    .price-section .icon {
        width: 30px; /* Ajustez la taille de l'icône si nécessaire */
        height: 30px;
    }
    .price-line {
    display: flex;
    align-items: center; /* Center items vertically if needed */
    margin-bottom: 5px; /* Add some space between lines if needed */
	}
	.price-line .icon {
	 width: 30px; 
        height: 30px;
	}
	.price-transport {
    display: flex;
    align-items: center; /* Center items vertically if needed */
    margin-bottom: 5px; /* Add some space between lines if needed */
	}
	.price-transport .icon {
	    width: 30px; 
        height: 30px;
	}
	.price-duree {
    display: flex;
    align-items: center; /* Center items vertically if needed */
    margin-bottom: 5px; /* Add some space between lines if needed */
	}
	.price-duree .icon {
	    width: 30px; 
        height: 30px;
	}

	.btn-reserver {
            display: flex;
            align-items: center;
        }
        .btn-reserver img,
        .btn-reserver i {
            margin-right: 5px;
        }
    .green-icon {
            color: green; /* Changer la couleur de l'icône en vert */
        }
        
    /* Ajoutez ces styles dans votre fichier CSS ou dans une balise <style> dans le <head> */
.navbar-nav.ml-auto.prof {
    display: flex;
    align-items: center;
    justify-content: flex-end;
    list-style: none;
    padding: 0;
    margin: 0;
}

.navbar-nav.ml-auto.prof .nav-item.prof {
    margin-left: 15px;
}
/* Ajoutez ces styles dans votre fichier CSS ou dans une balise <style> dans le <head> */
.navbar-nav.ml-auto.prof {
    display: flex;
    align-items: center;
    justify-content: flex-end;
    list-style: none;
    padding: 0;
    margin: 0;
}

.navbar-nav.ml-auto.prof .nav-item.prof {
    margin-left: 15px;
}

.navbar-nav.ml-auto.prof .nav-link {
    display: flex;
    align-items: center;
    text-decoration: none;
    color: #333;
    font-size: 16px;
    font-weight: bold;
    transition: color 0.3s ease;
}

.navbar-nav.ml-auto.prof .nav-link:hover {
    color: #007bff;
}

.navbar-nav.ml-auto.prof .nav-link img {
    margin-right: 8px;
    border-radius: 50%; /* Rend l'image circulaire */
    width: 40px; /* Vous pouvez ajuster la taille selon vos besoins */
    height: 40px; /* Vous pouvez ajuster la taille selon vos besoins */
    object-fit: cover; /* S'assure que l'image s'adapte bien à la forme circulaire */
}

    
        
  </style>
</head>
<body>


    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="accueil.jsp">
        <img src="./css/image/logo.png" alt="Explore Maroc" class="navbar-logo">
            <span>E</span><span>x</span><span>p</span><span>l</span><span>o</span><span>r</span><span>e</span><span>M</span><span>a</span><span>r</span><span>o</span><span>c</span>
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="accueil.jsp">Accueil</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="PackVoyage.jsp">Voyages</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Offre.jsp">Offres</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Contact</a>
                </li>
            </ul>
            <% if (isLoggedIn) { %>
    <ul class="navbar-nav ml-auto prof">
    <li class="nav-item prof">
        <a class="nav-link" href="HomeClient.jsp">
            <img src="./css/icones/perso.png" alt="Profile Picture">
            <%= client.getNom() %>
        </a>
    </li>
</ul>

<% } %>
        </div>
    </nav>
    <div class="container"><br>
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
        
        <% 
    // Vérifiez si le message de succès est présent dans la session
    String successMessageDL = (String) session.getAttribute("successMessageDL");
    if (successMessageDL != null) {
%>
    <div class="alert alert-success" role="alert" onclick="this.remove();">
        <%= successMessageDL %>
    </div>
<% 
    // Supprimez le message de succès après l'affichage
    session.removeAttribute("successMessageDL");
}
%>
        
    
        <h1 class="text-center mb-4" >Découvrez nos paquets de voyage</h1>
        <div id="carouselPackages" class="carousel slide" data-ride="carousel"><br><br>
            <div class="carousel-inner">
                <% 
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    String url = "jdbc:mysql://localhost:3306/gestionvoyage";
                    String user = "root";
                    String password = "";
                    conn = DriverManager.getConnection(url, user, password);
                    stmt = conn.createStatement();
                    String sql = "SELECT * FROM packages WHERE remise = 0";
                    rs = stmt.executeQuery(sql);
                    boolean first = true;
                    int count = 0;
                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String titre = rs.getString("titre");
                        String description = rs.getString("description");
                        String image = rs.getString("image");
                        String hotel = rs.getString("hotel");
                        String restaurant = rs.getString("restaurant");
                        String ville = rs.getString("ville");
                        float prix_initiale = rs.getInt("p_i");
                        float prix_actuel = rs.getInt("p_a");
                        int remise = rs.getInt("remise");
                        int nbr= rs.getInt("nbr");
                        if (nbr == 0) {
                            String sqlsupp = "DELETE FROM packages WHERE id = ?";
                            try (PreparedStatement deleteStmt = conn.prepareStatement(sqlsupp)) {
                                deleteStmt.setInt(1, id);
                                int rowsDeleted = deleteStmt.executeUpdate();
                                
                                    // Le pack a été supprimé avec succès, afficher un message de succès
                                    session.setAttribute("successMessageDL", "Le pack a été supprimé avec succès.");
                              
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                            continue; // Passez au prochain enregistrement
                        }

                        if (count % 3 == 0) { // Commencez un nouvel élément de carousel tous les 3 éléments
                            if (count == 0) { %>
                                <div class="carousel-item <%= first ? "active" : "" %>">
                                    <div class="row">
                            <% first = false; %>
                            <% } else { %>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="row">
                            <% } %>
                        <% } %>
                        <div class="col-md-4 mb-4">
                            <div class="card position-relative">
                                <img src="<%= image %> " class="card-img-top" alt="">
                                <div class="additional-images">
                                    <img src="<%= hotel %>" class="img-thumbnail">
                                    <img src="<%= restaurant %>" class="img-thumbnail">
                                    <img src="<%= ville %>" class="img-thumbnail">
                                </div>
                              
                                <div class="card-body">
                                    <h5 class="card-title"><%= titre %></h5>
                                    <p class="card-text"><%= description %></p>
                                    <div class="price-section">
                                        <img class="icon" src="./css/icones/money.png" width="10px" height="10px">
                                        <h6><%= prix_initiale %></h6><br>
                                    </div>
                                    <div class="price-line">
                                        <img class="icon" src="./css/icones/personne.png" width="10px" height="10px">&nbsp;<br><h6>Par Personne</h6>
                                    </div>
                                    <div class="price-duree">
                                        <img class="icon" src="./css/icones/duree.png" width="10px" height="10px">&nbsp;<br><h6>par jour</h6>
                                    </div>
                                   
                                    <button class="btn bg-warning text-dark" onclick="checkLoginAndReserve(this)"
                                            data-titre="<%= titre %>"
                                            data-prix-actuel="<%= prix_actuel %>"
                                            data-id="<%= id %>">
                                        <i class="fas fa-check-circle green-icon"></i> Réserver
                                    </button>
                                </div>
                            </div>
                        </div>
                        <% count++; %>
                        <% } %>
                    </div>
                </div>
                <% } catch (SQLException | ClassNotFoundException e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) {
                        try {
                            rs.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                    if (stmt != null) {
                        try {
                            stmt.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                    if (conn != null) {
                        try {
                            conn.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                }
                %>
            </div>
            <a class="carousel-control-prev" href="#carouselPackages" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselPackages" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
      

  
<!-- Modal de réservation -->
<div class="modal fade" id="reservationModal" tabindex="-1" role="dialog" aria-labelledby="reservationModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="reservationModalLabel">Formulaire de Réservation</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="ReserveServlet" action="Reserve" method="post">
                <div class="form-group">
                	<label for="id"> Id De Client</label>
						<input type="text" class="form-control" id="clientId" name="clientId" value="<%= (request.getSession().getAttribute("client") != null) ? ((Client) request.getSession().getAttribute("client")).getId() : "" %>">
				</div>
				      <div class="form-group">
				      <label for="title">Id de Voyage</label>
					    <input type="hidden" id="packId" name="packId" readonly>
					</div>          
                    <div class="form-group">
                        <label for="title">Titre de Voyage</label>
                        <input type="text" class="form-control" id="title" name="title" readonly>
                    </div>
                    <div class="form-group">
                        <label for="depart">Ville de Départ</label>
                        <input type="text" class="form-control" id="depart" name="depart" placeholder="Ville de départ" required>
                    </div>
                    <div class="form-group">
                        <label for="departDate">Date de Départ</label>
                        <input type="date" class="form-control" id="departDate" name="departDate" required>
                    </div>
                    <div class="form-group">
                        <label for="duration">Durée de Voyage (jours)</label>
                        <input type="number" class="form-control" id="duration" name="duration" placeholder="Durée en jours" required>
                    </div>
                    <div class="form-group">
                        <label for="guests">Nombre de Personnes (max.4)</label>
                        <input type="number" class="form-control" id="guests" name="guests" placeholder="Nombre de personnes" max="4" required>
                    </div>
                    <div class="form-group">
                        <label for="transport">Moyen de Transport</label>
                        <select class="form-control" id="transport" name="transport">
                            <option value="">Sélectionnez le moyen de transport</option>
                            <option value="train">Train</option>
                            <option value="voiture">Voiture</option>
                            <option value="bus">Bus</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="currentPrice">Prix Actuel</label>
                        <input type="text" class="form-control" id="currentPrice" name="currentPrice" readonly>
                    </div>
                    <div class="form-group">
                        <label for="totalPrice">Prix Total</label>
                        <input type="text" class="form-control" id="totalPrice" name="totalPrice" readonly>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
                        <button type="button" class="btn btn-primary" onclick="calculateTotalPrice()">Afficher P.TOTALE</button>
                        <button type="submit" id="btnReserver" class="btn btn-primary" style="display: none;">Réserver</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>





    <script>
    function calculateTotalPrice() {
        var currentPrice = parseFloat($('#currentPrice').val());
        var guests = parseInt($('#guests').val());
        var duration = parseInt($('#duration').val());

        if (isNaN(currentPrice) || isNaN(guests) || isNaN(duration)) {
            alert("Veuillez entrer des valeurs valides.");
            return;
        }

        var totalPrice = currentPrice * guests * duration;
        $('#totalPrice').val(totalPrice);

        $('#btnReserver').show();
    }

    document.getElementById("guests").addEventListener("input", function() {
        var guestsInput = document.getElementById("guests");
        if (guestsInput.value > 4) {
            guestsInput.style.borderColor = "red";
        } else {
            guestsInput.style.borderColor = "";
        }
    });

    function checkLoginAndReserve(button) {
        $.ajax({
            url: 'CheckLogin',
            method: 'GET',
            success: function() {
                // User is logged in, load the reservation form
                loadReservationForm(button);
            },
            error: function() {
                // User is not logged in, redirect to login page
                window.location.href = 'login.jsp';
            }
        });
    }

    function loadReservationForm(button) {
        var packId = $(button).data('id'); // Extract pack ID from the data attribute of the button
        $('#packId').val(packId); // Set the pack ID in the hidden input field

        var titre = $(button).data('titre');
        $('#title').val(titre);
        var currentPrice = $(button).data('prix-actuel');
        $('#currentPrice').val(currentPrice);

        $('#reservationModal').modal('show');
    }

    </script>
    
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<br>
</body>
</html>
