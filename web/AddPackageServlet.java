package web;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import beans.Offre;
import dao.OffreDAO;
@WebServlet("/AddPackageServlet")
@MultipartConfig
public class AddPackageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
    	request.setCharacterEncoding("UTF-8");
        // Récupérer les données du formulaire
        String titre = request.getParameter("titre");
        String description = request.getParameter("description");
        float prix_initiale = Float.parseFloat(request.getParameter("p_i"));
        float prix_actuel =  Float.parseFloat(request.getParameter("p_a"));
        int remise = Integer.parseInt(request.getParameter("remise"));
        int nbr_pack_disponible = Integer.parseInt(request.getParameter("nbr"));

        // Gérer le téléchargement de fichier
     // Gérer le téléchargement de fichier pour chaque partie
        Part filePartImage = request.getPart("image");
        String fileNameImage = Paths.get(filePartImage.getSubmittedFileName()).getFileName().toString();
        String uploadPathImage = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDirImage = new File(uploadPathImage);
        if (!uploadDirImage.exists()) uploadDirImage.mkdir();
        filePartImage.write(uploadPathImage + File.separator + fileNameImage);

        Part filePartHotel = request.getPart("hotel");
        String fileNameHotel = Paths.get(filePartHotel.getSubmittedFileName()).getFileName().toString();
        String uploadPathHotel = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDirHotel = new File(uploadPathHotel);
        if (!uploadDirHotel.exists()) uploadDirHotel.mkdir();
        filePartHotel.write(uploadPathHotel + File.separator + fileNameHotel);

        Part filePartRestaurant = request.getPart("restaurant");
        String fileNameRestaurant = Paths.get(filePartRestaurant.getSubmittedFileName()).getFileName().toString();
        String uploadPathRestaurant = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDirRestaurant = new File(uploadPathRestaurant);
        if (!uploadDirRestaurant.exists()) uploadDirRestaurant.mkdir();
        filePartRestaurant.write(uploadPathRestaurant + File.separator + fileNameRestaurant);

        Part filePartVille = request.getPart("ville");
        String fileNameVille = Paths.get(filePartVille.getSubmittedFileName()).getFileName().toString();
        String uploadPathVille = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDirVille = new File(uploadPathVille);
        if (!uploadDirVille.exists()) uploadDirVille.mkdir();
        filePartVille.write(uploadPathVille + File.separator + fileNameVille);

        // Créer un objet Offre avec les données récupérées
        Offre nouvelleOffre = new Offre(titre, description, "uploads/" + fileNameImage, "uploads/" + fileNameHotel, "uploads/" + fileNameRestaurant, "uploads/" + fileNameVille, prix_initiale, prix_actuel, remise,nbr_pack_disponible);

        // Enregistrer l'offre dans la base de données en utilisant OffreDAO
        OffreDAO offreDAO = new OffreDAO();
        boolean success = offreDAO.addOffre(nouvelleOffre);

        // Rediriger vers la page appropriée en fonction du succès
        if (success) {
            request.getSession().setAttribute("successMessage", "l'ajoute du paquet a été réalisée avec succès.");
            response.sendRedirect("GestionOffre.jsp");
        } else {
            // Gérer l'échec, peut-être afficher un message d'erreur ou rediriger vers une page d'erreur
            response.sendRedirect("erreur.jsp");
        }
    }

}
