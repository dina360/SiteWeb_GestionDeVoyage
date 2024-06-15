package web;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/ModifierOffreServlet")
@MultipartConfig
public class ModifierOffreServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");

        int offreId = Integer.parseInt(request.getParameter("id"));
        String titre = request.getParameter("titre");
        String description = request.getParameter("description");
        Part nouvelleImagePart = request.getPart("nouvelleImage");
        Part nouvelleImagePartH = request.getPart("nouvelleImageHotel");
        Part nouvelleImagePartR = request.getPart("nouvelleImageRestaurant");
        Part nouvelleImagePartV = request.getPart("nouvelleImageVille");

       // String prixStrI = request.getParameter("prixInitial");
        String prixStrA = request.getParameter("prixActuel");

        //String remiseStr = request.getParameter("remise");
        //String nbrStr = request.getParameter("nombrePaquetRestants");

       // float prix_i = prixStrI != null && !prixStrI.isEmpty() ? Float.parseFloat(prixStrI) : 0;
        float prix_a = prixStrA != null && !prixStrA.isEmpty() ? Float.parseFloat(prixStrA) : 0;
        //int remise = remiseStr != null && !remiseStr.isEmpty() ? Integer.parseInt(remiseStr) : 0;
        //int nbr = nbrStr != null && !nbrStr.isEmpty() ? Integer.parseInt(nbrStr) : 0;

        String nouvelleImageFilename = uploadFile(nouvelleImagePart, request);
        String nouvelleImageFilenameH = uploadFile(nouvelleImagePartH, request);
        String nouvelleImageFilenameR = uploadFile(nouvelleImagePartR, request);
        String nouvelleImageFilenameV = uploadFile(nouvelleImagePartV, request);

        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestionvoyage", "root", "");

            StringBuilder queryBuilder = new StringBuilder("UPDATE packages SET titre = ?, description = ?, p_i = ?, p_a = ?, remise = ?, nbr = ?");

            int index = 7;
            if (nouvelleImageFilename != null) {
                queryBuilder.append(", image = ?");
            }
            if (nouvelleImageFilenameH != null) {
                queryBuilder.append(", hotel = ?");
            }
            if (nouvelleImageFilenameR != null) {
                queryBuilder.append(", restaurant = ?");
            }
            if (nouvelleImageFilenameV != null) {
                queryBuilder.append(", ville = ?");
            }
            queryBuilder.append(" WHERE id = ?");

            preparedStatement = connection.prepareStatement(queryBuilder.toString());
            preparedStatement.setString(1, titre);
            preparedStatement.setString(2, description);
            preparedStatement.setFloat(3, prix_a);
            preparedStatement.setFloat(4, prix_a);
            preparedStatement.setInt(5, 0);
            preparedStatement.setInt(6, 255);

            if (nouvelleImageFilename != null) {
                preparedStatement.setString(index++, "uploads/" + nouvelleImageFilename);
            }
            if (nouvelleImageFilenameH != null) {
                preparedStatement.setString(index++, "uploads/" + nouvelleImageFilenameH);
            }
            if (nouvelleImageFilenameR != null) {
                preparedStatement.setString(index++, "uploads/" + nouvelleImageFilenameR);
            }
            if (nouvelleImageFilenameV != null) {
                preparedStatement.setString(index++, "uploads/" + nouvelleImageFilenameV);
            }
            preparedStatement.setInt(index, offreId);

            preparedStatement.executeUpdate();
            
            // Ajouter le message de succès à la session
            HttpSession session = request.getSession();
            session.setAttribute("successMessage", "La mise à jour de l'offre a été réalisée avec succès.");

            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        response.sendRedirect("pakvoyAdmin.jsp");
    }

    private String uploadFile(Part filePart, HttpServletRequest request) throws IOException {
        if (filePart != null && filePart.getSize() > 0) {
            String filename = filePart.getSubmittedFileName() != null ? Paths.get(filePart.getSubmittedFileName()).getFileName().toString() : null;
            if (filename != null) {
                String uploadDir = getServletContext().getRealPath("") + File.separator + "uploads";
                File uploadDirFile = new File(uploadDir);
                if (!uploadDirFile.exists()) {
                    uploadDirFile.mkdirs();
                }
                Path uploadPath = Paths.get(uploadDir, filename);
                Files.copy(filePart.getInputStream(), uploadPath, StandardCopyOption.REPLACE_EXISTING);
                return filename;
            }
        }
        return null;
    }
}
