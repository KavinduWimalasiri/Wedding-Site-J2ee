<%-- 
    Document   : Gig
    Created on : Dec 30, 2018, 11:46:31 PM
    Author     : Kavindu
--%>

<%@page import="java.util.Base64"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="Css/Gig.css" />
        <link rel="stylesheet" href="Css/GigRatings.css" />
    </head>
    <body>
        <%@include file="HeaderPages.jsp" %>
        <%
            Connection conn = null;
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pwdb","root","");
            
            String selectbeautitianlist = "SELECT * FROM serviceprovider WHERE companyname=?";
            String spname = (String)request.getAttribute("spname"); 
            PreparedStatement stmt = conn.prepareStatement(selectbeautitianlist);
            stmt.setString(1,spname);
            ResultSet rs = stmt.executeQuery();
            
            while(rs.next()){
                String cname = rs.getString(1);
                String cuname = rs.getString(2);
                String cdiscription = rs.getString(8);
                int ratings = rs.getInt(10);
                byte[] imgData = rs.getBytes("coverimage"); // blob field 
                String encode = Base64.getEncoder().encodeToString(imgData);
                request.setAttribute("imgBase", encode);
        %>
        <div class="wrapper">
            <form method="post" action="NewOrder">
                <div class="image-wrapper">
                    <img src="data:image/jpeg;base64,${imgBase}" alt="Img" height="495" width="750">
                </div>
                <div class="details-wrapper">
                    <div id="description-wrapper"><a><%=cname%></a><p><%=cdiscription%></p></div>
                    <div class="rateing-des">
                        <p>Total Rating</p>
                    </div>
                    <fieldset class="rating">
                        <label ></label>
                        <label ></label>
                        <label ></label>
                        <label ></label>
                        <label ></label>

                    </fieldset>
                    <fieldset class="rating-colored">
                        <%
                            for(int i=1;i<=ratings;i++){
                        %>
                        <label ></label>
                        <% 
                            }
                        %>

                    </fieldset>
                    <% 
                        if(session.getAttribute("customer")!=null) {   
                        String username = (String)session.getAttribute("customer");
                        
                    %>
                    <div id="order-btn">
                        <input type="submit" name="order" value="order now">
                        <input type="hidden" name="spuname" value="<%=cuname%>">
                        <input type="hidden" name="cuname" value="<%=username%>">
                    </div>
                    
                    <%
                    }
                    else{
                        
                    %>
                    <div id="order-btn">
                        <a href="SignupServiceprovider.jsp">Signup As a Customer</a><a href="Login.jsp">Login As a Customer</a>
                    </div>
                    
                    <%
                    }
                    %>
                    
                    
                </div>
            </form>
        </div>
        <%
        }
        %>
    </body>
</html>
