package pkg.getgame.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pkg.getgame.connection.DbCon;
import pkg.getgame.dao.UserDao;
import pkg.getgame.model.User;


@WebServlet("/user-login")
public class LoginServlet extends HttpServlet {
	
	
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("login.jsp");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out = response.getWriter()){ // this is use for using out.print();
			String email = request.getParameter("login-email");
			String password = request.getParameter("login-password");
			
			UserDao udao = new UserDao(DbCon.getConnection());
			
			User user = udao.userLogin(email, password);
			
			if(user != null) { //login validation success
				request.getSession().setAttribute("auth", user);
				response.sendRedirect("index.jsp");
			}else { // login validation failed
				out.print("User login failed");
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}


















