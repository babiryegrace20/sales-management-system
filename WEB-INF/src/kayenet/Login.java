package kayenet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


public class Login extends HttpServlet{
  private static MessageDigest digester;

  static{
      try {
          digester = MessageDigest.getInstance("MD5");
      }
      catch (NoSuchAlgorithmException e) {
          e.printStackTrace();
      }

  }

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
      res.setContentType("text/html;charset=UTF-8");

    String username = req.getParameter("username");
    String password = req.getParameter("password");

    digester.update(password.getBytes());
    byte[] s_pass = digester.digest();
    String secure_pass = new String(s_pass);

    PrintWriter writer = res.getWriter();

      //include css
      writer.println("<header><link rel='stylesheet' href='vendor/bootstrap/css/bootstrap.min.css'>");
      writer.println("<script src='vendor/jquery/jquery.min.js'></script>");
      writer.println("<script src='vendor/bootstrap/js/bootstrap.bundle.min.js'></script>");
      writer.println("</header>");
    
      if("Administrator".equals(username)){
          if(checkAdmin(username,secure_pass)){ 
            HttpSession session = req.getSession();
            session.setAttribute("username",username);
            res.sendRedirect("admin.jsp");

          }else{
            writer.println("<span><p class='alert-danger'>Your Password is incorrect.</p></span>");
            writer.println("<meta http-equiv='refresh' content='2;url=index.jsp' />");
          }

      } else{

            if(checkSalesP(username,password)){ 
            HttpSession session = req.getSession();
            session.setAttribute("username",username);
            res.sendRedirect("salesp.jsp");

            }else{
              writer.println("<span><p class='alert-danger'>Either your username: ["+username+"] or Password is incorrect.</p></span>");
              writer.println("<meta http-equiv='refresh' content='2;url=index.jsp' />");
            }

      }

    writer.close();

  }

  public static boolean checkAdmin(String username, String secure_pass) {
      boolean valid =false;
      try{

        //loading drivers for mysql
        Class.forName("com.mysql.jdbc.Driver");

        //creating connection with the database
        String url = "jdbc:mysql://localhost:3306/kayenet_db"; 
        String user = "root"; 
        String pass =""; 

        Connection  con=DriverManager.getConnection(url,user,pass);

        String sql = "select * from administrator where username=? and password=?";
      	PreparedStatement ps =con.prepareStatement(sql);
         ps.setString(1, username);
         ps.setString(2,secure_pass);

         ResultSet rs =ps.executeQuery();
         valid = rs.next();

        rs.close();
        ps.close();
        con.close();
        
      }catch(Exception e){
          e.printStackTrace();
          //writer.println("exception error: " + e);
      }
    return valid;         
  } 


  public static boolean checkSalesP(String username, String password) {
      boolean valid =false;
      try{

        //loading drivers for mysql
        Class.forName("com.mysql.jdbc.Driver");

        //creating connection with the database
        String url = "jdbc:mysql://localhost:3306/kayenet_db"; 
        String user = "root"; 
        String pass =""; 

        Connection  con=DriverManager.getConnection(url,user,pass);

        String sql = "select * from sales_person where username=? and password=?";
        PreparedStatement ps =con.prepareStatement(sql);
         ps.setString(1, username);
         ps.setString(2, password);

         ResultSet rs =ps.executeQuery();
         valid = rs.next();

        rs.close();
        ps.close();
        con.close();
        
      }catch(Exception e){
          e.printStackTrace();
          //writer.println("exception error: " + e);
      }
    return valid;         
  }   
  

}


/*
try{

        //loading drivers for mysql
        Class.forName("com.mysql.jdbc.Driver");

        //creating connection with the database
        String url = "jdbc:mysql://localhost:3306/kayenet_db"; 
        String user = "root"; 
        String pass =""; 

        Connection  con=DriverManager.getConnection(url,user,pass);

        String sql = "INSERT INTO administrator (username, password) VALUES ('"+username+"','" +secure_pass+"')";

        Statement stmt = con.createStatement();
        int num_rows = stmt.executeUpdate(sql); 

        if(num_rows>0){
          writer.println("successfully added to DB");
        } else {
          writer.println("error");
        }

        stmt.close();
        con.close();
        
      }catch(Exception e){
          e.printStackTrace();
          writer.println("exception error: " + e);
      }
*/