package pkg.getgame.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbCon {
	private static Connection connection = null;
	
	// Create the MYSQL connection
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		if(connection == null) {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection =DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce_cart","root","123@Thilo"); // Assign the connection to variable
			System.out.print("Connected");
		}
		return connection;
	}
}
