<%-- 
    Document   : SignupServiceprovider
    Created on : Dec 16, 2018, 11:35:24 PM
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
<body id="spbody">

    <div class="main">

        <div class="container">
            
            <form method="POST" class="appointment-form" id="appointment-form" action="SignupServiceProviderServlet">
                <h2>Sign Up As a Service Provider</h2>
            <div class="warningsp-wrapper">
                <div class="warningsp1"><%if(request.getAttribute("ecmpn")!=null){
                    out.println("<img src='Images/Warning.png' height='15' width='15'>");}%>
                </div>
                <div class="warningsp2"><%if(request.getAttribute("espun")!=null){
                    out.println("<img src='Images/Warning.png' height='15' width='15'>");}%>
                </div>
                <div class="warningsp3"><%if(request.getAttribute("espe")!=null){
                    out.println("<img src='Images/Warning.png' height='15' width='15'>");}%>
                </div>
                <div class="warningsp4"><%if(request.getAttribute("espc")!=null){
                    out.println("<img src='Images/Warning.png' height='15' width='15'>");}%>
                </div>
                <div class="warningsp5"><%if(request.getAttribute("espp")!=null){
                    out.println("<img src='Images/Warning.png' height='15' width='15'>");}%>
                </div>
                <div class="warningsp6"><%if(request.getAttribute("espp")!=null){
                    out.println("<img src='Images/Warning.png' height='15' width='15'>");}%>
                </div>
                <div class="warningsp7"><%if(request.getAttribute("wsppw")!=null){
                    out.println("<img src='Images/Warning.png' height='15' width='15'>");}%>
                </div>
                
            </div>
                <div class="form-group-1">
                    <input type="text" name="spcname"  placeholder="Company Name">
                    <input type="text" name="spuname"  placeholder="Username">
                    <input type="spemail" name="spemail"  placeholder="Email">                    
                    <div class="select-list">
                        <select  id="course_type" name="spcategory" >
                            <option id="option" value="category">category</option>
                            <option id="option" value="beautician">Beautician</option>
                            <option id="option" value="hotel">Hotel</option>
                            <option id="option" value="photographer">Photographer</option>
                            <option id="option" value="jewellry">Jewelry</option>
                            <option id="option" value="cars">Cars</option>
                        </select>
                    </div>
                    <input type="password" name="sppword"  placeholder="Password">
                    <input type="password" name="spcpword"  placeholder="Confirm Password">
                </div>
                <div class="form-submit">
                    <input type="submit" name="submit"  class="submit" value="Sign UP" >
                </div>
            </form>
        </div>

    </div>

</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
