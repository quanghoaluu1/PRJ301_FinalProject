<%-- 
    Document   : staff
    Created on : Jun 15, 2024, 8:47:34 AM
    Author     : quang
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff Page</title>
        <link rel="icon" type="image/x-icon" href="images/spi_logo.png">
    </head>
    <body>
        <c:set var="user" value="${sessionScope.login_user}"/>
        <p>Welcome ${user.user_name}</p>
        <form action="MainController">
            <input type="submit" name="action" value="logout">
        </form>
       
            <a href="productManager.jsp">Product Manager</a>
        
            <c:if test="${user.role == 'manager'}">
        <a href="userManager.jsp">User Manager</a>
            </c:if>
         
    </body>
</html>
