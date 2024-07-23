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
import pkg.getgame.dao.ContactDao;
import pkg.getgame.model.Contact;


@WebServlet("/contact-submit")
public class ContactSubmitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("contact.jsp");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		
        try (PrintWriter out = response.getWriter()) {
        	
            String email = request.getParameter("email");
            String title = request.getParameter("title");
            String message = request.getParameter("message");

            ContactDao cDao = new ContactDao(DbCon.getConnection());

            Contact contact = cDao.contactFormSubmit(email, title, message);

            if (contact != null) {
                //Contact form submitted successfully
                //request.getSession().setAttribute("auth", contact);
                response.sendRedirect("contact-done.jsp");
                
            } else {
                out.print("Contact form submission failed");
            }
            
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        
	}

}
