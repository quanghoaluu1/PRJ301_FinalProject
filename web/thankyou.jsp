<%-- 
    Document   : thankyou
    Created on : Jun 28, 2024, 11:04:58 AM
    Author     : quang
--%>

<%@page import="model.cart.CartDAO"%>
<%@page import="model.product.ProductDAO"%>
<%@page import="model.product.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="model.user.UserDTO"%>
<%@page import="model.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
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
            List<ProductDTO> list = null;
            ProductDAO dao = new ProductDAO();
            CartDAO cartDAO = new CartDAO();
        %>
         <c:set var="search_name" value="${param.search-name != null ? param['search-name'] : ''}"/>
        <c:set var="search_cate" value="${param.search-cate != null ? param['search-cate'] : ''}"/>
        <div class="site-wrap">
            <header class="site-navbar" role="banner">
                <div class="site-navbar-top">
                    <div class="container">
                        <div class="row align-items-center">

                            <div class="col-6 col-md-4 order-2 order-md-1 site-search-icon text-left">
                                <form action="SearchProductController" method="GET" class="site-block-top-search">
                                    <span class="icon icon-search"></span>
                                    <input type="text" name="search-name" class="form-control border-0" placeholder="Search">
                                    <input type="hidden" name="get" value="search">
                                </form>
                            </div>

                            <div class="col-12 mb-3 mb-md-0 col-md-4 order-1 order-md-2 text-center">
                                <div class="site-logo">

                                    <a href="home.jsp" class="js-logo-clone">Spidey Tech</a>
                                </div>
                            </div>

                            <div class="col-6 col-md-4 order-3 order-md-3 text-right">
                                <div class="site-top-icons">
                                    <ul>

                                        <li><a href="user.jsp"><span class="icon icon-person"></span></a></li>
                                        <li><a href="LogoutController"><span class="icon icon-exit_to_app"></span></a>
                                        <li>
                                            <a href="cart.jsp" class="site-cart">
                                                <span class="icon icon-shopping_cart"></span>
                                                <span class="count"><%=cartDAO.getItemQuantity(user.getUser_id())%></span>
                                            </a>
                                        </li> 
                                        <li class="d-inline-block d-md-none ml-md-0"><a href="#" class="site-menu-toggle js-menu-toggle"><span class="icon-menu"></span></a></li>
                                    </ul>
                                </div> 
                            </div>

                        </div>
                    </div>
                </div> 
                <nav class="site-navigation text-right text-md-center" role="navigation">
                    <div class="container">
                        <ul class="site-menu js-clone-nav d-none d-md-block">
                            <li class="has-children active">
                                <a href="shop.jsp">Category</a>
                                <form id="search_cate_form" action="SearchProductController" method="GET">
                                    <input type="hidden" id="search_cate_input" name="search-cate" value="">
                                    <input type="hidden" name="get" value="search">
                                </form>
                                <ul class="dropdown">
                                    <li><a href="#" onclick="selectCate('Laptop')" class="icon-laptop"> Laptop</a></li>
                                    <li><a href="#" onclick="selectCate('PC')" class="icon-desktop"> PC</a></li>
                                    <li><a href="#" onclick="selectCate('Phone')" class="icon-mobile-phone"> Phone</a></li>
                                    <li><a href="#" onclick="selectCate('Keyboard')" class="icon-keyboard"> Keyboard</a></li>
                                    <li><a href="#" onclick="selectCate('Mouse')" class="icon-mouse"> Mouse</a></li>
                                    <li><a href="#" onclick="selectCate('Headphone')" class="icon-headset_mic"> Headphone</a></li>

                                </ul>
                            </li>
                            <li class="has-children">
                                <a href="about.html">About</a>
                                <ul class="dropdown">
                                    <li><a href="#">Menu One</a></li>
                                    <li><a href="#">Menu Two</a></li>
                                    <li><a href="#">Menu Three</a></li>
                                </ul>
                            </li>
                            <li><a href="shop.jsp">Shop</a></li>
                            <li><a href="#">Catalogue</a></li>
                            <li><a href="#">New Arrivals</a></li>
                            <li><a href="contact.html">Contact</a></li>
                        </ul>
                    </div>
                </nav>
            </header>
                                            
                                            <div class="site-section">
      <div class="container">
        <div class="row">
          <div class="col-md-12 text-center">
            <span class="icon-check_circle display-3 text-success"></span>
            <h2 class="display-3 text-black">Thank you!</h2>
            <p class="lead mb-5">You order was successfuly completed.</p>
            <p><a href="shop.jsp" class="btn btn-sm btn-primary">Back to shop</a></p>
          </div>
        </div>
      </div>
    </div>
        
        </div>
                                            
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
