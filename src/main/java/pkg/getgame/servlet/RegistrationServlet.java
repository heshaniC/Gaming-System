package pkg.getgame.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pkg.getgame.model.User;

import pkg.getgame.connection.DbCon;
import pkg.getgame.dao.UserDao;
/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/user-registration")
public class RegistrationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("registration.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            UserDao udao = new UserDao(DbCon.getConnection());

            User user = udao.userRegister(name, email, password);
            
            user = udao.userLogin(email, password);

            if (user != null) {
                // Registration success
                request.getSession().setAttribute("auth", user);
                response.sendRedirect("index.jsp");
            } else {
                out.print("User registration failed");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

