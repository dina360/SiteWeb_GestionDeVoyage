<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="beans.Offre" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Gestion  des voyage</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    
    <!-- Lien vers la feuille de style Bootstrap -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css" rel="stylesheet">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
    <!-- Box Icons  -->
    <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
           <link href="css/AdminNouveau.css" rel="stylesheet" type="text/css"> 

    

    <style>
    /* Google Fonts  */
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap');

/* Globals  */
*{
    font-family: 'Poppins', sans-serif;
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    list-style: none;
    text-decoration: none;
}

/* Variables  */
:root{
    --custom-color-Blue: #3f93f1;
    --custom-color-Dark1: #1e1e1e;
    --custom-color-Dark2: #252527;
    --custom-color-Light1: #dfdfdf;
    --custom-color-Light2: #c4c4c4;
}

/* =============== Sidebar =============== */
.custom-sidebar{
    position: fixed;
    top: 0;
    left: 0;
    height: 100%;
    width: 260px;
    background-color: var(--custom-color-Dark1);
    transition: all .5s ease;
    z-index: 100;
}
.custom-sidebar.custom-close{
    width: 78px;
}

/* --------- Logo ------------ */
.custom-logo-box{
    height: 15%;
    width: 100%;
    display: flex;
    align-items: center;
    color: var(--custom-color-Light1);
    transition: all .5s ease;
    text-decoration: none;
}
.custom-logo-box:hover{
    color: var(--custom-color-Blue);
    text-decoration: none;
}
.custom-logo-box i{
    font-size: 30px;
    height: 50px;
    min-width: 78px;
    text-align: center;
    transition: all .5s ease;
    text-decoration: none;
}
.custom-sidebar.custom-close .custom-logo-box i{
    transform: rotate(360deg);
}
.custom-logo-name{
    font-size: 22px;
    font-weight: 600;
}

/* ---------- Sidebar List ---------- */
.custom-sidebar-list{
    height: 100%;
    padding: 30px 0 150px 0;
    overflow: auto;
}
.custom-sidebar-list::-webkit-scrollbar{
    display: none;
}
.custom-sidebar-list li{
    transition: all .5s ease;
}
.custom-sidebar-list li:hover{
    background-color: var(--custom-color-Dark2);
}
.custom-sidebar-list li .custom-title{
    display: flex;
    justify-content: space-between;
    align-items: center;
    transition: all .5s ease;
    cursor: pointer;
}
.custom-sidebar-list li.custom-active .custom-title{
    background-color: #3f93f1;
}
.custom-sidebar-list li.custom-active .bxs-chevron-down{
    transition: all .5s ease;
    transform: rotate(180deg);
}
.custom-sidebar-list li .custom-title .custom-link{
text-decoration: none;
    display: flex;
    align-items: center;
}
.custom-sidebar-list li .custom-title i{
padding:1px;
    height: 60px;
    min-width: 78px;
    text-align: center;
    line-height: 50px;
    color: #dfdfdf;
    font-size: 25px;
}



.custom-sidebar-list li .custom-title .custom-name{
text-decoration: none;
    font-size: 20px;
    font-weight: 400;
    color: #dfdfdf;
}

/* ---------------- Submenu ------------- */
.custom-sidebar-list li .custom-submenu{
    width: 0;
    height: 0;
    opacity: 0;
    transition: all .5s ease;
}
.custom-sidebar-list li.custom-dropdown.custom-active .custom-submenu{
    width: unset;
    height: unset;
    opacity: 1;
    display: flex;
    flex-direction: column;
    padding: 6px 6px 14px 80px;
    background-color: var(--custom-color-Dark2);
}
.custom-submenu .custom-link{
    color: var(--custom-color-Light2);
    font-size: 15px;
    padding: 5px 0;
    transition: all .5s ease;
    text-decoration: none;
}
.custom-submenu .custom-link:hover{
text-decoration: none;
    color: #fff;
}
.custom-submenu-title{
    display: none;
}

