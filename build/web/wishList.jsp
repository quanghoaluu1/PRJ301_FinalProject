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
            ProductDAO dao = new ProductDAO();
            List<ProductDTO> wish_list = dao.getWishList(user.getUser_id());
            if (wish_list.isEmpty() || wish_list == null) {
        %>
        <jsp:include page="header.jsp"/>
        <p><%=user.getUser_name()%>'s Wish List is empty</p>
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
                                <th class="product-thumbnail">Image</th>
                                <th class="product-name">Product</th>
                                <th class="product-price">Price</th>

                                <th class="product-remove">Remove</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (ProductDTO product : wish_list) {

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
