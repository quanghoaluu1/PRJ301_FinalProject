<%-- 
    Document   : addProduct
    Created on : Jun 17, 2024, 4:21:53 PM
    Author     : quang
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function alert(msg) {
                alert(msg);
            }
        </script>
    </head>
    <body>
        
        <form action="MainController" method="POST" enctype="multipart/form-data">
            
            ID: <input type="text" name="prod-id"><br>
            Name: <input type="text" name="prod-name"><br>
            Category:
            <select id="category" name="category">
                <option value="Laptop">Laptop</option>
                <option value="Phone">Phone</option>
                <option value="PC">PC</option>
                <option value="Keyboard">Keyboard</option>
                <option value="Mouse">Mouse</option>
                <option value="Headphone">Headphone</option>
            </select>
            Price: <input type="number" step="0.01" name="price"><br>
            Stock: <input type="number" name="stock"><br>
            Description: <input type="text" name="description"><br>
            Discount: <input type="number" step="0.01" name="discount"><br>
            Brand: <input type="text" name="brand"><br>
            Image: <input type="file" name="image"><br>
            <input type="submit" name="action" value="add product">
            
        </form>
        <p>${requestScope.error}</p>
        <p>${requestScope.msg}</p>
        <script>
        <c:set var="msg" value="${requestScope.msg}"/>
            alert(msg);
        </script>
    </body>
</html>