/* ---------------- Submenu Close ------------- */
.custom-sidebar.custom-close .custom-logo-name,
.custom-sidebar.custom-close .custom-title .custom-name,
.custom-sidebar.custom-close .custom-title .bxs-chevron-down
{
    display: none;
}

.custom-sidebar.custom-close .custom-sidebar-list{
    overflow: visible;
}
.custom-sidebar.custom-close .custom-sidebar-list li{
    position: relative;
}
.custom-sidebar.custom-close .custom-sidebar-list li .custom-submenu{
    display: flex;
    flex-direction: column;
    position: absolute;
    left: 100%;
    top: -10px;
    margin-top: 0;
    padding: 10px 20px;
    border-radius: 0 6px 6px 0;
    height: max-content;
    width: max-content;
    opacity: 0;
    transition: all .5s ease;
    pointer-events: none;
}
.custom-sidebar.custom-close .custom-sidebar-list li:hover .custom-submenu{
    opacity: 1;
    top: 0;
    pointer-events: initial;
    background-color: var(--custom-color-Dark2);
}
.custom-sidebar.custom-close .custom-submenu-title{
    display: block;
    font-style: 18px;
    color: var(--custom-color-Light1);
}

/* =============== Home Section =============== */
.custom-home{

    position: relative;
    left: 260px;
    width: calc(100% - 260px);
    height: 100vh;
    transition: all .5s ease;
    
}
.custom-sidebar.custom-close ~ .custom-home{
    left: 78px;
    width: calc(100% - 78px);
}
.custom-home .custom-toggle-sidebar{
heigth:12;
    display: flex;
    align-items: center;
    width: fit-content;
    cursor: pointer;
}
.custom-home .custom-toggle-sidebar i{
    font-size: 35px;
    color: #1e1e1e;
    margin-left: 15px;
}
.custom-home  .custom-toggle-sidebar .custom-text{
    font-size: 25px;
    color:#1e1e1e;
    font-weight: 600;
    
}

/* ============ Responsive / Breakpoints ========== */
@media (max-width: 1080px){
    
}

/* For Medium Devices */
@media (max-width: 774px){
   
}
@media (max-width: 560px){
    
}

/* For Small Devices */
@media (max-width: 360px){
   
}
    /* Styles généraux pour le tableau */
.custom-table {
    transition: width 0.5s ease;
    margin-left:0px;
    width: calc(190vh - 260px); /* Par défaut, largeur du tableau avec la barre latérale ouverte */
}

