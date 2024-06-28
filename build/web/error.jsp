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
        <title>ERROR Page</title>
        <link rel="icon" type="image/x-icon" href="images/spi_logo.png">
    </head>
    <body>
        <strong>Something's wrong</strong>
        <p>${requestScope.error}</p>
      
    </body>
</html>
