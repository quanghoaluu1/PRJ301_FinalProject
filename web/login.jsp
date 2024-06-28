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
        <title>Login Page</title>
        <link rel="icon" type="image/x-icon" href="images/spi_logo.png">
        <link rel="stylesheet" type="text/css" href="css/login.css">
    </head>
    <body>
        <div class="login-box">
        <form action="MainController" method="POST">
            <p>Login</p>
            <div class="user-box">
                <input required="" name="user_id" type="text">
                <label>User ID</label>
            </div>
            <div class="user-box">
                <input required="" name="password" type="password">
                <label>Password</label>
            </div>
            <p style="color: red;">${error}</p>
            <input type="hidden" name="action" value="login">
                <button>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    Login
                </button>
        </form>


        <p>Don't have an account? <a href="register.jsp" class="a2">Sign up!</a></p>
        </div>
    </body>
</html>
