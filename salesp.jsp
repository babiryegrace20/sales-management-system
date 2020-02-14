<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ page import = "java.io.*,java.util.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Kayenet Enterprises</title>
  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/scrolling-nav.css" rel="stylesheet">
   <link href="css/style.css" rel="stylesheet">

  <link rel="shortcut icon" type="image/png" href="/kayenet/images/favicon.png"/>

</head>

<% 
	String user = (String)session.getAttribute("username"); 
%>

<body id="page-top">

  	<% if(user==null){ %>

			<div class="container text-center">
		      	<p class="alert-info">Please Login first</p>
		    </div>
			<meta http-equiv="refresh" content="2;url=index.jsp" />

		<% }else{ %>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    <div class="container">
      <a class="navbar-brand js-scroll-trigger" href="#page-top">Kayenet Enterprise: Sales Person</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#">About</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#">Manage</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#add_product">Products</a>
          </li>
          <li class="nav-item">
          	<a class="nav-link js-scroll-trigger" href="logout.jsp" style="color: red">Logout: <%= user %></a>
          </li>
        </ul>
      </div>
    </div>
  </nav>


  <section id="add_product" class="bg-light">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 mx-auto">
          <h2>Add Product</h2>

          <jsp:include page="add_product.html"/>

        </div>
      </div>
    </div>
  </section>

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom JavaScript for this theme -->
  <script src="js/scrolling-nav.js"></script>

    <% } %>

</body>

</html>
