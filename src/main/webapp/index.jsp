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

// Retreive all products
List<Product> products = pd.getAllProducts();


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


	<!-- Hero -->
	<div class="container" style="margin-top: 5px; border-radius: 10px;">

		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="d-block w-100" src="website-image/hero-image.png"
						alt="First slide" style="border-radius: 10px;">
					
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="website-image/hero-image.png"
						alt="Second slide" style="border-radius: 10px;">
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>

	</div>

	<!-- Products -->
	<div class="container">
		<div class="card-header my-3">All Games</div>
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
			}
			%>

		</div>

		<div class="jumbotron" style="margin-top:20px;">
			<h1 class="display-4"> EXPLORE SLIIT GAME STUDIO</h1>
			<p class="lead">Unlock Gaming Greatness with Premium Gear - Your Ultimate Destination for Unbeatable Quality and Performance</p>
			<hr class="my-4">
			<p>Click here to explore our gaming world. You can buy install play and enjoy.</p>
			<p class="lead">
				<a class="btn btn-primary btn-lg" href="shop.jsp" role="button">Explore Now</a>
			</p>
		</div>

	</div>
	
	

	<!-- Include Bootstrap Js Files -->
	<%@include file="includes/footer.jsp"%>
</body>
</html>