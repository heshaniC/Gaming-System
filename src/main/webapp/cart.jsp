<!-- Import java classes -->
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="pkg.getgame.connection.DbCon"%>
<%@ page import="pkg.getgame.model.*"%>
<%@ page import="pkg.getgame.dao.ProductDao"%>
<%@ page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%> 


<%

//total price set number format with 2 decimal numbers
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);

User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;

if (cart_list != null) {
	ProductDao pDao = new ProductDao(DbCon.getConnection());
	cartProduct = pDao.getCartProducts(cart_list);
	double total = pDao.getTotalCartPrice(cart_list);
	request.setAttribute("cart_list", cart_list);
	request.setAttribute("total", total);
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Cart - Online Gaming Website</title>

<%@include file="includes/head.jsp"%>

<!-- Custom CSS For Increment and Decrement button in Cart page -->
<style type="text/css">
.table tbody td {
	vartical-align: middle;
}

.btn-incre, .btn-decre {
	box-shadow: none;
	font-size: 25px;
}
</style>

</head>
<body>

	<!-- NavBar -->
	<%@include file="includes/navbar.jsp"%>

	<!-- Cart -->
	<div class="container">
		<div class="d-flex py-3">
			<h3>
				Total Price: $ ${ (total>0)?dcf.format(total):0 }<a class="mx-3 btn btn-primary"
					href="cart-check-out">Check Out</a>
			</h3>
		</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>
					<th scope="col">Buy Now</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
				<%
				if (cart_list != null) {
					for (Cart c : cartProduct) {
				%>
				<tr>
					<td><%=c.getName()%></td>
					<td><%=c.getCategory()%></td>
					<td><%=dcf.format(c.getPrice())%>$</td>
					<td>
						<form action="order-now" method="post" class="form-inline">
							<input type="hidden" name="id" value="<%=c.getId()%>"
								class="form-input">
							<div class="form-group d-flex justify-content-between"> <!-- w-50 -->
								<a class="btn btn-sm btn-decre" href="quantity-inc-dec?action=dec&id=<%= c.getId()%>"> <!-- get id to identify the product what is perform -->
								<i class="fas fa-minus-square"></i></a> <input type="text"
									name="quantity" class="form-control" value="<%= c.getQuantity() %>" readonly> <!-- form-contorl w-50 -->
								<a class="btn btn-sm btn-incre" href="quantity-inc-dec?action=inc&id=<%= c.getId()%>"><i
									class="fas fa-plus-square"></i></a>
							</div>
							<button type="submit" class="btn btn-primary btn-sm">Buy</button>
						</form>
					</td>
					<td><a class="btn btn-sm btn-danger" href="remove-from-cart?id=<%=c.getId()%>">Remove</a></td>
				</tr>
				<%
				}
				}
				%>

			</tbody>
		</table>
	</div>

	<!-- Include Bootstrap Js Files -->
	<%@include file="includes/footer.jsp"%>
</body>
</html>