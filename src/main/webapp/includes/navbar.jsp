
<!--Nav Bar  -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container">
			<a class="navbar-brand" href="index.jsp">SLIIT GAME STUDIO</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<form class="form-inline my-2 my-lg-0" action="search.jsp" method="post">
					<input class="form-control mr-sm-2" type="text"
						placeholder="Search Products" aria-label="Search" name="searchText">
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
				</form>
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link" href="index.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="shop.jsp">Shop</a></li>
					<li class="nav-item"><a class="nav-link" href="cart.jsp">Cart<span class="badge badge-danger" style="margin-left: 5px">${cart_list.size() }</span></a></li>
					<li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
					<%
						if(auth != null){%>
							<li class="nav-item"><a class="nav-link" href="orders.jsp">Orders</a></li>
							<li class="nav-item"><a class="nav-link" href="log-out">Logout</a></li>
							
							<!-- Show user name -->
							<li class="nav-item">
	                        <span class="nav-link" style="color: green;">Welcome, <%= auth.getName() %></span>
	                    	</li>
					<%	}else{%>
							<li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
							<li class="nav-item"><a class="nav-link" href="registration.jsp">Register</a></li>
					<%	} %>
				</ul>
			</div>
		</div>
	</nav>