<%-- 
    Document   : register
    Created on : Jun 15, 2024, 9:56:48 PM
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
            ${error}
            User ID: <input type="text" name="user_id"><br>
            User Name: <input type="text" name="user_name"><br>
            Role: <input type="text" name="role"><br>
            Password <input type="password" name="password"><br>
            Confirm Password <input type="password" name="confirm-password"><br>
            <input type="submit" name="action" value="register">
        </form>
    </body>
</html>
