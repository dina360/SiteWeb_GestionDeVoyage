package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class Connexion {
	
	private static Connection connexion=null; 
	private static void connect() {
	
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		
			String url = "jdbc:mysql://localhost:3306/gestionvoyage";
			String user = "root";
			String password ="";
		
			connexion =DriverManager.getConnection(url, user, password);
		
			System.out.println("Connextion bien etablie...");
			}
		catch(Exception ex) {
			System.out.println("!!!!!Probleme de connextion...."+ex.getMessage());
		}
	}
	public static Connection getConnexion() {
		if(connexion ==null)
			connect();
		
		return connexion;
	}
}