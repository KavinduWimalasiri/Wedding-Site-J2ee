<%-- 
    Document   : MoreBeautitians
    Created on : Dec 29, 2018, 1:50:16 AM
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
    <title>More SP</title>

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
        <%@include file="HeaderPages.jsp" %>
        <div class="featured">
                        <%String categoryname = (String)request.getAttribute("categoryname");%>
                        <h2><%=categoryname%></h2>
                        <ul class="clearfix">
                    <%
                        Connection conn = null;
                        String selectsplist = "SELECT DISTINCT * FROM serviceprovider WHERE defvalue=2 AND category=? ORDER BY rating DESC";
                        String category = (String)request.getAttribute("category");
                        
                        Class.forName("com.mysql.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pwdb","root","");
                        PreparedStatement stmt = conn.prepareStatement(selectsplist);
                        stmt.setString(1,category);
                        ResultSet rs = stmt.executeQuery();

                        while(rs.next()){
                            String cname = rs.getString(1);
                            String cdiscription = rs.getString(8);
                            byte[] imgData = rs.getBytes("coverimage"); // blob field 
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
                    </div>


                </ul>
        </div>

    <!-- jQuery first, then Tether, then Bootstrap JS. -->
    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
  </body>
</html>