/* Styles lorsque la barre latérale est fermée */
.custom-sidebar.custom-close ~ .custom-home .custom-table {
	margin-left:-50px;
    width: calc(190vh - 78px); /* Largeur du tableau lorsque la barre latérale est fermée */
}
custom-nav{
  width: calc(110% - 78px);
}
    
    
    	 body {
            height: 100vh;
        }
    
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

       

        .dropdown:hover .submenu {
            display: block;
        }
	

        h1 {
            color: #333;
            font-size: 24px;
            margin-bottom: 20px;
            text-align: left;
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
        .table td {
        padding:2px;
        
    vertical-align: middle;
    text-align: center;
    word-wrap: break-word; /* Permet de couper les mots trop longs pour passer à la ligne */
    word-break: break-all; /* Casse les mots à la fin de la ligne si nécessaire */
    white-space: normal; /* Permet le retour à la ligne automatique */
}


         .table img {
     
          border: 1px none;
        box-shadow: 0px 0px 5px 0px rgba(0, 0, 0, 0.5);
            border-radius: 5%;
            width: 100px; /* Ajustez la taille selon vos besoins */
            height: 100px; /* Ajustez la taille selon vos besoins */
            object-fit: cover; /* Assurez-vous que l'image s'ajuste bien dans le cercle */
        }

       .table th, .table td {
    text-align: center;
    vertical-align: middle;

} 
.fixed-width-table th {
    padding:2px;/* Espacement interne */
    text-align: center; /* Alignement du texte au centre */
    font-size:18px;
       width:140px;
       heigth:150px;
}   
.fixed-width-table td{
	
    text-align: center; /* Alignement du texte au centre */
    font-size:14px;
       width:130px;
}
.fixed-width-table {
    width: 90%; /* Ajustez en fonction de vos besoins */
 
}
 .table-container {
        	margin-top: -500vh;

            overflow-x: auto;
        }
    	.container{
    		margin-top: -500vh;
    	}
h1 {
    font-size: 32px; /* Taille de police plus grande */
    font-weight: bold;
    margin-bottom: 20px;
    color: #333; /* Couleur du texte */
    text-transform: uppercase; /* Convertir le texte en majuscules */
    text-align: center; /* Centrer le texte */
}


        
        .table thead th {
            background-color: #343a40;
            color: white;
        }
        .table tbody tr:hover {
            background-color: #f1f1f1;
        }
    	
/* Pour les cellules du tableau */
.fixed-width-table th, .fixed-width-table td {
    padding: 4px; /* Espacement interne */
    text-align: center; /* Alignement du texte au centre */
    font-size:15px;
       width: auto; 
}   

.fixed-width-table {
    width: 100%; /* Ajustez en fonction de vos besoins */
 
}
/* Style CSS pour le bouton "Voir plus" */
button.view-more-btn {
    background-color: #737373; /* Couleur de fond */
    color: #fff; /* Couleur du texte */
    border: none; /* Supprimer les bordures */
    padding: 10px 20px; /* Espacement intérieur */
    font-size: 12px; /* Taille de police */
    border-radius: 5px; /* Bordure arrondie */
    cursor: pointer; /* Curseur de la souris */
    transition: background-color 0.3s ease; /* Animation de transition */
}

/* Style au survol du bouton */
button.view-more-btn:hover {
    background-color:#1e1e1e; /* Changement de couleur de fond au survol */
}

		.title-container {
		width:65vh;
			 margin-left: 100vh;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .dropdown-select {
            margin-left: 25vh;
        }
/* Réduire la largeur du modal */
.modal-dialog.modal-lg {
    max-width: 80%;
}

.img-fluid {
    max-width: 100%;
    height: auto;
}

.form-group {
    margin-bottom: 15px;
}

label {
    display: block;
}

/* Ajouter du style aux images */
.styled-image {	
	margin-left:10px;
    border: 1px solid #ddd; /* Bordure grise légère */
    border-radius: 4px;  /* Coins arrondis */
    padding: 0px; /* Espace autour de l'image */
    margin-bottom: 15px; /* Espace en bas de l'image */
    width: 220px; /* S'assurer que l'image ne dépasse pas la largeur de la colonne */
    height: 150px; /* Ajuster la hauteur automatiquement */
}
.play{
margin-left:130vh;
}
        
    </style>
</head>

<body>
<!-- Header -->

<nav class="navbar navbar-expand-lg navbar-light bg-light  ">
   
    <ul class="navbar-nav ml-auto">
        <li class="nav-item">
            <a class="nav-link" href="#">
                <img src="./css/image/icone1.png" width="29%" heigth="29%">&nbsp;<b>Bonjour admin</b>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="LogoutServlet">
                <i class="material-icons">power_settings_new</i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
        </li>
        
    </ul>
</nav>

    <div class="custom-sidebar custom-close">
        <!-- ========== Logo ============  -->
        <a href="#" class="custom-logo-box">
            <i class='bx bxl-xing'></i>
            <div class="custom-logo-name">
            
            <img class="icon" src="./css/icones/logo7.png" width="90%" heigth="90%">
            </div>
        </a>

        <!-- ========== List ============  -->
        <ul class="custom-sidebar-list">
        <!-- -------- Non Dropdown List Item ------- -->
            <li>
                <div class="custom-title">
                    <a href="#" class="custom-link">
                       &nbsp;&nbsp;&nbsp;<img src="./css/image/icone4.png" alt="Profile Picture" width="55" height="58">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <span class="custom-name"><h5>Dina El Yakoubi</h5><span><h6>Administrateur</h6></span></span>
                    </a>
                    <!-- <i class='bx bxs-chevron-down'></i> -->
                </div>
                <div class="custom-submenu">
                    <a href="#" class="custom-link custom-submenu-title">Profile</a>
                    <!-- submenu links here  -->
                </div>
            </li><br><br>
            <!-- -------- Non Dropdown List Item ------- -->
            <li>
                <div class="custom-title">
                    <a href="Dashboard.jsp" class="custom-link">
                        <i class='bx bx-grid-alt'></i>
                        <span class="custom-name">Dashboard</span>
                    </a>
                    <!-- <i class='bx bxs-chevron-down'></i> -->
                </div>
                <div class="custom-submenu">
                    <a href="Dashboard.jsp" class="custom-link custom-submenu-title">Dashboard</a>
                    <!-- submenu links here  -->
                </div>
            </li>

            <!-- -------- Dropdown List Item ------- -->
            <li class="custom-dropdown">
                <div class="custom-title">
                    <a href="accueil.jsp" class="custom-link">
                        <i class='bx bxs-home'></i>
                        <span class="custom-name">Accueil</span>
                    </a>
                    <i class='bx bxs-chevron-down'></i>
                </div>
                <div class="custom-submenu">
                    <a href="accueil.jsp" class="custom-link custom-submenu-title">Accueil</a>
                    <a href="PackVoyage.jsp" class="custom-link">Voyages</a>
                    <a href="Offre.jsp" class="custom-link">Offres</a>
                </div>
            </li>

 
            <!-- -------- Non Dropdown List Item ------- -->
            <li>
                <div class="custom-title">
                    <a href="HomeAdmin.jsp" class="custom-link">
                        <i class='bx bxs-user-detail'></i>
                        <span class="custom-name">Gestion Clients</span>
                    </a>
                    <!-- <i class='bx bxs-chevron-down'></i> -->
                </div>
                <div class="custom-submenu">
                    <a href="HomeAdmin.jsp" class="custom-link custom-submenu-title">Gestion Clients</a>
                    <!-- submenu links here  -->
                </div>
            </li>

            <!-- -------- Dropdown List Item ------- -->
            <li class="custom-dropdown">
                <div class="custom-title">
                    <a href="GestionOffre.jsp" class="custom-link" style="height: 60px;">
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <img class="icon" src="./css/image/vol1.png" width="32" height="32" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <span class="custom-name">Gestion Voyages</span>
                    </a>
                    <i class='bx bxs-chevron-down'></i>
                </div>
                <div class="custom-submenu">
                    <a href="GestionOffre.jsp" class="custom-link custom-submenu-title">Gestion Voyages</a>
                    <a href="GestionOffre.jsp" class="custom-link">Add Voyage</a>
                    <a href="SupprimerOffre.jsp" class="custom-link">Sup&Mod Voyage</a>
                </div>
            </li>

            <!-- -------- Non Dropdown List Item ------- -->
            <li>
                <div class="custom-title">
                    <a href="SuiviReservationAdmin.jsp" class="custom-link" style="height: 60px;">
                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img class="icon" src="./css/icones/liste12.png" width="32" height="32" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <span class="custom-name">Suivi Voyages</span>
                    </a>
                    <!-- <i class='bx bxs-chevron-down'></i> -->
                </div>
                <div class="custom-submenu">
                    <a href="SuiviReservationAdmin.jsp" class="custom-link custom-submenu-title">Suivi Voyages</a>
                    <!-- submenu links here  -->
                </div>
            </li>

            <!-- -------- Non Dropdown List Item ------- -->
            <li>
                <div class="custom-title">
                    <a href="#" class="custom-link"  style="height: 60px;">
                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img class="icon" src="./css/icones/tele.png" width="32" height="32" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <span class="custom-name">Contact</span>
                    </a>
                    <!-- <i class='bx bxs-chevron-down'></i> -->
                </div>
                <div class="custom-submenu">
                    <a href="#" class="custom-link custom-submenu-title">Contact</a>
                    <!-- submenu links here  -->
                </div>
            </li>

            <!-- -------- Non Dropdown List Item ------- -->
           
        </ul>
    </div>

    <!-- ============= Home Section =============== -->
    <section class="custom-home">
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
    
        <div class="custom-toggle-sidebar "></div>
 
 
 

<!-- Main Content -->
<div class="main-content">
    <div class="container mt-5" height="100vh">
<h1 class="mb-4">Gestion des Voyages</h1>
         <div class="title-container">
                
                <select class="form-control dropdown-select" onchange="handleSelectionChange(this)">
                <option value="">Sélectionner une option</option>
                    <option value="offers">Gestion des offres</option>
                    <option value="voyages">Gestion des voyages</option>
                </select>
            </div>
        <table id="gestionvoyage" class="table table-striped table-bordered table-hover fixed-width-table custom-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Titre</th>
                    <th>Description</th>
                    <th>Image</th>
                    <th>Hotel</th>
                    <th>Restaurant</th>
                    <th>Ville</th>
                    <th>Prix</th>
                    
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% List<Offre> offers = new ArrayList<>();
                   Connection connection = null;
                   PreparedStatement preparedStatement = null;
                   ResultSet rs = null;
                   try {
                       Class.forName("com.mysql.cj.jdbc.Driver");
                       connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestionvoyage", "root", "");
                       String query = "SELECT * FROM packages WHERE remise = 0";
                       preparedStatement = connection.prepareStatement(query);
                       rs = preparedStatement.executeQuery();
                       while (rs.next()) {
                           Offre offre = new Offre();
                           offre.setId(rs.getInt("id"));
                           offre.setTitre(rs.getString("titre"));
                           offre.setDescription(rs.getString("description"));
                           offre.setImage(rs.getString("image"));
                           offre.setHotel(rs.getString("hotel"));
                           offre.setRestaurant(rs.getString("restaurant"));
                           offre.setVille(rs.getString("ville"));
                          
                           offre.setP_a(rs.getInt("p_a"));
                           
                           
                           offers.add(offre);
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
                   if (!offers.isEmpty()) {
                       for (Offre offer : offers) {
               %>
                <tr>
                    <td><%= offer.getId() %></td>
                    <td><%= offer.getTitre() %></td>
					<td class="description-cell">
				    <div id="descriptionPreview<%= offer.getId() %>">
				        <%= offer.getDescription().substring(0, 0) %> <!-- Affiche uniquement les 100 premiers caractères -->
				    </div>
			<button class="view-more-btn" onclick="afficherDescription('<%= offer.getDescription() %>', <%= offer.getId() %>)">Voir plus</button>
					</td>
												<div id="descriptionPopup<%= offer.getId() %>" class="modal fade" tabindex="-1" role="dialog">
								   
								    <div class="modal-dialog" role="document">
								        <div class="modal-content">
								            <div class="modal-header">
								                <h5 class="modal-title">Description du pack</h5>
								                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								                    <span aria-hidden="true">&times;</span>
								                </button>
								            </div>
								            <div class="modal-body">
								    <textarea id="descriptionContent<%= offer.getId() %>" class="form-control"  readonly></textarea>
								</div>
								           <div class="modal-footer">
								    <button type="button" class="btn btn-secondary" onclick="fermerPopup('descriptionPopup<%= offer.getId() %>')">Fermer</button>
								</div>
								
								        </div>
								    </div>
</div>
        
           
		<td class="im"><img src="<%= offer.getImage() %>" style="max-width: 200px; max-height: 200px;"></td>
                    <td><img src="<%= offer.getHotel() %>" style="max-width: 200px; max-height: 200px;"></td>
                    <td><img src="<%= offer.getRestaurant() %>" style="max-width: 200px; max-height: 200px;"></td>
                    <td><img src="<%= offer.getVille() %>"style="max-width: 200px; max-height: 200px;"></td>
                    <td><%= offer.getP_a() %></td>

                    <td>
                        <!-- Lien pour afficher le formulaire de modification -->
                          <a href="#" onclick="modifierOffre('<%= offer.getId() %>', '<%= offer.getTitre() %>', '<%= offer.getDescription() %>', '<%= offer.getImage() %>', '<%= offer.getHotel() %>', '<%= offer.getRestaurant() %>', '<%= offer.getVille() %>', '<%= offer.getP_a() %>')">
    <i class="material-icons" data-toggle="tooltip" title="Modifier">&#xE254;</i>
</a>

                        <a href="DeleteOfferServlet?id=<%=offer.getId() %>" onclick="return confirmDelete()">
                            <i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i>
                        </a>
                    </td>
                </tr>
                <% 
                       }
                   }
                %>
            </tbody>
        </table>
        
<!-- Code HTML du formulaire de modification -->
<div class="modal fade" id="modalEditVoy" tabindex="-1" role="dialog" aria-labelledby="modalEditVoyLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalEditVoyLabel">Modifier Client</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formEditVoy" action="ModifierOffreServlet" method="post" enctype="multipart/form-data">
                    <input type="hidden" id="editVoyId" name="id">
                    
                    <div class="form-row">
                        <!-- Première colonne : Informations textuelles -->
                        <div class="form-group col-md-4">
                            <label for="editTitre">Titre</label>
                            <input type="text" class="form-control" id="editTitre" name="titre" required><br>
                            <label for="editDescription">Description</label>
                            <textarea class="form-control" id="editDescription" name="description" required></textarea><br>
                            <label for="editPrix">Prix actuel</label>
                            <input type="number" class="form-control" id="editPrix" name="prixActuel" required><br>
                        </div>
                        
                        <!-- Deuxième colonne : Images actuelles et nouvelles -->
                        <div class="form-group col-md-4">
                            <label for="editImage">Image actuelle</label>
                            <img src="" id="editImage" alt="Image de l'offre" class="img-fluid styled-image" required>
                            <label for="nouvelleImage">Nouvelle image </label>
                            <input type="file" class="form-control" id="nouvelleImage" name="nouvelleImage" accept="image/jpeg, image/png, image/gif">
                            
                            <label for="editHotel">Image actuelle de l'hôtel</label>
                            <img src="" id="editHotel" alt="Image de l'hôtel" class="img-fluid styled-image" required>
                            <label for="nouvelleImageHotel">Nouvelle image de l'hôtel </label>
                            <input type="file" class="form-control" id="nouvelleImageHotel" name="nouvelleImageHotel" accept="image/jpeg, image/png, image/gif">
                        </div>
                        
                        <!-- Troisième colonne : Images actuelles et nouvelles -->
                        <div class="form-group col-md-4">
                            <label for="editRestaurant">Image actuelle du restaurant</label>
                            <img src="" id="editRestaurant" alt="Image du restaurant" class="img-fluid styled-image" required>
                            <label for="nouvelleImageRestaurant">Nouvelle image du restaurant </label>
                            <input type="file" class="form-control" id="nouvelleImageRestaurant" name="nouvelleImageRestaurant" accept="image/jpeg, image/png, image/gif">
                            
                            <label for="editVille">Image actuelle de la ville</label>
                            <img src="" id="editVille" alt="Image de la ville" class="img-fluid styled-image">
                            <label for="nouvelleImageVille">Nouvelle image de la ville </label>
                            <input type="file" class="form-control" id="nouvelleImageVille" name="nouvelleImageVille" accept="image/jpeg, image/png, image/gif">
                        </div>
                    </div>
                    
                    <button type="submit" class="btn btn-primary play">Modifier</button>
                </form>
            </div>
        </div>
    </div>
</div>

       
    </div>
</div>
</section>
 <script>
    const listItems = document.querySelectorAll(".custom-sidebar-list li");

    listItems.forEach((item) => {
        item.addEventListener("click", () => {
            let isActive = item.classList.contains("custom-active");

            listItems.forEach((el) => {
                el.classList.remove("custom-active");
            });

            if (!isActive) {
                item.classList.add("custom-active");
            }
        });
    });

    const toggleSidebar = document.querySelector(".custom-toggle-sidebar");
    const logo = document.querySelector(".custom-logo-box");
    const sidebar = document.querySelector(".custom-sidebar");
    const header = document.querySelector(".custom-header");

    toggleSidebar.addEventListener("click", () => {
        sidebar.classList.toggle("custom-close");
    });

    logo.addEventListener("click", () => {
        sidebar.classList.toggle("custom-close");
    });

    header.addEventListener("click", () => {
        sidebar.classList.toggle("custom-close");
    });
</script>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
     <script src="https://cdn.datatables.net/2.0.5/js/dataTables.js"></script>
     <script src="https://cdn.datatables.net/2.0.5/js/dataTables.bootstrap5.js"></script>
         <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
         <!-- jQuery, Popper.js, and Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
         
         
         <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
        
     
<script>
    $(document).ready(function() {
        $('#gestionvoyage').DataTable({
            searching: false, // Activer la recherche
            paging: true, // Activer la pagination
            lengthChange: false // Masquer le nombre d'éléments par page
        });
    });
</script>

<script>
    function confirmDelete() {
        
        var confirmation = confirm("Êtes-vous sûr de vouloir supprimer cette offre ?");
        
        if (confirmation) {
            window.location.reload();
        }
       
        else {
            return false;
        }
    }
    </script>

    
    
    
<script >
function afficherDescription(description, id) {
	 
    // Utilisez innerText au lieu de innerHTML pour éviter l'interprétation des balises HTML
    document.getElementById("descriptionContent" + id).innerText = description;
    var popup = $('#descriptionPopup' + id + ' .modal-dialog');
    var body = $('#descriptionPopup' + id + ' .modal-body');

    // Réinitialiser la hauteur de la pop-up
    popup.css('height', 'auto');

    // Forcer le recalcul de la hauteur en cas de changement de contenu
    setTimeout(function(){
        var popupHeight = body.prop('scrollHeight') + 150;// Utilisez la hauteur de défilement pour prendre en compte le contenu complet
        popup.css('height', popupHeight);
    }, 200);

    $('#descriptionPopup' + id).modal('show');
}


function fermerPopup(idPopup) {
    $('#' + idPopup).modal('hide'); // Fermer le popup en utilisant jQuery
}


        function handleSelectionChange(selectElement) {
            if (selectElement.value === 'offers') {
                window.location.href = 'SupprimerOffre.jsp';
            }
        }

        function afficherDescription(description, id) {
            document.getElementById('descriptionContent' + id).value = description;
            $('#descriptionPopup' + id).modal('show');
        }

        function fermerPopup(popupId) {
            $('#' + popupId).modal('hide');
        }

        function modifierOffre(id, titre, description, image, hotel, restaurant, ville, prix) {
            $('#editVoyId').val(id);
            $('#editTitre').val(titre);
            $('#editDescription').val(description);
            $('#editImage').attr('src', image);
            $('#editHotel').attr('src', hotel);
            $('#editRestaurant').attr('src', restaurant);
            $('#editVille').attr('src', ville);
            $('#editPrix').val(prix);
            
            $('#modalEditVoy').modal('show');
        }

</script>

</body>
</html>