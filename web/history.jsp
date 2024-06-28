<%-- 
    Document   : history
    Created on : Jun 24, 2024, 12:17:33 PM
    Author     : quang
--%>

<%@page import="model.user.UserDTO"%>
<%@page import="model.order.OrderDAO"%>
<%@page import="model.order.OrderHistoryDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>History Orders</title>
        <link rel="icon" type="image/x-icon" href="images/spi_logo.png">
    </head>
    <body>
        <%
            UserDTO user = (UserDTO)session.getAttribute("login_user");
            OrderDAO dao = new OrderDAO();
            List<OrderHistoryDTO> history = dao.getHistoryItems(user.getUser_id());
            if(history == null || history.isEmpty()){
 %>
 <p>No order found!!!</p>
 <%    
}else{
 %>
 <table border="1">
     <thead>
         <tr>
             <td>Order Time</td>
             <td>Image</td>
             <td>Product Name</td>
             <td>Quantity</td>
             <td>Price</td>
         </tr>
        
     </thead>
      <tbody>
      <%    double total = 0;
          for(OrderHistoryDTO order: history){
              total += order.getPrice() * order.getQuantity();

              %>
                <tr>
                    <td><%=order.getOrder_time()%></td>
                    <td><img src="images/<%=order.getImage()%>" width="100" height="100" alt="Product Image"></td>
                    <td><%=order.getProd_name()%></td>
                    <td><%=order.getQuantity()%></td>
                    <td><%=order.getPrice()%></td>
                </tr>
                <%
                    }
                %>
                <tr>
                    <td colspan="4">Total spent</td>
                    <td><%=total%></td>
                </tr>
            </tbody>
 </table>
                    <%
                    }
                    %>
    </body>
</html>
