<!-- Import java classes -->
<%@ page import="pkg.getgame.connection.DbCon"%>
<%@ page import="pkg.getgame.model.*"%>

<%@ page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
User auth = (User) request.getSession().getAttribute("auth");
/*  if (auth != null) {
	response.sendRedirect("login.jsp");
} */


//get cart quantity badge
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Contact - Online Gaming Website</title>

<%@include file="includes/head.jsp"%>
</head>
<body>

	<!-- NavBar -->
	<%@include file="includes/navbar.jsp"%>
	

	<!-- Contact Form  -->
	<div class="container">
	
	
		<!-- Successfully Submitted Message -->
		<div class="alert alert-success mt-4" role="alert">
	  		Message Sent! Thank you. We will contact you soon.
		</div>
		
		
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center">Contact Us</div>
			<div class="card-body">
				<form action="contact-submit" method="post">
					<div class="form-group">
						<label>Email Address</label> <input type="email"
							class="form-control" name="email" placeholder="Enter Your Email"
							required>
					</div>
					<div class="form-group">
						<label>Title</label> <input type="text" class="form-control"
							name="title" placeholder="Enter Your Name" required>
					</div>
					<div class="form-group">
						<label>Message</label> <textarea
							class="form-control" name="message" placeholder="Type you message here.."
							required></textarea>
					</div>
					<div class="text-center">
						<button type="submit" class="btn btn-primary">Send Message</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- Include Bootstrap Js Files -->
	<%@include file="includes/footer.jsp"%>
</body>
</html>