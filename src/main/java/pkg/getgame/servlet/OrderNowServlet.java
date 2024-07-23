package pkg.getgame.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pkg.getgame.connection.DbCon;
import pkg.getgame.dao.OrderDao;
import pkg.getgame.model.Cart;
import pkg.getgame.model.Order;
import pkg.getgame.model.User;


@WebServlet("/order-now")
public class OrderNowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()){
			
			SimpleDateFormat formatter = new SimpleDateFormat("yyy-MM-dd");
			Date date = new Date(0);
			
			// Get user details from session
			User auth = (User) request.getSession().getAttribute("auth");
			
			if(auth != null) { // user logged in
				
				String productId = request.getParameter("id");
				int productQuantity = Integer.parseInt(request.getParameter("quantity"));
				
				if(productQuantity <= 0) { // If product quantity 0 set it is 1
					productQuantity =1;
				}
				
				// Create a order model
				Order orderModel = new Order();
				orderModel.setId(Integer.parseInt(productId)); // get productId form Product super class
				orderModel.setUid(auth.getId());
				orderModel.setQuantity(productQuantity);
				orderModel.setDate(formatter.format(date));
				
				//Call orderDao method
				OrderDao orderDao = new OrderDao(DbCon.getConnection());
				boolean result = orderDao.insertOrder(orderModel);
				
				if(result) {
					
					// remove item from cart
					ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
					if(cart_list != null) {
						for(Cart c:cart_list) {
							if(c.getId() == Integer.parseInt(productId)) {
								cart_list.remove(cart_list.indexOf(c));
								break;
							}
						}
					}
					
					response.sendRedirect("orders.jsp");
				}else {
					out.print("order failed");
				}
				
				
			}else {
				response.sendRedirect("login.jsp");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
