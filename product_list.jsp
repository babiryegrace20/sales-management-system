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
<th>Name</th>
<th>Description</th>
<th>Image</th>
<th>Price</th>
<th>Quantity Sold</th>
<th>Quantity Available</th>

</thead>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from product";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tbody>
<tr>
<td><%=resultSet.getString("name") %></td>
<td><%=resultSet.getString("description") %></td>
<td>
	<%
	String img = resultSet.getString("image");
	out.println("<img src='images/"+img+"' style='max-width:80px; max-height:90px;'>");
	%>
</td>
<td><%=resultSet.getString("price") %></td>
<td><%=resultSet.getString("qtty_sold") %></td>
<td><%=resultSet.getString("qtty_available") %></td>
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