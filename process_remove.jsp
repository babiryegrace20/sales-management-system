<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

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

String ref_name=request.getParameter("ref_name");

try{
	connection = DriverManager.getConnection(connectionUrl+database, userid, password);

	if(ref_name==""){

		out.println("<span><p class='alert-danger'>Please fill in the Reference ID.</p></span>");
		out.println("<meta http-equiv='refresh' content='2;url=admin.jsp#manage' />");

	}else{

			String sql ="DELETE FROM sales_person WHERE ref_name='"+ref_name+"'";

		 	Statement stmt = connection.createStatement();
			int num_rows = stmt.executeUpdate(sql); 

			if(num_rows>0){
			  out.println("<span><p class='alert-info'>successfully deleted "+ref_name+".</p></span>");
			  out.println("<meta http-equiv='refresh' content='2;url=admin.jsp#manage' />");
			} else {
			  out.println("<span><p class='alert-danger'>Failed, please try again.</p></span>");
			  out.println("<meta http-equiv='refresh' content='2;url=admin.jsp#manage' />");
			}

	}
	connection.close();

} catch (Exception e) {
	e.printStackTrace();
    out.println("<span><p class='alert-danger'>exception error: "+ e +"</p></span>");
    out.println("<meta http-equiv='refresh' content='2;url=admin.jsp#manage' />");
}
%>

</div>
</body>
</html>