<%-- 
    Document   : productManager
    Created on : Jun 17, 2024, 4:21:26 PM
    Author     : quang
--%>

<%@page import="model.product.ProductDAO"%>
<%@page import="java.util.List"%>
<%@page import="model.product.ProductDTO"%>
<%@page import="model.product.ProductDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>Product Manager</title>
        <link rel="icon" type="image/x-icon" href="images/spi_logo.png">
    </head>
    <body>
        <%
            String search_name = request.getParameter("search-name");
            String search_cate = request.getParameter("search-cate");
            String min_price = request.getParameter("min-price");
            String max_price = request.getParameter("max-price");
            String search_brand = request.getParameter("search-brand");
            String sort = request.getParameter("sort");

            if (search_name == null) {
                search_name = "";
            }
            if (search_cate == null) {
                search_cate = "";
            }
            if (min_price == null) {
                min_price = "";
            }
            if (max_price == null) {
                max_price = "";
            }
            if (search_brand == null) {
                search_brand = "";
            }
            if (sort == null){
                sort = "";
            }
        %>
        <form action="SearchProductController" method="GET">
            <input type="text" name="search-name" value="<%=search_name%>">

            <select name="search-cate">
                <option value="">Select Category</option>
                <option value="Laptop" <%= "Laptop".equals(search_cate) ? "selected" : ""%>>Laptop</option>
                <option value="Phone" <%= "Phone".equals(search_cate) ? "selected" : ""%>>Phone</option>
                <option value="PC" <%= "PC".equals(search_cate) ? "selected" : ""%>>PC</option>
                <option value="Keyboard" <%= "Keyboard".equals(search_cate) ? "selected" : ""%>>Keyboard</option>
                <option value="Mouse" <%= "Mouse".equals(search_cate) ? "selected" : ""%>>Mouse</option>
                <option value="Headphone" <%= "Headphone".equals(search_cate) ? "selected" : ""%>>Headphone</option>
            </select>

            <select name="search-brand">
                <option value="">Select Brand</option>
                <option value="Acer" <%= "Acer".equals(search_brand) ? "selected" : ""%>>Acer</option>
                <option value="Asus" <%= "Asus".equals(search_brand) ? "selected" : ""%>>Asus</option>
                <option value="Apple" <%= "Apple".equals(search_brand) ? "selected" : ""%>>Apple</option>
                <option value="others">Others</option>
            </select>

            <input type="number" step="0.01" name="min-price" value="<%= min_price%>" placeholder="Min Price" >   
            <input type="number" step="0.01" name="max-price" value="<%= max_price%>" placeholder="Max Price" >
            
            <select name="sort">
                <option value="">Sort By</option>
                <option value="name-asc" <%= "name-asc".equals(sort) ? "selected" : ""%>>Name A-Z</option>
                <option value="name-desc" <%= "name-desc".equals(sort) ? "selected" : ""%>>Name Z-A</option>
                <option value="price-asc" <%= "price-asc".equals(sort) ? "selected" : ""%>>Price Ascending</option>
                <option value="price-desc" <%= "price-desc".equals(sort) ? "selected" : ""%>>Price Descending</option>
            </select>
            <input type="submit" name="get" value="search">
            <input type="reset" value="reset">
        </form>
        <a href="addProduct.jsp">Add Product</a>
        <%
            List<ProductDTO> list = null;
            ProductDAO dao = new ProductDAO();
            if (request.getAttribute("product_list") != null) {
                list = (List<ProductDTO>) request.getAttribute("product_list");
            } else {
                list = dao.getAllProduct();
            }
            
        %>
        

        <table border="1">
            <thead>
                <tr>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Category</th>
                    <th>Price</th>
                    <th>New Price</th>
                    <th>Stock</th>
                    <th>Description</th>
                    <th>Discount</th>
                    <th>Brand</th>
                    <th>Image</th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>

            <tbody>
                <%                            for (ProductDTO product : list) {


                %>
                <tr>

                    <td><%= product.getProd_id()%></td>
                    <td><%= product.getProd_name()%></td>
                    <td><%= product.getCategory()%></td>
                    <td><%= product.getPrice()%></td>
                    <td><%= product.getNewPrice()%></td>
                    <td><%= product.getStock()%></td>
                    <td><%= product.getDescription()%></td>
                    <td><%= product.getDiscount()%></td>
                    <td><%= product.getBrand()%></td>
                    <td><img src="images/<%=product.getImage()%>" width="100" height="100" alt="Product Image"></td>
                    <td>
                        <form action="MainController" method="POST">
                            <input type="hidden" name="prod-id" value="<%=product.getProd_id()%>">
                            <input type="hidden" name="action" value="delete product">
                            <input type="submit" value="Delete">
                        </form>
                    </td>
                    <td>
                        <form action="MainController" method="POST">
                            <input type="hidden" name="prod-id" value="<%=product.getProd_id()%>">
                            <input type="submit" name="action" value="edit product form">
                        </form>
                    </td>
                    <%
                        }
                    %>
                </tr>
            </tbody>
        </table>
                <a href="staff.jsp">Back to staff page</a>
    </body>
</html>
