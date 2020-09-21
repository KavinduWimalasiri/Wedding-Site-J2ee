<%-- 
    Document   : RequestList
    Created on : Dec 26, 2018, 2:53:56 PM
    Author     : Kavindu
--%>

<%@page import="java.util.Base64"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="Css/RequestList.css">
		<title></title>
	</head>
	<body>
		<div id="wrapper">
                    <%
                        Connection conn = null;
                        String selectsplist = "SELECT * FROM serviceprovider WHERE defvalue=1";
                        Class.forName("com.mysql.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pwdb","root","");
                        PreparedStatement stmt = conn.prepareStatement(selectsplist);
                        ResultSet rs = stmt.executeQuery();

                        while(rs.next()){
                            String cname = rs.getString(1);
                            String category = rs.getString(5);
                            String cdetails = rs.getString(8);
                            byte[] imgData = rs.getBytes("coverimage"); // blob field 
                            String encode = Base64.getEncoder().encodeToString(imgData);
                            request.setAttribute("imgBase", encode);
                    %>
		    <div id="inner">
		    	<div class="gig-image-wrapper" data-reactid="95">
                            <img src="data:image/jpeg;base64,${imgBase}" alt="Img" height="130" width="197">
                        </div>
                        <div class="request-details">
                            <a href="" class="sp-username"><%=cname%></a>
                            <p class="sp-description"><%=cdetails%></p>
                            <p class="sp-description"><%=category%></p>
                        </div>
                        <li class="btn-wrapper" data-reactid="112">
                            <form method="post" action="RequestServlet">
                                <input type="submit" name="accept" value="accept" class="btn" id="btn-accept">
                                <input type="submit" name="reject" value="reject" class="btn" id="btn-reject">
                                <input type="hidden" name="companyname" value="<%=cname%>">
                            </form>
                        </li>
                    </div>
                    <%
                    }
                    %>
                    
                    
                    
                </div>	
	</body>
</html>