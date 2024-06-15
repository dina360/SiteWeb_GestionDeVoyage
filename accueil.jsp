<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agence de Voyage Maroc</title>
    <!-- Liens vers Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Votre propre fichier CSS -->
    <link href="css/style.css" rel="stylesheet" type="text/css">
<style>
   .card {
            height: 100%;
            display: flex;
            flex-direction: column;
            border: 1px solid #ccc;
            text-align: center;
        }

        .card img {
            height: 200px;
            width: 100%;
            object-fit: cover;
        }

        .card .card-body {
            flex-grow: 1;
            display: flex;
            flex-direction: column;
        }

        .card button {
            margin-top: auto;
            align-self: center;
            width:60%;
            border-radius: 20px;
        	
        }
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
    </style>
</head>
<body>
    <!-- Barre de navigation similaire à Bootstrap -->
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
                <li class="nav-item ">
                    <a class="nav-link" href="#">Accueil</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Voyages</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Offre.jsp">Offres</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Contact</a>
                </li>
            </ul>
        </div>
    </nav>
    <!-- Section avec la vidéo et le texte -->
    <section class="video-section" >
    <div class="video-container">
        <video autoplay loop muted plays-inline>
            <source src="./css/video/videomaroc.mp4" type="video/mp4">
        </video>
    </div>
    <div class="content">
        <h1>EXPLOREZ LE MAROC DES MAINTENANT !</h1>
        <h2>Découvrez le Maroc avec notre agence de voyages. Expériences uniques, service exceptionnel.</h2>
    </div>
    </section>
   <!-- Section pour les cartes des villes -->
    <section id="portfolio" class="portfolio section-padding">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-header text-center pb-5">
                        <h1>Nos Services</h1>
                        <h3><p>Découvrez nos services exclusifs qui 
                        répondent à tous vos besoins de voyage aventures excitantes, retraites relaxantes, et découvertes culturelles.</p></h3>
                    </div>
                </div>
            </div>
           <div class="row">
            <div class="row justify-content-center">
			    <div class="col-12 col-md-6 col-lg-4">
			        <div class="card text-light text-center bg-white pb-2">
			            <div class="card-body text-dark">
			                <div class="img-area mb-4">
			                    <img src="./css/image/tanger.jpg" alt="" class="img-fluid">
			                </div>
			                <h3 class="card-title">Ville de Tanger</h3>
			                <p class="lead">Tanger, la perle du nord, est une ville portuaire marocaine située sur le détroit de Gibraltar. Connue pour son histoire, son architecture unique et son rôle économique stratégique</p>
			                <button class="btn bg-warning text-dark">En savoir plus</button>
			            </div>
			        </div>
			    </div>
			 
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="card text-light text-center bg-white pb-2">
                        <div class="card-body text-dark">
                            <div class="img-area mb-4">
                                <img src="./css/image/marrakech.jpg" alt="" class="img-fluid">
                            </div>
                            <h3 class="card-title">Ville de Marrakech</h3>
                            <p class="lead">Marrakech est une ville impériale du Maroc, célèbre pour ses souks, ses palais et ses jardins. Découvrez la magie de cette ville fascinante avec notre agence de voyages.</p>
                            <button class="btn bg-warning text-dark">En savoir plus</button>
                        </div>
                    </div>
                </div>
                
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="card text-light text-center bg-white pb-2">
                        <div class="card-body text-dark">
                            <div class="img-area mb-4">
                                <img src="./css/image/rabat.jpg" alt="" class="img-fluid">
                            </div>
                            <h3 class="card-title">Ville de Rabat</h3>
                            <p class="lead">Rabat, la capitale du Maroc, est une ville moderne et historique bordée par l'Atlantique. Explorez cette ville dynamique et découvrez son riche patrimoine culturel.</p>
                            <button class="btn bg-warning text-dark">En savoir plus</button>
                        </div>
                    </div>
                </div>
            </div>
     </div>
        </div>
    </section>
    <br><br><br>
    
    <p>dzez fzef zefez f zef ze  ze f zef </p>
<script>
    // Attend que le contenu de la page soit chargé
    document.addEventListener("DOMContentLoaded", function() {
        // Sélectionne toutes les cartes avec la classe 'card'
        var cards = document.querySelectorAll('.card');
        
        // Initialise la hauteur maximale à zéro
        var maxHeight = 0;
        
        // Boucle à travers toutes les cartes pour trouver la hauteur maximale
        cards.forEach(function(card) {
            var cardHeight = card.offsetHeight; // Hauteur de la carte
            maxHeight = Math.max(maxHeight, cardHeight); // Met à jour la hauteur maximale
        });
        
        // Applique la hauteur maximale à toutes les cartes
        cards.forEach(function(card) {
            card.style.height = maxHeight + 'px';
        });
    });
</script>

    
</body>
</html>
