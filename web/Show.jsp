<%-- 
    Document   : Show
    Created on : Apr 2, 2019, 12:57:07 AM
    Author     : Kavindu
--%>

<%@page import="java.util.Base64"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Connection conn = null;
            
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pwdb","root","");
        %>
        <h1>Hello World!</h1>
        <ul class="clearfix">
        <%
            String selectbeautitianlist = "SELECT DISTINCT * FROM sample";
            PreparedStatement stmt1 = conn.prepareStatement(selectbeautitianlist);
            ResultSet rs1 = stmt1.executeQuery();
            
            while(rs1.next()){
                byte[] imgData = rs1.getBytes("image"); // blob field 
                String encode = Base64.getEncoder().encodeToString(imgData);
                request.setAttribute("imgBase", encode);
        %>
        <li>
          <div class="frame1">
            <div>
              <img src="data:image/jpeg;base64,${imgBase}" alt="Img" height="140" width="230">
            </div>
                <%-- <a href=""><%=cname%></a><%=cdiscription%> --%> 
          </div>
          
        </li>
        
        <%
        }
        %>
        
      </ul>
    </body>
</html>
