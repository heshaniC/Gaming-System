package pkg.getgame.dao;

import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;

import pkg.getgame.model.User;

public class UserDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	// Constructor
	public UserDao(Connection con) {
		this.con = con;
	}
	
	// User login
	public User userLogin(String email, String password) {
		User user = null;
		
		try {
			query = "SELECT * FROM users WHERE email = ? and password = ?";
			pst = this.con.prepareStatement(query);
			
			pst.setString(1, email);
			pst.setString(2, password);
			rs = pst.executeQuery();
			
			// If user exist create a new user object 
			if(rs.next()) {
				user = new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
		
		return user;
	}
	
	// User registration
	public User userRegister(String name, String email, String password) {
	    User user = null;


	    try {
	        query = "INSERT INTO users (name, email, password) VALUES (?, ?, ?)";
	        pst = this.con.prepareStatement(query);
	        
	        pst.setString(1, name);
	        pst.setString(2, email);
	        pst.setString(3, password);

	        int rows = pst.executeUpdate();
	        if (rows > 0) {
	        	 ResultSet generatedKeys = pst.getGeneratedKeys();
	             if (generatedKeys.next()) {
	                 user = new User();
	                 user.setId(generatedKeys.getInt(1)); // Assuming 'id' is the first column
	                 user.setName(name);
	                 user.setEmail(email);
	                 // You may set other user attributes here
	             }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        System.out.print(e.getMessage());
	    }

	    return user;
	}

	
}
