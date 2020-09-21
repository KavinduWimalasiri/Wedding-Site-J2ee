<%-- 
    Document   : SubmitServiceProvider
    Created on : Dec 27, 2018, 10:20:59 AM
    Author     : Kavindu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="Css/SubmitSP.css">
    </head>
    <body>
        <%@include file="HeaderPages.jsp" %>
        <div class="wrapper">
            <div class="submit-box">
                <h2>Submit Your Profile</h2>
                <form method="post" action="SubmitSPServlet" enctype="multipart/form-data">
                    
                    <input type="text" name="description" placeholder="Say us about your product  (5min - 10max words)">
                    <label class="custom-file-upload">
                        <input type="file" name="file_uploaded">
                        <a>Upload Cover Photo</a>
                    </label>
                    
                    <input type="hidden" name="uname" value=<%=session.getAttribute("serviceprovider")%>>
                    <input type="submit" class="submit">
                </form>
            </div>
            <div class="gig-box">
                <h2>Your gig</h2>
                <li>
                    <div class="frame1">
                        <div>
                            <img src="Images/meeting2.jpg" alt="Img" height="130" width="197">
                        </div>
                        <p>
                            <a href=""> <% 
                                            if(session.getAttribute("serviceprovider")!=null) {   
                                            String username = (String)session.getAttribute("serviceprovider");

                                        %>
                                        <%out.println(username);%>
                                        <%
                                            }
                                        %>
                                        <% 
                                            if(session.getAttribute("submitedsp")!=null) {   
                                            String username = (String)session.getAttribute("submitedsp");

                                        %>
                                        <%out.println(username);%>
                                        <%
                                            }
                                        %></a> 
                            Five star hotels best service and visuals.
                        </p>
                    </div>

                </li>
            </div>
        </div>
    </body>
</html>
