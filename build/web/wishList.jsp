<%-- 
    Document   : wishList
    Created on : Jun 22, 2024, 8:01:17 AM
    Author     : quang
--%>

<%@page import="model.product.ProductDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="model.product.ProductDTO"%>
<%@page import="model.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Wish List</title>
         <link rel="icon" type="image/x-icon" href="images/spi_logo.png">
    </head>
    <body>
        <%
            UserDTO user = (UserDTO)session.getAttribute("login_user");
            ProductDAO dao = new ProductDAO();
            List<ProductDTO> wish_list = dao.getWishList(user.getUser_id());
            if(wish_list.isEmpty() || wish_list == null){
        %>
        <p><%=user.getUser_name()%>'s Wish List is empty</p>
        <%
            }else{
        %>
        <table border="1">
            <thead>
                <tr>
                    <td>Image</td>
                    <td>Product Name</td>
                    <td>Price</td>
                    <td></td>
                </tr>
            </thead>
            <tbody>
                <%
                    
                    
                    for(ProductDTO product : wish_list){
                %>
                <tr>
                    <td><img src="images/<%=product.getImage()%>" alt="Product Image" width="100" height="100"></td>
                    <td><%=product.getProd_name()%></td>
                    <td><%=product.getNewPrice()%></td>
                    <td>
                        <form action="MainController" method="POST">
                            <input type="hidden" name="user-id" value="<%=user.getUser_id()%>">
                            <input type="hidden" name="prod-id" value="<%=product.getProd_id()%>">
                            <input type="submit" name="action" value="remove wish list">
                        </form>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
                <%
}
                %>
    </body>
</html>
