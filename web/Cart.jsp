<%-- 
    Document   : Cart
    Created on : Jan 7, 2019, 2:42:25 PM
    Author     : Kavindu
--%>

<%@page import="java.util.Base64"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="Css/RequestList.css">
                <link rel="stylesheet" type="text/css" href="Css/Cart.css">
                <link rel="stylesheet" href="Css/Ratings.css" />
		<title></title>
	</head>
	<body>
            <%@include file="HeaderPages.jsp" %>
		<div id="wrapper">
                    <h2>Orders in Process</h2>
                    <%
                        String cuname = (String)session.getAttribute("customer");
                        Connection  conn=null;
                        Class.forName("com.mysql.jdbc.Driver");
                        conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/pwdb","root","");%>
                                        
                    <%
                        String getongoingorder="SELECT spname FROM sales WHERE cname=? AND defvalue=0";
                        String getongoinggig="SELECT * FROM serviceprovider WHERE username=? AND defvalue>=2";
                        
                        
                        PreparedStatement stmt1=conn.prepareStatement(getongoingorder);
                        stmt1.setString(1, cuname);
                        ResultSet rs1=stmt1.executeQuery();
                        while(rs1.next()){
                            String spname=rs1.getString(1);
                            PreparedStatement stmt2=conn.prepareStatement(getongoinggig);
                            stmt2.setString(1, spname);
                            ResultSet rs2=stmt2.executeQuery();
                            while(rs2.next()){
                                String cname = rs2.getString(1);
                                String spdetails = rs2.getString(8);
                                byte[] imgData = rs2.getBytes("coverimage"); // blob field 
                                String encode = Base64.getEncoder().encodeToString(imgData);
                                request.setAttribute("imgBase", encode);
                                
                    %>
                    <div id="inner">
		    	<div class="gig-image-wrapper" data-reactid="95">
                            <img src="data:image/jpeg;base64,${imgBase}" alt="Img" height="130" width="197">
                        </div>
                        <div class="request-details">
                            <a href="" class="sp-username"><%=cname%></a>
                            <p class="sp-description"><%=spdetails%></p>
                            
                        </div>
                            <p class="order-process">Order in Process</p>
                    </div>
                    <%
                            }
                      }
                    %>
                    <h2>Requested to Complete</h2>
                    <%
                        String getrequestedorder="SELECT spname FROM sales WHERE cname=? AND defvalue=1";
                        String getrequestedgig="SELECT * FROM serviceprovider WHERE username=? AND defvalue>=2";
                        
                        
                        PreparedStatement stmt3=conn.prepareStatement(getrequestedorder);
                        stmt3.setString(1, cuname);
                        ResultSet rs3=stmt3.executeQuery();
                        while(rs3.next()){
                            String spname=rs3.getString(1);
                            PreparedStatement stmt4=conn.prepareStatement(getrequestedgig);
                            stmt4.setString(1, spname);
                            ResultSet rs4=stmt4.executeQuery();
                            while(rs4.next()){
                                String cname = rs4.getString(1);
                                int oldratings = rs4.getInt(10);
                                int attempts = rs4.getInt(11);
                                byte[] imgData = rs4.getBytes("coverimage"); // blob field 
                                String encode = Base64.getEncoder().encodeToString(imgData);
                                request.setAttribute("imgBase", encode);
                                
                    %>
                    <div id="inner">
		    	<div class="gig-image-wrapper" data-reactid="95">
                            <img src="data:image/jpeg;base64,${imgBase}" alt="Img" height="130" width="197">
                        </div>
                        <div class="request-details">
                            <a href="" class="sp-username"><%=cname%></a>
                            <p class="sp-rate">Rate The Order</p>
                        </div>
                        <li class="accept-btn-wrapper" data-reactid="112">
                            <form method="post" action="CompleteOrderServlet">
                                <fieldset class="rating">
                                    <input type="radio" id="star5" name="rating" value="5" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>
                                    <input type="radio" id="star4" name="rating" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
                                    <input type="radio" id="star3" name="rating" value="3" /><label class = "full" for="star3" title="Meh - 3 stars"></label>
                                    <input type="radio" id="star2" name="rating" value="2" /><label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
                                    <input type="radio" id="star1" name="rating" value="1" /><label class = "full" for="star1" title="Sucks big time - 1 star"></label>
                                    
                                    <input type="submit" name="confirmcomplete" value="mark the order as completed" class="btn" id="btn-confirm">
                                    <input type="hidden" name="spname" value="<%=spname%>">
                                    <input type="hidden" name="cname" value="<%=cuname%>">
                                    <input type="hidden" name="oldratings" value="<%=oldratings%>">
                                    <input type="hidden" name="attempts" value="<%=attempts%>">
                                </fieldset>
                                
                            </form>
                        </li>
                    </div>
                    <%
                            }
                      }
                    %>
                </div>	
	</body>
</html>
