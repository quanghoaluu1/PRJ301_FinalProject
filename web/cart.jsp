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
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <%
            UserDTO user = (UserDTO) session.getAttribute("login_user");
        %>
        <c:set var="user" value="${sessionScope.login_user}"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=user.getUser_name()%>'s Cart</title>
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

            CartDAO cartDAO = new CartDAO();
            List<CartDTO> items = cartDAO.getItems(user.getUser_id());
            if (items == null || items.isEmpty()) {
        %>
        <jsp:include page="header.jsp"/>
        
        <p><%= user.getUser_name()%>'s cart is empty</p>
        <img src="images/empty_cart.jpg">
        <div class="col-md-6">
                            <div class="row mb-5">
                               
                                <div class="col-md-6">
                                    <a href="shop.jsp">
                                    <button class="btn btn-outline-primary btn-sm btn-block">Continue Shopping</button>
                                    </a>
                                </div>
                            </div>
                           
                        </div>
        <%
        } else {
        %>

        <jsp:include page="header.jsp"/>

            <div class="site-section">
                <div class="container">
                    <div class="row mb-5">
                        <div class="col-md-12">
                            <div class="site-blocks-table">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th class="product-thumbnail">Image</th>
                                            <th class="product-name">Product</th>
                                            <th class="product-price">Price</th>
                                            <th class="product-quantity">Quantity</th>
                                            <th class="product-total">Total</th>
                                            <th class="product-remove">Remove</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            ProductDAO dao = new ProductDAO();
                                            double total = 0;
                                            for (CartDTO item : cartDAO.getItems(user.getUser_id())) {
                                                String prod_id = item.getProd_id();
                                                int quantity = item.getQuantity();
                                                ProductDTO product = dao.getProductByID(prod_id);
                                                System.out.println(item.getProd_id());
                                                System.out.println(item.getQuantity());
                                                if (product != null) {
                                                    double sub_total = product.getNewPrice() * quantity;
                                                    BigDecimal sub_total_rounded = new BigDecimal(sub_total).setScale(2, RoundingMode.HALF_UP);
                                                    sub_total = sub_total_rounded.doubleValue();
                                                    total += sub_total;
                                        %>
                                        <tr>
                                            <td class="product-thumbnail">
                                                <img src="images/<%=product.getImage()%>" alt="Image" class="img-fluid">
                                            </td>
                                            <td class="product-name">
                                                <h2 class="h5 text-black"><%=product.getProd_name()%></h2>
                                            </td>
                                            <td><%=product.getNewPrice()%>$</td>
                                            <td>
                                                <div class="input-group mb-3" style="max-width: 120px;">
                                                    <form action="MainController" method="POST">
                                                        <input type="number" class="form-control text-center" name="quantity" value="<%=quantity%>">
                                                        <input type="hidden" name="user-id" value="<%=user.getUser_id()%>">
                                                        <input type="hidden" name="prod-id" value="<%=prod_id%>">
                                                        <input type="submit" name="action" value="update">
                                                    </form>
                                                </div>
                                                

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
                                                }
                                            }
                                        %>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="row mb-5">
                               
                                <div class="col-md-6">
                                    <a href="shop.jsp">
                                    <button class="btn btn-outline-primary btn-sm btn-block">Continue Shopping</button>
                                    </a>
                                </div>
                            </div>
                           
                        </div>
                        <div class="col-md-6 pl-5">
                            <div class="row justify-content-end">
                                <div class="col-md-7">
                                    <div class="row">
                                        <div class="col-md-12 text-right border-bottom mb-5">
                                            <h3 class="text-black h4 text-uppercase">Cart Totals</h3>
                                        </div>
                                    </div>

                                    <div class="row mb-5">
                                        <div class="col-md-6">
                                            <span class="text-black">Total</span>
                                        </div>
                                        <div class="col-md-6 text-right">
                                            <strong class="text-black"><%=total%>$</strong>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <form action="MainController" method="POST">
                <input type="hidden" name="action" value="check out">
                <button class="btn btn-primary btn-lg py-3 btn-block">Checkout</button>
                </form>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%
                }
            %>
            <a href="history.jsp">View Your History</a>
            <a href="home.jsp">Back to Shopping Page</a>
            <a href="wishList.jsp">View Your Wish List</a>

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
