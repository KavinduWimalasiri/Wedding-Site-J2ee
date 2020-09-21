<%-- 
    Document   : newjsp
    Created on : Apr 2, 2019, 12:37:58 AM
    Author     : Kavindu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1><form method="post" action="SampleServlet" enctype="multipart/form-data">
                    
            <input type="text" name="comment" placeholder="Say something about this image...">
            <input type="file" name="file_uploaded">   
            <input type="submit" class="submit">
        </form>
    </body>
</html>
