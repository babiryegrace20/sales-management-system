<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ page import = "java.io.*,java.util.*" %>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

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
Statement statement = null;
ResultSet resultSet = null;
%>

<table class="table table-bordered table-hover" border="2">
<thead>
<th>Ref.No</th>
<th>First Name</th>
<th>Last Name</th>
<th>Username</th>
<th>Phone No.</th>
<th>Address</th>
<th>Shop ID</th>

</thead>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from sales_person";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tbody>
<tr>
<td><%=resultSet.getString("ref_name") %></td>
<td><%=resultSet.getString("fname") %></td>
<td><%=resultSet.getString("lname") %></td>
<td><%=resultSet.getString("username") %></td>
<td><%=resultSet.getString("phone_no") %></td>
<td><%=resultSet.getString("address") %></td>
<td><%=resultSet.getString("shopID") %></td>
</tr>
</tbody>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</br></br>
<form class="form" action="process_remove.jsp" method="get">
	<input type="text" name="ref_name" placeholder="Enter Ref_Name" required="required">
	<input type="submit" value="Remove sales person" style="margin: 0px auto; 
		background-color: #5F9EA0;
		color: white;">
</form>