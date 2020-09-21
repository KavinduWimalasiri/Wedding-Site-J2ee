<%-- 
    Document   : SignupCustommer
    Created on : Dec 16, 2018, 11:36:42 PM
    Author     : Kavindu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up</title>

    <!-- Font Icon -->
    <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Molengo" />

    <!-- Main css -->
    <link rel="stylesheet" href="Css/Signup.css">
</head>
<body id="cbody">

    <div class="main">

        <div class="container">
            <form method="POST" class="appointment-form" id="appointment-form" action="SignupCustomerServlet">
                <h2>Sign Up As a Customer</h2>
                <div class="warningc-wrapper">
                    <div class="warningc1"><%if(request.getAttribute("ecn")!=null){
                        out.println("<img src='Images/Warning.png' height='15' width='15'>");}%>
                    </div>
                    <div class="warningc2"><%if(request.getAttribute("ecun")!=null){
                        out.println("<img src='Images/Warning.png' height='15' width='15'>");}%>
                    </div>
                    <div class="warningc3"><%if(request.getAttribute("ece")!=null){
                        out.println("<img src='Images/Warning.png' height='15' width='15'>");}%>
                    </div>
                    <div class="warningc4"><%if(request.getAttribute("ecpw")!=null){
                        out.println("<img src='Images/Warning.png' height='15' width='15'>");}%>
                    </div>
                    <div class="warningc5"><%if(request.getAttribute("ecrpw")!=null){
                        out.println("<img src='Images/Warning.png' height='15' width='15'>");}%>
                        <%if(request.getAttribute("wpw")!=null){
                        out.println("<img src='Images/Warning.png' height='15' width='15'>");}%>
                    </div>
                
                </div>
                <div class="form-group-1">
                    <input type="text" name="cname"  placeholder="Name">
                    <input type="text" name="cuname"  placeholder="User Name">
                    <input type="cemail" name="cemail"  placeholder="Email">
                    <input type="password" name="cpword"  placeholder="Password">
                    <input type="password" name="ccpword"  placeholder="Confirm Password">
                </div>
                <div class="form-submit">
                    <input type="submit" name="submit"  class="submit" value="Sign UP" />
                </div>
            </form>
        </div>

    </div>

</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
