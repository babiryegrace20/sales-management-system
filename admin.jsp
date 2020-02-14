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
      <a class="navbar-brand js-scroll-trigger" href="#page-top">Kayenet Enterprise: Admin</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#about">About</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#manage">Manage</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#products">Products</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#sales">Sales</a>
          </li>
          <li class="nav-item">
          	<a class="nav-link js-scroll-trigger" href="logout.jsp" style="color: red">Logout</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <header class="text-white" style="background-color: #5F9EA0;">

			<div class="container text-center">
				<p class="alert"> <% out.println("<h1>Welcome "+ user+"</h1> "); %> </p><br/>
				<p class="lead"> </p>
			</div>

  </header>

  <section id="about">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 mx-auto">
          <h2>About this page</h2>
          <p class="lead">Kayenet is a business startup located within Kampala and deals mainly in ladies' bags with 3 distributed shops - Nakawa (NAK), Kawempe (KAW) and Mengo (MEN). The three shops are operated by three different sales persons working in them.</p>
          <p class="lead">In this <b>Admin</b> account, you can be able to: </p>
          <ul>
            <li>Create and manage accounts for the three sales persons. </li>
            <li>Retrieve product listing with quantities (sold and available)</li>
            <li>Retrieve daily, weekly and monthly sales with computed sales amounts for the specific shops and/or sales persons</li>
          </ul>
        </div>
      </div>
    </div>
  </section>

  <section id="manage">
    <div class="container">

      <div class="row">
        <div class="col-lg-8 mx-auto">
          <h2>Sales Persons</h2>
            <jsp:include page="sales_persons.jsp"/>
        </div>
      </div>

      <div class="row"></br></br></div>

      <div class="row">
        <div class="col-lg-8 mx-auto">
          <h2>Add Sales Person</h2>
            <jsp:include page="add_sales_person.html"/>
        </div>
      </div>
    </div>

  </section>

  <section id="products" class="bg-light">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 mx-auto">
          <h2>Product List</h2>

          <jsp:include page="product_list.jsp" />

        </div>
      </div>
    </div>
  </section>

  <section id="sales" class="bg-light">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 mx-auto">
          <h2>Sales</h2>

          <jsp:include page="sales.jsp" />

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
