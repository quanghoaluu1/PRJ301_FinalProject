<%-- 
    Document   : shoppingPage
    Created on : Jun 20, 2024, 5:06:30 PM
    Author     : quang
--%>

<%@page import="model.user.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="model.product.ProductDAO"%>
<%@page import="model.product.ProductDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Spidey Tech</title>
        <link rel="icon" type="image/x-icon" href="images/spi_logo.png">
        <style>
            .modal {
                display: none;
                position: fixed;
                z-index: 1;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgb(0, 0, 0);
                background-color: rgba(0, 0, 0, 0.4);
                padding-top: 60px;
            }

            .modal-content {
                background-color: #fefefe;
                margin: 5% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 80%;
            }

            .close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }

            .close:hover,
            .close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }
        </style>
        <script>
            function showModal() {
                document.getElementById("addCart").style.display = "block";
            }

            function closeModal() {
                document.getElementById("addCart").style.display = "none";
            }

            window.onclick = function (event) {
                var modal = document.getElementById("addCart");
                if (event.target === modal) {
                    modal.style.display = "none";
                }
            }

        </script>
    </head>
    <body>
        <a href="login.jsp">Login</a>

        <%
            UserDTO user = (UserDTO) session.getAttribute("login_user");
            List<ProductDTO> list = null;
            ProductDAO dao = new ProductDAO();
            if (request.getAttribute("product_list") != null) {
                list = (List<ProductDTO>) request.getAttribute("product_list");
            } else {
                list = dao.getAllProduct();
            }
            if (user != null) {
        %>
        <p>Welcome <%=user.getUser_name()%></p>
        <form action="MainController">
            <input type="submit" name="action" value="logout">
        </form>
        <%
            }
        %>
        <%
            String search = request.getParameter("search");
            String search_cate = request.getParameter("search-cate");
            String min_price = request.getParameter("min-price");
            String max_price = request.getParameter("max-price");
            String search_brand = request.getParameter("search-brand");

            if (search == null) {
                search = "";
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
        %>
        <form action="SearchProductController" method="GET">
            <input type="text" name="search" value="<%=search%>">

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
            <input type="submit" name="action" value="search">
            <input type="reset" value="reset">
        </form>
        <table border="1">
            <thead>
                <tr>

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
                        <%
                            if (user == null) {%>
                        <button onclick="showModal()">Add To Cart</button>       
                        <%
                        } else {
                        %>
                        <form action="MainController" method="POST">
                            <input type="hidden" name="user-id" value="<%=user.getUser_id()%>">
                            <input type="hidden" name="prod-id" value="<%=product.getProd_id()%>">
                            <input type="submit" name="action" value="add to cart">
                        </form>
                        <%
                            }
                        %>
                    </td>
                    <td>
                        <%
                            if (user == null) {%>
                        <button onclick="showModal()">Add To Wish List</button>       
                        <%
                        } else {
                        %>
                        <form action="MainController" method="POST">
                            <input type="hidden" name="user-id" value="<%=user.getUser_id()%>">
                            <input type="hidden" name="prod-id" value="<%=product.getProd_id()%>">
                            <input type="submit" name="action" value="add to wish list">
                        </form>
                        <%
                            }
                        %>
                    </td>
                    <%
                        }
                    %>

                </tr>
            </tbody>
        </table>
        <div id="addCart" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeModal()">&times;</span>
                <p>Please login to do this. <a href="login.jsp">Login</a></p>
            </div>
        </div>

        <%
            if (user != null) {
        %>
        <a href="cart.jsp">View Your Cart</a>
        <a href="wishList.jsp">View Your Wish List</a>
        <%
            }
        %>
    </body>
</html>
