<%-- 
    Document   : error
    Created on : Jun 15, 2024, 8:35:07 AM
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
        <strong>Something's wrong</strong>
        <p>${requestScope.error}</p>
    </body>
</html>
