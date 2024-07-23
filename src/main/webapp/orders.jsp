<!-- Import java classes -->
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="pkg.getgame.connection.DbCon" %>
<%@ page import="pkg.getgame.model.*" %>
<%@ page import="pkg.getgame.dao.*" %>

<%@ page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	
<%
	//total price set number format with 2 decimal numbers
	DecimalFormat dcf = new DecimalFormat("#.##");
	request.setAttribute("dcf", dcf);

	User auth = (User) request.getSession().getAttribute("auth");
	
	//Make global variable
	List<Order> orders = null;
	
	if (auth != null){
		
		request.setAttribute("auth", auth);
		
		// Return list of orders
		orders = new OrderDao(DbCon.getConnection()).userOrders(auth.getId());
	
	}else{
		response.sendRedirect("login.jsp"); // If user not logged in redirect>>
	}
	
	//get cart quantity badge
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	if(cart_list != null){
		request.setAttribute("cart_list", cart_list);
	}
%>


<!DOCTYPE html>
<html>
<head>
	<title>Orders - Online Gaming Website</title>
	
	<%@include file="includes/head.jsp" %>
</head>
<body>
	
	<!-- NavBar -->
	<%@include file="includes/navbar.jsp" %>
	
	<div class="container">
		<div class="card-header my-3">All Orders</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Date</th>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Quantity</th>
					<th scope="col">Price</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
				<%
					if(orders != null){
						for(Order o:orders){%>
						<tr>
							<td><%=o.getDate() %></td>
							<td><%=o.getName() %></td>
							<td><%=o.getCategory() %></td>
							<td><%=o.getQuantity() %></td>
							<td><%=dcf.format(o.getPrice()) %></td>
							<td><a class="btn btn-sm btn-danger" href="cancel-order?id=<%=o.getOrderId() %>">Cancel</a></td>
						</tr>
						<%}
					}
				%>
			</tbody>
		</table>
	</div>
	
	<!-- Include Bootstrap Js Files -->
	<%@include file="includes/footer.jsp"%>
</body>
</html>














