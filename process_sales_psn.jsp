<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@ page import = "java.io.*,java.util.*" %>

<%
String id = request.getParameter("username");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "kayenet_db";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
%>
<!DOCTYPE html>
<html>

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Kayenet Enterprises</title>
  			
  		<!-- Bootstrap core CSS -->
  	<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <link rel="shortcut icon" type="image/png" href="/kayenet/images/favicon.png"/>

</head>

<body>

<%

String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String user_name=request.getParameter("username");
String refName=request.getParameter("ref_name");
String pNumber=request.getParameter("pnumber");
String pass=request.getParameter("password");
String address=request.getParameter("address");
String shopID=request.getParameter("shopid");

try{
	connection = DriverManager.getConnection(connectionUrl+database, userid, password);

	if(fname==""&&
		lname==""&&
		user_name==""&&
		refName==""&&
		pNumber==""&&
		pass==""&&
		address==""&&
		shopID==""){

		out.println("<span><p class='alert-danger'>Please fill in all required fields.</p></span>");
		out.println("<meta http-equiv='refresh' content='2;url=add_product.html' />");

	}else{

			String sql ="INSERT INTO sales_person (ref_name, fname, lname, username, phone_no, password, address, shopID) VALUES ('"+refName+"','" +fname+"','" +lname+"','" +user_name+"', '" +pNumber+"', '" +pass+"', '" +address+"','" +shopID+"')";

		 	Statement stmt = connection.createStatement();
			int num_rows = stmt.executeUpdate(sql); 

			if(num_rows>0){
			  out.println("<span><p class='alert-info'>successfully added sales person.</p></span>");
			  out.println("<meta http-equiv='refresh' content='2;url=admin.jsp#manage' />");
			} else {
			  out.println("<span><p class='alert-danger'>Failed, please try again.</p></span>");
			  out.println("<meta http-equiv='refresh' content='2;url=admin.jsp' />");
			}

	}
	connection.close();

} catch (Exception e) {
	e.printStackTrace();
    out.println("<span><p class='alert-danger'>exception error: "+ e +"</p></span>");
    out.println("<span><p class='alert-danger'>Invalid Bag ID.</p></span>");
    out.println("<meta http-equiv='refresh' content='2;url=admin.jsp' />");
}
%>


</body>
</html>