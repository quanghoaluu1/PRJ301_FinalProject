<%-- 
    Document   : login
    Created on : Jun 15, 2024, 8:21:45 AM
    Author     : quang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="MainController" method="POST">
            User ID: <input type="text" name="user_id"><br>
            Password: <input type="password" name="password"><br>
            <input type="submit" name="action" value="login">
        </form>
        
        <a href="register.jsp">Register</a>
    </body>
</html>
