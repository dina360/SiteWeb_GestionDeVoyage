 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Gestion d'Offres</title>
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

.custom-form{
    transition: width 0.5s ease;
    margin-left:-2px;
    width: calc(190vh - 260px); /* Par défaut, largeur du tableau avec la barre latérale ouverte */
}

/* Styles lorsque la barre latérale est fermée */
.custom-sidebar.custom-close ~ .custom-home .custom-form {
	margin-left:-22px;
    width: calc(190vh - 78px); /* Largeur du tableau lorsque la barre latérale est fermée */
}




    custom-nav{
  width: calc(110% - 78px);
}

 .error {
            background-color: #ffcccc;
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

        .submenu {
            display: none;
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .submenu a {
            display: block;
            padding: 10px 15px;
            text-decoration: none;
            color: #007bff;
        }

        .submenu a:hover {
            background-color: #f1f1f1;
        }

        .dropdown:hover .submenu {
            display: block;
        }

        .body {
            height: 100vh;
        }

        .container {
            position: absolute;
            height: 165vh;
            left: 5%;
            max-width: 170vh;
            margin: 5% auto;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Ajout de l'ombre */

        }

        h1 {
            color: #333;
            font-size: 24px;
            margin-bottom: 20px;
            text-align: center;
        }

        label {
            font-weight: bold;
        }

        .form-control {
            margin-bottom: 15px;
            width:68vh;
           
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
        
         .image-container {
         	left:2%;	
            height: 10000%;
            width: 50%;
        }

        .image-container img {
        margin-top:-17px;
            height: 164vh;
           border-radius: 5px;
            object-fit: cover;
        }
       .row{
       margin-left:15x;
       width: 167vh;
       border-radius: 5px;
       
       }
       .img-fluid{
       filter: grayscale(100%);
       
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
                    <a href="PackVoyage.jsp" class="custom-link">Add Voyage</a>
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
     
<!-- Main Content -->
<div class="container custom-form"  >
    <div class="row">
        <div class="col-md-6">
           
             <div class="form-group">
                    <label for="selection"><h1>Proposer un pack de voyage</h1></label>
                    <select class="form-control" id="selection" name="selection" required onchange="handleSelectionChange()">
                        <option value="" disabled selected>Sélectionner une option</option>
                        <option value="offre">en promotion</option>
                        <option value="voyage">Pack Voyage</option>
                    </select>
                    <small id="selectionError" class="form-text text-danger" style="display: none;">Veuillez d'abord sélectionner une option.</small>
                </div>

                <form action="AddPackageServlet" method="post" enctype="multipart/form-data" >
                    <div class="form-group">
                        <label for="titre">Titre de Pack</label>
                        <input type="text" class="form-control" id="titre" name="titre" required disabled onfocus="checkSelection()">
                    </div>
                    <div class="form-group">
                        <label for="description">Description</label>
                        <textarea class="form-control" id="description" name="description" rows="3" required disabled onfocus="checkSelection()"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="image">Image</label>
                        <input type="file" class="form-control-file" id="image" name="image" required disabled onfocus="checkSelection()">
                    </div>
                    <div class="form-group">
                        <label for="hotel">Hotel</label>
                        <input type="file" class="form-control-file" id="hotel" name="hotel" required disabled onfocus="checkSelection()">
                    </div>
                    <div class="form-group">
                        <label for="restaurant">Restaurant</label>
                        <input type="file" class="form-control-file" id="restaurant" name="restaurant" required disabled onfocus="checkSelection()">
                    </div>
                    <div class="form-group">
                        <label for="ville">Ville</label>
                        <input type="file" class="form-control-file" id="ville" name="ville" required disabled onfocus="checkSelection()">
                    </div>
                    <div class="form-group">
                        <label for="prix">Prix initiale</label>
                        <input type="text" class="form-control" id="p_i" name="p_i" required disabled onfocus="checkSelection()">
                    </div>
                    <div class="form-group">
                        <label for="remise">Pourcentage de remise</label>
                        <input type="number" class="form-control" id="remise" name="remise" required disabled onfocus="checkSelection()">
                    </div>
                    <div class="form-group">
                        <label for="prix">Prix actuel</label>
                        <input type="text" class="form-control" id="p_a" name="p_a" required disabled onfocus="checkSelection()">
                    </div>
                    <div class="form-group">
                        <label for="remise">Nombre Du Paquet Disponible</label>
                        <input type="number" class="form-control" id="nbr" name="nbr" required disabled onfocus="checkSelection()">
                    </div>
                    <button type="submit" class="btn btn-primary" onclick="return confirm('Voulez-vous vraiment ajouter ce offre ?')" id="ajouterBtn" disabled>Ajouter</button>
                </form>
            </div>
            <div class="col-md-6 image-container">
                <img src="./css/offre/add5.jpg" alt="Votre image" class="img-fluid">
            </div>
        </div><br><br>
    </div>

</section>
    <script>
    function handleSelectionChange() {
        const selection = document.getElementById('selection').value;
        const fields = document.querySelectorAll('#titre, #description, #image, #hotel, #restaurant, #ville, #p_i, #remise, #p_a, #nbr');
        const selectionError = document.getElementById('selectionError');
        const selectionElement = document.getElementById('selection');
        const ajouterBtn = document.getElementById('ajouterBtn');

        if (selection) {
            fields.forEach(field => field.disabled = false);
            selectionElement.classList.remove('error');
            selectionError.style.display = 'none';
            ajouterBtn.removeAttribute('disabled');
            if (selection === 'voyage') {
                window.location.href = 'Voyage.jsp';
            }
        } else {
            fields.forEach(field => field.disabled = true);
            ajouterBtn.setAttribute('disabled', true);
        }
    }

    function checkSelection() {
        const selection = document.getElementById('selection').value;
        const selectionError = document.getElementById('selectionError');
        const selectionElement = document.getElementById('selection');
        const ajouterBtn = document.getElementById('ajouterBtn');

        if (!selection) {
            selectionElement.classList.add('error');
            selectionError.style.display = 'block';
            ajouterBtn.setAttribute('disabled', true);
        }
    }

    document.addEventListener('DOMContentLoaded', () => {
        const fields = document.querySelectorAll('#titre, #description, #image, #hotel, #restaurant, #ville, #p_i, #remise, #p_a, #nbr');
        fields.forEach(field => field.disabled = true);
    });
</script>


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

    if (toggleSidebar) {
      toggleSidebar.addEventListener("click", () => {
        sidebar.classList.toggle("custom-close");
      });
    }

    if (logo) {
      logo.addEventListener("click", () => {
        sidebar.classList.toggle("custom-close");
      });
    }

    </script>

<!-- JavaScript pour la gestion des calculs -->
<script>
    function calculatePrice() {
        const prixInitial = parseFloat(document.getElementById('p_i').value) || 0;
        const remise = parseFloat(document.getElementById('remise').value) || 0;
        const prixActuel = prixInitial - (prixInitial * (remise / 100));
        document.getElementById('p_a').value = prixActuel.toFixed(2);
    }

    document.getElementById('p_i').addEventListener('input', calculatePrice);
    document.getElementById('remise').addEventListener('input', calculatePrice);
</script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/2.0.5/js/jquery.dataTables.js"></script>
<script src="https://cdn.datatables.net/2.0.5/js/dataTables.bootstrap5.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
<script src="https://unpkg.com/boxicons@2.1.2/dist/boxicons.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>

<script>
    function toggleSubmenu() {
        const submenu = document.querySelector('.submenu');
        submenu.style.display = submenu.style.display === 'block' ? 'none' : 'block';
    }
</script>

 
</body>
</html>
