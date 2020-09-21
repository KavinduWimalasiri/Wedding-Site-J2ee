<%-- 
    Document   : Body
    Created on : Dec 16, 2018, 12:38:57 PM
    Author     : Kavindu
--%>
<%@page import="java.util.Base64"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
    <link rel="stylesheet" href="Css/Body.css" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Staatliches" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Staatliches" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Oswald" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Staatliches" rel="stylesheet">
  </head>
  <body>
    <nav class="navbar navbar-toggleable-md navbar-light navbar-custom fixed bg-faded">
  <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="navbar-brand" href="#beauticians" id="navfont">BEAUTICIANS <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="navbar-brand" href="#hotels">HOTELS <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="navbar-brand" href="#photographers">PHOTOGRAPHERS <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="navbar-brand" href="#jewellery">JEWELLERY <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="navbar-brand" href="#cars">CARS <span class="sr-only">(current)</span></a>
      </li>
    </ul>
  </div>
</nav>

    <div class="featured" id="beauticians">
      <%
            Connection conn = null;
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pwdb","root","");
      %>
      <h2>Beauticians</h2>
      <ul class="clearfix">
        <%
            String selectbeautitianlist = "SELECT DISTINCT * FROM serviceprovider WHERE defvalue=2 AND category='beautician' ORDER BY rating DESC LIMIT 4";
            PreparedStatement stmt1 = conn.prepareStatement(selectbeautitianlist);
            ResultSet rs1 = stmt1.executeQuery();
            
            while(rs1.next()){
                String cname = rs1.getString(1);
                String cdiscription = rs1.getString(8);
                byte[] imgData = rs1.getBytes("coverimage"); // blob field 
                String encode = Base64.getEncoder().encodeToString(imgData);
                request.setAttribute("imgBase", encode);
        %>
        <li>
          <div class="frame1">
            <div>
              <img src="data:image/jpeg;base64,${imgBase}" alt="Img" height="140" width="230">
            </div>
            <form method="post" action="ViewServiceProvider">
                <input type="submit" name="submit" value="<%=cname%>" id="submit-btn">
                <p><%=cdiscription%></p>
            </form>
                <%-- <a href=""><%=cname%></a><%=cdiscription%> --%> 
          </div>
          
        </li>
        
        <%
        }
        %>
        
      </ul>
      <div class="catbtn">
          <form method="post" action="ViewServiceProvider">
              <div class="more">
              <input type="submit" value="More Beauticians" id="more-btn">
              <input type="hidden" name="category" value="beautician">
              <input type="hidden" name="categoryname" value="beauticians">
              </div>
          </form>
      </div>
    </div>
    <div class="featured" id="hotels">
      <h2>Hotels</h2>
      <ul class="clearfix">
        <%
            String selectholellist = "SELECT DISTINCT * FROM serviceprovider WHERE defvalue=2 AND category='hotel' ORDER BY rating DESC LIMIT 4";
            PreparedStatement stmt2 = conn.prepareStatement(selectholellist);
            ResultSet rs2 = stmt2.executeQuery();
            
            while(rs2.next()){
                String cname = rs2.getString(1);
                String cdiscription = rs2.getString(8);
                byte[] imgData = rs2.getBytes("coverimage"); // blob field 
                String encode = Base64.getEncoder().encodeToString(imgData);
                request.setAttribute("imgBase", encode);
        %>
        <li>
          <div class="frame1">
            <div>
              <img src="data:image/jpeg;base64,${imgBase}" alt="Img" height="140" width="230">
            </div>
            <form method="post" action="ViewServiceProvider">
                <input type="submit" name="submit" value="<%=cname%>" id="submit-btn">
                <p><%=cdiscription%></p>
            </form>
          </div>
          
        </li>
        <%
        }
        %>
        
      </ul>
      <div class="catbtn">
          <form method="post" action="ViewServiceProvider">
              <div class="more">
              <input type="submit" value="More Hotels" id="more-btn">
              <input type="hidden" name="category" value="hotel">
              <input type="hidden" name="categoryname" value="hotels">
              </div>
          </form>
      </div>
    </div>
    <div class="featured" id="photographers">
      <h2>Photographers</h2>
      <ul class="clearfix">
        <%
            String selectphotographerlist = "SELECT DISTINCT * FROM serviceprovider WHERE defvalue=2 AND category='photographer' ORDER BY rating DESC LIMIT 4";
            PreparedStatement stmt3 = conn.prepareStatement(selectphotographerlist);
            ResultSet rs3 = stmt3.executeQuery();
            
            while(rs3.next()){
                String cname = rs3.getString(1);
                String cdiscription = rs3.getString(8);
                byte[] imgData = rs3.getBytes("coverimage"); // blob field 
                String encode = Base64.getEncoder().encodeToString(imgData);
                request.setAttribute("imgBase", encode);
        %>
        <li>
          <div class="frame1">
            <div>
              <img src="data:image/jpeg;base64,${imgBase}" alt="Img" height="140" width="230">
            </div>
            <form method="post" action="ViewServiceProvider">
                <input type="submit" name="submit" value="<%=cname%>" id="submit-btn">
                <p><%=cdiscription%></p>
            </form>
          </div>
          
        </li>
        <%
        }
        %>
        
      </ul>
      <div class="catbtn">
          <form method="post" action="ViewServiceProvider">
              <div class="more">
              <input type="submit" value="More Photographers" id="more-btn" >
              <input type="hidden" name="category" value="photographer">
              <input type="hidden" name="categoryname" value="photographers">
              </div>
          </form>
      </div>
    </div>
    <div class="featured" id="jewellery">
      <h2>Jewellery</h2>
      <ul class="clearfix">
        <%
            String selectjewelrylist = "SELECT DISTINCT * FROM serviceprovider WHERE defvalue=2 AND category='jewellery' ORDER BY rating DESC LIMIT 4";
            PreparedStatement stmt4 = conn.prepareStatement(selectjewelrylist);
            ResultSet rs4 = stmt4.executeQuery();
            
            while(rs4.next()){
                String cname = rs4.getString(1);
                String cdiscription = rs4.getString(8);
                byte[] imgData = rs4.getBytes("coverimage"); // blob field 
                String encode = Base64.getEncoder().encodeToString(imgData);
                request.setAttribute("imgBase", encode);
        %>
        <li>
          <div class="frame1">
            <div>
              <img src="data:image/jpeg;base64,${imgBase}" alt="Img" height="140" width="230">
            </div>
            <form method="post" action="ViewServiceProvider">
                <input type="submit" name="submit" value="<%=cname%>" id="submit-btn">
                <p><%=cdiscription%></p>
            </form>
          </div>
          
        </li>
        <%
        }
        %>
        
      </ul>
      <div class="catbtn">
          <form method="post" action="ViewServiceProvider">
              <div class="more">
              <input type="submit" value="More Jewellery" id="more-btn">
              <input type="hidden" name="category" value="jewellery">
              <input type="hidden" name="categoryname" value="jewellery">
              </div>
          </form>
      </div>
    </div>
    <div class="featured" id="cars">
      <h2>Cars</h2>
      <ul class="clearfix">
        <%
            String selectcarlist = "SELECT DISTINCT * FROM serviceprovider WHERE defvalue=2 AND category='cars' ORDER BY rating DESC LIMIT 4";
            PreparedStatement stmt5 = conn.prepareStatement(selectcarlist);
            ResultSet rs5 = stmt5.executeQuery();
            
            while(rs5.next()){
                String cname = rs5.getString(1);
                String cdiscription = rs5.getString(8);
                byte[] imgData = rs5.getBytes("coverimage"); // blob field 
                String encode = Base64.getEncoder().encodeToString(imgData);
                request.setAttribute("imgBase", encode);
        %>
        <li>
          <div class="frame1">
            <div>
              <img src="data:image/jpeg;base64,${imgBase}" alt="Img" height="140" width="230">
            </div>
            <form method="post" action="ViewServiceProvider">
                <input type="submit" name="submit" value="<%=cname%>" id="submit-btn">
                <p><%=cdiscription%></p>
            </form>
          </div>
          
        </li>
        <%
        }
        %>
        
      </ul>
      <div class="catbtn">
          <form method="post" action="ViewServiceProvider">
              <div class="more">
              <input type="submit" value="More Cars" id="more-btn">
              <input type="hidden" name="category" value="cars">
              <input type="hidden" name="categoryname" value="cars">
              </div>
          </form>
      </div>
    </div>

    <!-- jQuery first, then Tether, then Bootstrap JS. -->
    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
  </body>
</html>
