<%-- 
    Document   : SubmitOrder
    Created on : Jan 13, 2019, 12:54:37 AM
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
<body id="obody">

    <div class="main">

        <div class="container">
            <form method="POST" class="appointment-form" id="appointment-form" action="PlaceOrderServlet">
                <h2>Submit Order Details</h2>
                <div class="form-group-1">
                    <input type="text" name="contactno" placeholder="Contact No">
                    <input type="text" name="address" placeholder="Address">
                    <input type="text" name="otherdetails" placeholder="Other Details">
                    <input type="hidden" name="cname" value="<%= request.getAttribute("cname") %>">
                    <input type="hidden" name="spname" value="<%= request.getAttribute("spname") %>">
                </div>
                <div class="form-submit">
                    <input type="submit" name="submit"  class="submit" value="Process The Order" />
                </div>
            </form>
        </div>

    </div>

</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
