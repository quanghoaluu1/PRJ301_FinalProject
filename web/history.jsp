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

        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
        <link rel="stylesheet" href="fonts/icomoon/style.css">

        <!-- Animate.css -->
        <link rel="stylesheet" href="css/animate.css">
        <!-- Icomoon Icon Fonts-->
        <link rel="stylesheet" href="css/icomoon.css">

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/jquery-ui.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/flexslider.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/aos.css">
        <link rel="stylesheet" href="css/style.css">
        <script src="js/modernizr-2.6.2.min.js"></script>
    </head>
    <body>
        <%
            UserDTO user = (UserDTO) session.getAttribute("login_user");
            OrderDAO dao = new OrderDAO();
            List<OrderHistoryDTO> history = dao.getHistoryItems(user.getUser_id());
            if (history == null || history.isEmpty()) {
        %>
        <p>No order found!!!</p>
        <%
        } else {
        %>
        <jsp:include page="header.jsp"/>

        <div class="row mb-5">
            <div class="col-md-12">
                <div class="site-blocks-table">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th class="product-remove">Order Time</th>
                                <th class="product-thumbnail">Image</th>
                                <th class="product-name">Product</th>
                                <th class="product-price">Price</th>
                                <th class="product-quantity">Quantity</th>


                            </tr>
                        </thead>
                        <tbody>
                            <%
                                double total = 0;
                                for (OrderHistoryDTO order : history) {
                                    total += order.getPrice() * order.getQuantity();
                            %>
                            <tr>
                                <td class="product-thumbnail">
                                    <h2 class="text-black"> <%=order.getOrder_time()%></h2>
                                </td>
                                <td class="product-name">
                                    <img src="images/<%=order.getImage()%>" alt="Image" class="img-fluid">
                                </td>
                                <td><%=order.getProd_name()%></td>
                                <td><%=order.getPrice()%>$</td>
                                <td><%=order.getQuantity()%></td>

                                

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
                </div>
            </div>
        </div>
        <%
            }
        %>

        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/aos.js"></script>
        <script src="js/jquery.min.js"></script>
        <!-- jQuery Easing -->
        <script src="js/jquery.easing.1.3.js"></script>
        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js"></script>
        <!-- Waypoints -->
        <script src="js/jquery.waypoints.min.js"></script>
        <!-- Carousel -->
        <script src="js/owl.carousel.min.js"></script>
        <!-- countTo -->
        <script src="js/jquery.countTo.js"></script>
        <!-- Flexslider -->
        <script src="js/jquery.flexslider-min.js"></script>
        <!-- Main -->
        <script src="js/main.js"></script>
        <script src="js/main1.js"></script>
    </body>
</html>
