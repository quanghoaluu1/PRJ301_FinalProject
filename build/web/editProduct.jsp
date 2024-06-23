<%-- 
    Document   : editProduct
    Created on : Jun 20, 2024, 1:27:40 PM
    Author     : quang
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="product" class="model.product.ProductDTO" scope="request"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="MainController" method="POST" enctype="multipart/form-data">
            
            ID: <input type="text" name="prod-id" value="${product.prod_id}"><br>
            Name: <input type="text" name="prod-name" value="${product.prod_name}"><br>
            Category: <input type="text" name="category" value="${product.category}"><br>
            Price: <input type="number" step="0.01" name="price" value="${product.price}"><br>
            Stock: <input type="number" name="stock" value="${product.stock}"><br>
            Description: <textarea type="text" name="description" value="${product.description}">${product.description}</textarea><br>
            Discount: <input type="number" step="0.01" name="discount" value="${product.discount}"><br>
            Brand: <input type="text" name="brand" value="${product.brand}"><br>
            <img src="images/${product.image}" width="100" height="100" alt="Product Image">
            Image: <input type="file" name="image"><br>
            <input type="submit" name="action" value="edit product">
            
        </form>
    </body>
</html>
