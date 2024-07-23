<!-- Import java classes -->
<%@ page import="pkg.getgame.connection.DbCon" %>
<%@ page import="pkg.getgame.model.*" %>

<%@ page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	response.sendRedirect("index.jsp");
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
<title>Login - Online Gaming Website</title>

<%@include file="includes/head.jsp"%>
</head>
<body>

	<!-- NavBar -->
	<%@include file="includes/navbar.jsp"%>

	<!-- Registration Form  -->
	<div class="container">
        <div class="card w-50 mx-auto my-5">
            <div class="card-header text-center">User Registration</div>
            <div class="card-body">
                <form action="user-registration" method="post">
                    <div class="form-group">
                        <label>Name</label>
                        <input type="text" class="form-control" name="name" placeholder="Enter Your Name" required>
                    </div>
                    <div class="form-group">
                        <label>Email Address</label>
                        <input type="email" class="form-control" name="email" placeholder="Enter Your Email" required>
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <input type="password" class="form-control" name="password" placeholder="*******" required>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary">Register</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

	<!-- Include Bootstrap Js Files -->
	<%@include file="includes/footer.jsp"%>
</body>
</html>