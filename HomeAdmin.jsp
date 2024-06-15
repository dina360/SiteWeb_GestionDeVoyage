 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="beans.Client" %>
<%@ page import="dao.AdminClientDao" %>
<!DOCTYPE html>
<html lang="en">

<head>
      <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HomeAdmin</title>
 <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    
    <!-- Lien vers la feuille de style Bootstrap -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css" rel="stylesheet">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
    <!-- Box Icons  -->
    <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
           <link href="css/AdminNouveau.css" rel="stylesheet" type="text/css"> 
    
    <!-- Styles  -->
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
    color: #3f93f1;
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
    background-color: #252527;
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
    height: 100px;
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

h2 {

    font-size: 32px; /* Taille de police plus grande */
    font-weight: bold;
    margin-bottom: 20px;
    color: #333; /* Couleur du texte */
    text-transform: uppercase; /* Convertir le texte en majuscules */
    text-align: center; /* Centrer le texte */
}

body{

heigth:150vh;
}
     .icon-sm {
        font-size: 17px;
    }
   
        .table {
        	margin-top: -90px;
			
            overflow-x: auto;
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
</style>
</head>

<body>
<!-- Header -->

<nav class="navbar navbar-expand-lg navbar-light bg-light  custom-nav">
   
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
			// Vérifiez si le message de succès pour la suppression est présent dans la session
			String successMessageDelete = (String) request.getAttribute("successMessageDelete");
			if (successMessageDelete != null) {
			%>
			    <div class="alert alert-success" role="alert" onclick="this.remove();">
			        <%= successMessageDelete %>
			    </div>
			<% 
			// Supprimez le message de succès pour la suppression après l'affichage
			session.removeAttribute("successMessageDelete");
			}
			%>

    <% 
            // Vérifiez si le message de succès est présent dans la session
            String successMessageAdd = (String) request.getAttribute("successMessage");
            if (successMessageAdd != null) {
        %>
            <div class="alert alert-success" role="alert" onclick="this.remove();">
                <%= successMessageAdd %>
            </div>
        <% 
            // Supprimez le message de succès après l'affichage
            session.removeAttribute("successMessage");
            }
        %>
         <% 
            // Vérifiez si le message de succès est présent dans la session
            String successMessageMod = (String) session.getAttribute("successMessageMod");
            if (successMessageMod != null) {
        %>
            <div class="alert alert-success" role="alert" onclick="this.remove();">
                <%= successMessageMod %>
            </div>
        <% 
            // Supprimez le message de succès après l'affichage
            session.removeAttribute("successMessageMod");
            }
        %>
      
        <div class="custom-toggle-sidebar ">
        
           
            <div class="custom-text"><h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Liste des Clients</h2></div>
        </div>
        
         <div class="main-content" >
   
		
        <div class="container mt-5" height="100vh">
           <table id="gestionvoyage" class="table table-striped table-bordered table-hover custom-table">

                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nom</th>
                        <th>Prénom</th>
                        <th>Email</th>
                        <th>Date de naissance</th>
                        <th>Téléphone</th>
                        <th>Nom d'utilisateur</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>  
                    <%
                List<Client> clients = (List<Client>) session.getAttribute("clients");
                if (clients != null) {
                    for (Client client : clients) {
            %>
                            <tr>
                                <td><%= client.getId() %></td>
                                <td><%= client.getNom() %></td>
                                <td><%= client.getPrenom() %></td>
                                <td><%= client.getEmail() %></td>
                                <td><%= client.getDate_naissance() %></td>
                                <td><%= client.getTele() %></td>
                                <td><%= client.getNom_utilisateur() %></td>
                                <td>
                                    <!-- modifier-->
 			<a href="#" onclick="fillEditForm('<%= client.getId() %>', '<%= client.getNom() %>', '<%= client.getPrenom() %>', '<%= client.getEmail() %>', '<%= client.getDate_naissance() %>', '<%= client.getTele() %>', '<%= client.getNom_utilisateur() %>','<%= client.getPassword() %>')">                                        <i class="material-icons" data-toggle="tooltip" title="Modifier">&#xE254;</i></a>  
                                       

                                    <!-- Supprimer -->
                                    <a href="deleteClient.jsp?id=<%= client.getId() %>" onclick="return confirmDelete()">
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
        <!-- Bouton pour ouvrir la modale d'ajout de client -->
        <a href="#" class="btn btn-success" data-toggle="modal" data-target="#modalAddClient">
            <i class="material-icons">&#xE147;</i>
            <span>Ajouter Nouveau Client</span>
        </a>
			<br><br><br><br>			
										
			</div>	 
    </div>
   
   <div class="modal fade" id="modalEditClient" tabindex="-1" role="dialog" aria-labelledby="modalEditClientLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalEditClientLabel">Modifier Client</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formEditClient" action="ModifierClientServlet" method="post">
                    <input type="hidden" id="editClientId" name="id">
                    <div class="form-group">
                        <label for="editNom">Nom</label>
                        <input type="text" class="form-control" id="editNom" name="nom" required>
                    </div>
                    <div class="form-group">
			            <label for="prenom">Prénom :</label>
			            <input type="text" class="form-control" name="prenom" id="editPrenom" required>
			        </div>
			        <div class="form-group">
			            <label for="email">Email:</label>
			            <input type="text" class="form-control" name="email" id="editEmail" required>
			        </div>
			        <div class="form-group">
			            <label for="date_naissance">Date de Naissance:</label>
			            <input type="text" class="form-control" name="date_naissance" id="editDate_naissance" required>
			        </div>
			        <div class="form-group">
			            <label for="tele">Téléphone:</label>
			            <input type="text" class="form-control" name="tele" id="editTele" required>
			        </div>
			        <div class="form-group">
			            <label for="nom_utilisateur">Nom d'utilisateur:</label>
			            <input type="text" class="form-control" name="nom_utilisateur" id="editNom_utilisateur" required>
			        </div>
			        <div class="form-group">
			            <label for="password">Mot de passe:</label>
			            <input type="text" class="form-control" name="password" id="editPassword" required>
			        </div>
			       
        <button type="submit" class="btn btn-primary">Modifier</button>
             
                </form>
            </div>
        </div>
    </div>
</div>
 

    <!-- Modale d'ajout de client -->
    <div class="modal fade" id="modalAddClient" tabindex="-1" role="dialog" aria-labelledby="modalAddClientLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <!-- Contenu du formulaire d'ajout de client -->
                <div class="modal-header">
                    <h5 class="modal-title" id="modalAddClientLabel">Ajouter Nouveau Client</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="formAddClient">
                        <div class="form-group">
                            <label for="nom">Nom</label>
                            <input type="text" class="form-control" id="nom" name="nom" required>
                        </div>
                        <div class="form-group">
                            <label for="prenom">Prénom</label>
                            <input type="text" class="form-control" id="prenom" name="prenom" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" id="email" name="email" required>
                        </div>
                        <div class="form-group">
                            <label for="date_naissance">Date de Naissance</label>
                            <input type="date" class="form-control" id="date_naissance" name="date_naissance" required>
                        </div>
                        <div class="form-group">
                            <label for="tele">Téléphone</label>
                            <input type="tel" class="form-control" id="tele" name="tele" required>
                        </div>
                        <div class="form-group">
                            <label for="nom_utilisateur">Nom d'Utilisateur</label>
                            <input type="text" class="form-control" id="nom_utilisateur" name="nom_utilisateur" required>
                        </div>
                        <div class="form-group">
                            <label for="password">Mot de Passe</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Ajouter</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

  </section>

<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
     <script src="https://cdn.datatables.net/2.0.5/js/dataTables.js"></script>
     <script src="https://cdn.datatables.net/2.0.5/js/dataTables.bootstrap5.js"></script>
         <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
         
         
         <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
         
        
     
<script>
    $(document).ready(function() {
        $('#gestionvoyage').DataTable({
            searching: true, // Activer la recherche
            paging: true, // Activer la pagination
            lengthChange: false // Masquer le nombre d'éléments par page
        });
    });
</script>

    
    <script>
        // Fonction pour confirmer la suppression du client
        function confirmDelete() {
            // Demande de confirmation à l'admin
            var confirmation = confirm("Êtes-vous sûr de vouloir supprimer ce client ?");
            // Si l'admin confirme la suppression, actualiser la page
            if (confirmation) {
                window.location.reload();
            }
            // Sinon, ne rien faire
            else {
                return false;
            }
        }
        
        
        // Intercepter la soumission du formulaire d'ajout de client
        $('#formAddClient').submit(function(event) {
            // Empêcher le comportement par défaut du formulaire
            event.preventDefault();
            
            // Envoyer les données du formulaire au serveur via Ajax
            $.ajax({
                url: 'AddClientServlet',
                type: 'POST',
                data: $(this).serialize(), // Sérialiser les données du formulaire
                success: function(response) {
                    // Traiter la réponse du serveur
                    // Par exemple, afficher un message de succès ou actualiser la liste des clients
                    alert('Êtes-vous sûr d ajouter ce client ?');
                    // Actualiser la liste des clients après l'ajout
                    window.location.reload();
                },
                error: function(xhr, status, error) {
                    // Traiter les erreurs éventuelles
                    alert('Une erreur s\'est produite lors de l\'ajout du client. Veuillez réessayer.');
                }
            });
        });
      
        function fillEditForm(id, nom, prenom, email, date_naissance, tele, nom_utilisateur,password) {
            $('#editClientId').val(id);
            $('#editNom').val(nom);
            $('#editPrenom').val(prenom);
            $('#editEmail').val(email);
            $('#editDate_naissance').val(date_naissance);
            $('#editTele').val(tele);
            $('#editNom_utilisateur').val(nom_utilisateur);
            $('#editPassword').val(password);
            
            $('#modalEditClient').modal('show');
        }
        
        
    </script>
        
        
        
        
        
        
        
        
        
        
 

    <!-- Link JS -->
    <script>
    
    const listItems = document.querySelectorAll(".custom-sidebar-list li");

    listItems.forEach((item) => {
      item.addEventListener("click", () => {
        let isActive = item.classList.contains("custom-active");

        listItems.forEach((el) => {
          el.classList.remove("custom-active");
        });

        if (isActive) item.classList.remove("custom-active");
        else item.classList.add("custom-active");
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
</body>

</html>
