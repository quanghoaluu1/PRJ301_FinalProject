<%-- 
    Document   : user
    Created on : Jun 15, 2024, 8:50:20 AM
    Author     : quang
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:set var="user" value="${sessionScope.login_user}"/>
        <p>Welcome ${user.user_name}</p>
        <a href="shoppingPage.jsp">Go SHopping</a>
    </body>
</html>
