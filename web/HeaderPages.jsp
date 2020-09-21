<%-- 
    Document   : Header
    Created on : Dec 26, 2018, 3:08:18 PM
    Author     : Kavindu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- CSS -->
    <link rel="stylesheet" href="Css/HeaderA.css" />
  </head>
  <body>
      <header id="header">
        <div class="inner">
          <a href="Home.jsp" class="logo">Perfect Wedding</a>

          <div class="userbtn" id="signup">
            <form action="UserServlet" method="post">
                <%
                    if(session.getAttribute("customer")!=null || session.getAttribute("serviceprovider")!=null || 
                    session.getAttribute("admin")!=null || session.getAttribute("submitedsp")!=null ||
                    session.getAttribute("acceptedsp")!=null) {
                %>
                <input type="submit" name="logout" value="logout" id="logout">
                <a>
                    <% 
                        if(session.getAttribute("admin")!=null) {   
                        String username = (String)session.getAttribute("admin");
                        
                    %>
                    <%out.println(username);%>
                    <%
                    }
                    %>
                    <% 
                        if(session.getAttribute("customer")!=null) {   
                        String username = (String)session.getAttribute("customer");
                        
                    %>
                    <%out.println(username);%>
                    <%
                    }
                    %>
                    <% 
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
                    %>
                    <% 
                        if(session.getAttribute("acceptedsp")!=null) {   
                        String username = (String)session.getAttribute("acceptedsp");

                    %>
                        <%out.println(username);%>
                    <%
                        }
                    }
                    else{
                    %>
                    <a href="SignupDecision.jsp">Sign Up</a>
                    <a href="Login.jsp">Login</a>
                    <%
                    }
                    %>
                </a>
            </form>
          </div>
          </div>
      </header>

    <!-- jQuery first, then Tether, then Bootstrap JS. -->
    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
  </body>
</html>