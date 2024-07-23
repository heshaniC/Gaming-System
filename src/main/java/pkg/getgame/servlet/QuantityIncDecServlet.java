package pkg.getgame.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pkg.getgame.model.Cart;


@WebServlet("/quantity-inc-dec")
public class QuantityIncDecServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		
		// get parameter from URL after click inc or dec button
		try(PrintWriter out = response.getWriter();){
			String action = request.getParameter("action");
			int id = Integer.parseInt(request.getParameter("id"));
			
			// get cart list item form session
			ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
		
			// inc & dec functionality
			if(action != null && id >= 1) { // inc
				if(action.equals("inc")) {
					for(Cart c:cart_list) {
						if(c.getId() == id) {
							int quantity = c.getQuantity();
							quantity++;
							c.setQuantity(quantity);
							response.sendRedirect("cart.jsp");
						}
					}
				}
				if(action.equals("dec")) { // dec
					for(Cart c:cart_list) {
						if(c.getId() == id && c.getQuantity() > 1) {
							int quantity = c.getQuantity();
							quantity--;
							c.setQuantity(quantity);
							break;
						}
					}
					response.sendRedirect("cart.jsp"); //if decrement hit 0
				}
			}else {
				response.sendRedirect("cart.jsp");
			}
		}
	}

}
