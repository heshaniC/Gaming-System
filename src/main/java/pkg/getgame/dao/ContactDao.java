package pkg.getgame.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import pkg.getgame.model.Contact;
import pkg.getgame.model.User;

public class ContactDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;

	// Constructor
	public ContactDao(Connection con) {
		this.con = con;
	}

	// Submit contact form details
	public Contact contactFormSubmit(String email, String title, String message) {

		Contact contact = null;

		try {
			query = "INSERT INTO contact(email, title, message) VALUES (?, ?, ?)";
			pst = this.con.prepareStatement(query);

			pst.setString(1, email);
			pst.setString(2, title);
			pst.setString(3, message);

			int rows = pst.executeUpdate();

			
			
			if (rows > 0) {
				
				contact = new Contact();
				
				contact.setEmail(email);
				contact.setTitle(title);
				contact.setMessage(message);
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.print(e.getMessage());
		}

		return contact;
	}
}
