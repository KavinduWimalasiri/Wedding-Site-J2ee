<%-- 
    Document   : Login
    Created on : Dec 16, 2018, 11:37:20 PM
    Author     : Kavindu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login</title>

    <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Molengo" />

    <!-- Main css -->
    <link rel="stylesheet" href="Css/Signup.css">
</head>
<body id="lbody">

    <div class="main">

        <div class="container">
            <form method="POST" class="appointment-form" id="appointment-form" action="LoginServlet">
                <h2>Login</h2>
                <div class="warningl-wrapper">
                    <div class="warningl1">
                        <% if(request.getAttribute("emptyboth")!=null){
                        out.println("<img src='Images/Warning.png' height='15' width='15'>");
                        %>
                    </div>
                    <div class="warningl2">
                        <%out.println("<img src='Images/Warning.png' height='15' width='15'>");}%>
                    </div>
                    <div class="warningl3">
                        <%if(request.getAttribute("emptyname")!=null){
                           out.println("<img src='Images/Warning.png' height='15' width='15'>");}%>
                    </div>
                    <div class="warningl4">
                        <%if(request.getAttribute("emptypassword")!=null){
                            out.println("<img src='Images/Warning.png' height='15' width='15'>");}%>
                    </div>
                </div>
                <div class="form-group-1">
                    <input type="text" name="uname"  placeholder="User Name / Company Name">
                    <input type="password" name="upword"  placeholder="Password">
                </div>
                <div class="form-submit">
                    <input type="submit" name="submit"  class="submit" value="Login" />
                </div>
            </form>
        </div>

    </div>

</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
