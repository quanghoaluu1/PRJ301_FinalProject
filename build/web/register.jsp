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
        <title>Register Page</title>
        <link rel="icon" type="image/x-icon" href="images/spi_logo.png">
        <link rel="stylesheet" type="text/css" href="css/login.css">
    </head>
    <body>
        <div class="login-box">
            <p>Register</p>
            <form action="MainController" method="POST">
                <div class="user-box">
                    <input required="" name="user_id" type="text">
                    <label>User ID</label>
                </div>
                <div class="user-box">
                    <input required="" name="user_name" type="text">
                    <label>Name</label>
                </div>
                <div class="user-box">
                    <input required="" name="password" type="password">
                    <label>Password</label>
                </div>
                <div class="user-box">
                    <input required="" name="confirm-password" type="password">
                    <label>Confirm Password</label>
                </div>
                <%
                    String error = (String)request.getAttribute("error");
                    if(error != null){
                %>
                <p style="color: red;"><%=error%></p>
                <%
                    }
                %>
                
                <input type="hidden" name="action" value="register">
                <button>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    Submit</button>
            </form>
        </div>
    </body>
</html>
