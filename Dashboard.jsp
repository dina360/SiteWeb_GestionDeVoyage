<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="beans.Offre" %>
<%@ page import="java.sql.*, dao.Connexion" %>	

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    
    <!-- Lien vers la feuille de style Bootstrap -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css" rel="stylesheet">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
    <!-- Box Icons  -->
    <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
           <link href="css/dashboard.css" rel="stylesheet" type="text/css"> 
            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    

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

.card{

heigth:450px;
width:250px;

}

/* Appliquer un style CSS aux balises de texte du graphique */
#piechart text {
  /* Ajoutez votre style CSS ici */
  font-size: 14px; /* Exemple: Modifier la taille de police */
  font-weight: bold; /* Exemple: Ajouter une épaisseur de police */
margin-buttom:15px;
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
     <br>
        <div class="custom-toggle-sidebar ">
        <h3 class="page-title">
                <span class="page-title-icon bg-gradient-primary text-white mr-2">
                 &nbsp;&nbsp;&nbsp;&nbsp; <img class="icon" src="./css/icones/dash1.png" width="32" height="32" >
                </span> Dashboard
              </h3>
        </div>
 
<br>
<!-- Main Content -->
<div class="main-content">
    <div class="main-panel">
        <div class="content-wrapper">
            <!-- Row for the Dashboard Cards -->
            <div class="row">
                <!-- Card 1 -->
                <div class="col-md-4 stretch-card grid-margin">
                    <div class="card  " style="background-image: url('./css/image/bordrose1.png'); background-size: cover;margin-left:50px;width: 300px;height: 180px;margin-left:50px;">
                        <div class="card-body">
                            <span>
							  <h5 class="card-title">
							    <img class="icon" src="./css/image/graphe.png" width="34" height="32" alt="Graphe Icon"> 
							   &nbsp;&nbsp; Nombre de Voyages
							  </h5>
							</span>

                             <%
							    int voyDis = 0;
							    Connection cone = null;
							    Statement stte = null;
							    ResultSet resu = null;
							
							    try {
							        // Chargement du driver JDBC
							        Class.forName("com.mysql.cj.jdbc.Driver");
							
							        // Paramètres de connexion
							        String url = "jdbc:mysql://localhost:3306/gestionvoyage";
							        String user = "root";
							        String password = "";
							
							        // Établissement de la connexion
							        cone = DriverManager.getConnection(url, user, password);
							
							        // Création de la requête SQL
							        String sql = "SELECT COUNT(*) AS nbrD FROM packages WHERE remise = 0";
							
							        // Exécution de la requête
							        stte = cone.createStatement();
							        resu = stte.executeQuery(sql);
							
							        // Récupération du résultat
							        if (resu.next()) {
							        	voyDis = resu.getInt("nbrD");
							        }
							    } catch (Exception e) {
							        e.printStackTrace();
							    } finally {
							        // Fermeture des ressources
							        try {
							            if (resu != null) resu.close();
							            if (stte != null) stte.close();
							            if (cone != null) cone.close();
							        } catch (SQLException e) {
							            e.printStackTrace();
							        }
							    }
							%><br>
                            <p class="card-description"><h2> &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;<%= voyDis %></h2></p>
                        </div>
                    </div>
                </div>

                <!-- Card 2 -->
                <div class="col-md-4 stretch-card grid-margin">
                    <div class="card" style="background-image: url('./css/image/bordbl.png'); background-size: cover;width: 300px;height: 180px;margin-left:20px;">
                        <div class="card-body">
                        <span>
							  <h5 class="card-title">
							    <img class="icon" src="./css/icones/carte1.png" width="40" height="40" alt="Graphe Icon"> 
							   &nbsp;&nbsp; Nombre de Clients
							  </h5>
							</span>
                              <%
							    int client = 0;
							    Connection c = null;
							    Statement s = null;
							    ResultSet r = null;
							
							    try {
							        // Chargement du driver JDBC
							        Class.forName("com.mysql.cj.jdbc.Driver");
							
							        // Paramètres de connexion
							        String url = "jdbc:mysql://localhost:3306/gestionvoyage";
							        String user = "root";
							        String password = "";
							
							        // Établissement de la connexion
							        c = DriverManager.getConnection(url, user, password);
							
							        // Création de la requête SQL
							        String sql = "SELECT COUNT(*) AS nbrC FROM client";
							
							        // Exécution de la requête
							        s = c.createStatement();
							        r = s.executeQuery(sql);
							
							        // Récupération du résultat
							        if (r.next()) {
							        	client = r.getInt("nbrC");
							        }
							    } catch (Exception e) {
							        e.printStackTrace();
							    } finally {
							        // Fermeture des ressources
							        try {
							            if (r != null) r.close();
							            if (s != null) s.close();
							            if (c != null) c.close();
							        } catch (SQLException e) {
							            e.printStackTrace();
							        }
							    }
							%><br>
                            <p class="card-description"><h2>  &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;<%= client %></h2></p>
                        </div>
                    </div>
                </div>

                <!-- Card 3 -->
                <div class="col-md-4 stretch-card grid-margin" >
                    <div class="card" style="background-image: url('./css/image/bordjaune.png'); background-size: cover;width: 320px;height: 180px;margin-left:-10px;">
                        <div class="card-body">
                        <span>
							  <h5 class="card-title">
							    <img class="icon" src="./css/icones/listerev.png" width="40" height="37" alt="Graphe Icon"> 
							   &nbsp;&nbsp;Nombre de Réservations
							  </h5>
							</span>
								<%
							    int nombreDeReservations = 0;
							    Connection conn = null;
							    Statement stmt = null;
							    ResultSet rs = null;
							
							    try {
							        // Chargement du driver JDBC
							        Class.forName("com.mysql.cj.jdbc.Driver");
							
							        // Paramètres de connexion
							        String url = "jdbc:mysql://localhost:3306/gestionvoyage";
							        String user = "root";
							        String password = "";
							
							        // Établissement de la connexion
							        conn = DriverManager.getConnection(url, user, password);
							
							        // Création de la requête SQL
							        String sql = "SELECT COUNT(*) AS nombre_de_reservations FROM reservation";
							
							        // Exécution de la requête
							        stmt = conn.createStatement();
							        rs = stmt.executeQuery(sql);
							
							        // Récupération du résultat
							        if (rs.next()) {
							            nombreDeReservations = rs.getInt("nombre_de_reservations");
							        }
							    } catch (Exception e) {
							        e.printStackTrace();
							    } finally {
							        // Fermeture des ressources
							        try {
							            if (rs != null) rs.close();
							            if (stmt != null) stmt.close();
							            if (conn != null) conn.close();
							        } catch (SQLException e) {
							            e.printStackTrace();
							        }
							    }
							%><br>
							<p class="card-description" style="margin-top: -20px;"><h2> &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;<%= nombreDeReservations %></h2></p>
                        </div>
                    </div>
                </div>
				
                <!-- Card 4 (if needed) -->
                <div class="col-md-4 stretch-card grid-margin">
                    <div class="card" style="background-image: url('./css/image/bordvert.png'); background-size: cover; margin-left:50px; margin-top:55px  ;width: 300px;height: 180px; ">
                        <div class="card-body"><span>
							  <h5 class="card-title">
							    <img class="icon" src="./css/icones/pro.png" width="40" height="40" alt="Graphe Icon"> 
							   &nbsp;&nbsp;Offres Disponibles
							  </h5>
							</span>
                            <%
							    int offDis = 0;
							    Connection conne = null;
							    Statement stmte = null;
							    ResultSet res = null;
							
							    try {
							        // Chargement du driver JDBC
							        Class.forName("com.mysql.cj.jdbc.Driver");
							
							        // Paramètres de connexion
							        String url = "jdbc:mysql://localhost:3306/gestionvoyage";
							        String user = "root";
							        String password = "";
							
							        // Établissement de la connexion
							        conne = DriverManager.getConnection(url, user, password);
							
							        // Création de la requête SQL
							        String sql = "SELECT COUNT(*) AS nbrD FROM packages WHERE remise != 0";
							
							        // Exécution de la requête
							        stmte = conne.createStatement();
							        res = stmte.executeQuery(sql);
							
							        // Récupération du résultat
							        if (res.next()) {
							        	offDis = res.getInt("nbrD");
							        }
							    } catch (Exception e) {
							        e.printStackTrace();
							    } finally {
							        // Fermeture des ressources
							        try {
							            if (res != null) res.close();
							            if (stmte != null) stmte.close();
							            if (conne != null) conne.close();
							        } catch (SQLException e) {
							            e.printStackTrace();
							        }
							    }%>
							<br>
                            <p class="card-description" ><h2> &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;<%= offDis %></h2></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 stretch-card " style="margin-top:-90px; margin-left:155px;">
        <!-- Graphique circulaire -->
        <div id="piechart" style="width: 100%; height:100%; margin-top:100px"></div>
    </div>
               
            </div>
        </div>
    </div>   
</div>

   
</section>


   <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
    var voyagesData = <%= voyDis %>;
    var clientsData = <%= client %>;
    var reservationsData = <%= nombreDeReservations %>;
    var offresData = <%= offDis %>;
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

    	  var data = google.visualization.arrayToDataTable([
    		  ['Task', 'Hours per Day'],
    		  
    		  [{v:'Nombre de voyage', p: {style: 'margin-top: 185px;'}}, voyagesData],
    		  [{v:'Nombre de clients', p: {style: 'margin-top: 185px;'}},  clientsData],
    		  [{v:'Nombre de réservations', p: {style: 'margin-top: 185px;'}}, reservationsData],
    		  [{v:'Offres disponibles', p: {style: 'margin-top: 185px;'}},   offresData]
    		]);

    	  var options = {
    			    backgroundColor: 'transparent',
    			    
    			    chartArea: {
    			        width: '80%',
    			        height: '90%'
    			    },
    			    colors: ['#ffccdd', '#b3d9ff', '#ffd9b3', '#abedbb'] // Définissez ici les couleurs que vous souhaitez utiliser
    			};





        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
    </script>

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
         
         
         <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
        
</body>
</html>