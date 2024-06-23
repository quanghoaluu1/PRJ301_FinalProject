<%-- 
    Document   : cart
    Created on : Jun 20, 2024, 6:11:24 PM
    Author     : quang
--%>

<%@page import="model.cart.CartDTO"%>
<%@page import="java.math.RoundingMode"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="model.product.ProductDTO"%>
<%@page import="model.product.ProductDAO"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="model.cart.CartDAO"%>
<%@page import="java.util.List"%>
<%@page import="model.cart.CartDAO"%>
<%@page import="model.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Spidey Tech</title>
        <link rel="icon" type="image/x-icon" href="images/spi_logo.png">
    </head>
    <body>
        <%
                UserDTO user = (UserDTO) session.getAttribute("login_user");
                CartDAO cartDAO = new CartDAO();
                List<CartDTO> items = cartDAO.getItems(user.getUser_id());
                
                
                if(user == null ){ %>
        <p>Your's cart is empty</p>
        <%
            }else if(items == null || items.isEmpty()){
%>
<p><%= user.getUser_name()%>'s cart is empty</p>
<%
    }else{
%>
        <table border="1">
            <thead>
                <tr>
                    <td>Image</td>
                    <td>Name</td>                   
                    <td>Price</td>
                    <td>Quantity</td>
                    <td>Total</td>
                    <td>Remove</td>
                </tr>
            </thead>
            <tbody>
                <%
                    ProductDAO dao = new ProductDAO();
                    double total = 0;
                    for(CartDTO item : cartDAO.getItems(user.getUser_id()) ){
                        String prod_id = item.getProd_id();        
                        int quantity = item.getQuantity();
                        ProductDTO product = dao.getProductByID(prod_id);
                        System.out.println(item.getProd_id());
                        System.out.println(item.getQuantity());
                    if(product != null){
                        double sub_total = product.getNewPrice() * quantity;
                        BigDecimal sub_total_rounded = new BigDecimal(sub_total).setScale(2, RoundingMode.HALF_UP);
                        sub_total = sub_total_rounded.doubleValue();
                        total += sub_total;
                %>
                <tr>
            <td><img src="images/<%=product.getImage()%>" width="100" height="100" alt="Product Image"></td>
            <td><%=product.getProd_name()%></td>
            <td><%=product.getNewPrice()%>$</td>
            <td>
                <form action="MainController" method="POST">
                    <input type="number" name="quantity" value="<%=quantity%>">
                <input type="hidden" name="user-id" value="<%=user.getUser_id()%>">
                <input type="hidden" name="prod-id" value="<%=prod_id%>">
                    <input type="submit" name="action" value="update">
                </form>
            </td>
            <td><%=sub_total%>$</td>
            <td>
                <form action="MainController" method="POST">
                <input type="hidden" name="prod-id" value="<%=prod_id%>">
                <input type="submit" name="action" value="remove">
                </form>
            </td>
            </tr>
            <%
                }}
            %>
            <tr>
                <td colspan="4">Grand Total</td>
                <td><%=total%>$</td>
            </tr>
            </tbody>
        </table>
<%
    }
%>
<a href="shoppingPage.jsp">Back tO Shopping Page</a>
    </body>
</html>
