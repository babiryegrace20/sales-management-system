<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ page import = "java.io.*,java.util.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>Kayenet Enterprise</title>

		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<link rel="stylesheet" type="text/css" href="css/login_page.css">

		<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	  	<script src="vendor/jquery/jquery.min.js"></script>
  		<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<link rel="shortcut icon" type="image/png" href="/kayenet/images/favicon.png"/>

</head>

<body>

	<div class="main-content">

		<div class="header">
	  		<h2>Login</h2>
	  	</div>
		 
		<form class="form" method="get" action="login">
		  	<div class="input-group">
		  		<label>Username</label>
		  		<input type="text" name="username" >
		  	</div>
		  	<div class="input-group">
		  		<label>Password</label>
		  		<input type="password" name="password">
		  	</div>
		  	<div class="input-group">
		  		<button type="submit" class="btn" style="background-color: #5F9EA0;
		  		padding: 10px;
		  		font-size: 15px;
		  		color: white;
		  		border: none;
		  		margin: 0px auto; 
		  		width: 40%;
  				border-radius: 5px;">Login</button>
		  	</div>
		</form>

	</div>
</body>
</html>