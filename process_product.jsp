<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@ page import = "java.io.*,java.util.*" %>

<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>


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

String bagID=request.getParameter("id");
String name=request.getParameter("bag_name");
String description=request.getParameter("description");
String image=request.getParameter("image");
String price=request.getParameter("price");
String qttySold=request.getParameter("sold");
String qttyAvailable=request.getParameter("available");

try{
	connection = DriverManager.getConnection(connectionUrl+database, userid, password);

	if(bagID==""&&
		name==""&&
		description==""&&
		image==""&&
		price==""&&
		qttySold==""&&
		qttyAvailable==""){

		out.println("<span><p class='alert-danger'>Please fill in all required fields.</p></span>");
		out.println("<meta http-equiv='refresh' content='2;url=add_product.html' />");

	}else{

			String sql ="INSERT INTO product (bagID, name, description, image, price, qtty_sold, qtty_available) VALUES ('"+bagID+"','" +name+"','" +description+"', '" +image+"', '" +price+"', '" +qttySold+"','" +qttyAvailable+"')";

		 	Statement stmt = connection.createStatement();
			int num_rows = stmt.executeUpdate(sql); 

			if(num_rows>0){
			  out.println("<span><p class='alert-info'>successfully added to DB.</p></span>");
			} else {
			  out.println("<span><p class='alert-danger'>Failed, please try again.</p></span>");
			  out.println("<meta http-equiv='refresh' content='2;url=add_product.html' />");
			}

	}
	connection.close();

} catch (Exception e) {
	e.printStackTrace();
    out.println("<span><p class='alert-danger'>exception error: "+ e +"</p></span>");
    out.println("<span><p class='alert-danger'>Invalid Bag ID.</p></span>");
    out.println("<meta http-equiv='refresh' content='2;url=add_product.html' />");
}
%>


 <%
      File file ;
      int maxFileSize = 5000000 * 1024;
      int maxMemSize = 5000000 * 1024;
      ServletContext context = pageContext.getServletContext();
      String filePath = context.getInitParameter("file-upload");

      // Verify the content type
      String contentType = request.getContentType();
      if ((contentType.indexOf("multipart/form-data") >= 0)) {

         DiskFileItemFactory factory = new DiskFileItemFactory();
         // maximum size that will be stored in memory
         factory.setSizeThreshold(maxMemSize);
         // Location to save data that is larger than maxMemSize.
         factory.setRepository(new File("D:/Apache Software Foundation/Tomcat 9.0/webapps/kayenet/images/"));

  // Create a new file upload handler
  ServletFileUpload upload = new ServletFileUpload(factory);
  // maximum file size to be uploaded.
  upload.setSizeMax( maxFileSize );
  try{ 
     // Parse the request to get file items.
     List<FileItem> fileItems = upload.parseRequest(request);

     // Process the uploaded file items
     Iterator i = fileItems.iterator();

     while ( i.hasNext () ) 
     {
        FileItem fi = (FileItem)i.next();
        if ( !fi.isFormField () )   
        {
        // Get the uploaded file parameters
        String fieldName = fi.getFieldName();
        String fileName = fi.getName();
        boolean isInMemory = fi.isInMemory();
        long sizeInBytes = fi.getSize();
        // Write the file
        if( fileName.lastIndexOf("\\") >= 0 ){
        file = new File( filePath + 
        fileName.substring( fileName.lastIndexOf("\\"))) ;
        }else{
        file = new File( filePath + 
        fileName.substring(fileName.lastIndexOf("\\")+1)) ;
        }
        fi.write( file ) ;

        request.setAttribute("Success", "Successfully Uploaded");
        RequestDispatcher rd = request.getRequestDispatcher("/add_product.html");
        rd.forward(request, response);
        }
     }

  }catch(Exception ex) {
     System.out.println(ex);
  }
      }else{
         request.setAttribute("Error", "Error!!");
        RequestDispatcher rd =request.getRequestDispatcher("/add_product.html");
        rd.forward(request, response);
      }
   %>


</body>
</html>