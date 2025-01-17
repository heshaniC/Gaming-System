<!-- Import java classes -->
<%@ page import="java.util.List"%>
<%@ page import="pkg.getgame.connection.DbCon"%>
<%@ page import="pkg.getgame.dao.ProductDao"%>
<%@ page import="pkg.getgame.model.*"%>

<%@ page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}

// Get product list to create the cart
ProductDao pd = new ProductDao(DbCon.getConnection());

// Get searched text
String text = request.getParameter("searchText"); // searchText form navbar module search input field

// Get search products
List<Product> products = pd.searchProduct(text);

//get cart quantity badge
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Online Gaming Website</title>

<%@include file="includes/head.jsp"%>
</head>
<body>

	<!-- NavBar -->
	<%@include file="includes/navbar.jsp"%>


	<!-- Products -->
	<div class="container">
		<div class="card-header my-3">
			Search Results :
			<%=text%></div>
		<div class="row">
			<%
			if (!products.isEmpty()) {
				for (Product p : products) {
			%>
			<div class="col-md-3 my-3">
				<div class="card w-100" style="width: 18rem;">
					<img class="card-img-top" src="product-image/<%=p.getImage()%>"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"><%=p.getName()%></h5>
						<h6 class="price">
							Price: $<%=p.getPrice()%></h6>
						<h6 class="category">
							Category:
							<%=p.getCategory()%></h6>
						<div class="mt-3 d-flex justify-content-between">
							<a href="add-to-cart?id=<%=p.getId()%>" class="btn btn-primary">Add
								to Cart</a>
							<!-- btn-dark -->
							<a href="order-now?quantity=1&id=<%=p.getId()%>"
								class="btn btn-primary">Buy Now</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			} else {
			%>
			<h3 class="mx-auto mt-4">
				No products with :
				<%=text%></h3>
			<!-- No products to show -->
			<%
			}
			%>

		</div>
	</div>



	<!-- Include Bootstrap Js Files -->
	<%@include file="includes/footer.jsp"%>
</body>
</html>