<%-- 
    Document   : Orders
    Created on : Jan 12, 2019, 10:14:16 PM
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
        <link rel="stylesheet" type="text/css" href="Css/OrderList.css">
        <title>Orders</title>
    </head>
    <body>
        <%@include file="HeaderPages.jsp" %>
        <div id="wrapper">
                    <h2>Orders in Process</h2>
                                        
                    <%
                        
                        String spuname = (String)session.getAttribute("acceptedsp");
                        Connection  conn=null;
                        Class.forName("com.mysql.jdbc.Driver");
                        conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/pwdb","root","");
                        String getorder="SELECT * FROM sales WHERE spname=? AND defvalue=0";
                        
                        
                        PreparedStatement stmt1=conn.prepareStatement(getorder);
                        stmt1.setString(1, spuname);
                        ResultSet rs1=stmt1.executeQuery();
                        while(rs1.next()){
                            String cname=rs1.getString(2);
                            int contactno = rs1.getInt(5);
                            String address = rs1.getString(6);
                            String otherdetails = rs1.getString(7);
        
                    %>
                    <div id="inner">
                        <div class="request-details">
                            <a href="" class="sp-username"><%=cname%></a>
                            <p class="sp-description"><%=contactno%></p>
                            <p class="sp-description"><%=address%></p>
                            <p class="sp-description"><%=otherdetails%></p>
                            
                        </div>
                        <li class="btn-wrapper" data-reactid="112">
                            <form method="post" action="CompleteOrderServlet">
                                <input type="submit" name="requestcomplete" value="request to complete the order" class="btn" id="btn-complete">
                                <input type="hidden" name="spname" value="<%=spuname%>">
                                <input type="hidden" name="cname" value="<%=cname%>">
                            </form>
                        </li>
                    </div>
                    <%
                      }
                    %>
                </div>	
    </body>
</html>
