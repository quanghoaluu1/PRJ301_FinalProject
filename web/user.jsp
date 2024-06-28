<%-- 
    Document   : user
    Created on : Jun 15, 2024, 8:50:20 AM
    Author     : quang
--%>
<%@page import="model.user.UserDTO"%>
<%@page import="model.cart.CartDAO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
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
        <c:set var="user" value="${sessionScope.login_user}"/>
        <c:if test="${user.role == 'manager' or user.role == 'staff'}">
            <a href="staff.jsp">Go to staff page</a>
        </c:if>
        <%      UserDTO user = (UserDTO) session.getAttribute("login_user");
            CartDAO cartDAO = new CartDAO();
        %>
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
                                        <%
                                            if (user == null) {
                                        %>
                                        <li><a href="login.jsp"><span class="icon icon-person"></span></a></li>
                                        <li><a href="LogoutController"><span class="icon icon-exit_to_app"></span></a>
                                            
                                        <li>
                                            <a href="" onclick="showModal()" class="site-cart">
                                                <span class="icon icon-shopping_cart"></span>

                                            </a>
                                        </li> 
                                        <%
                                        } else {
                                        %>
                                        <li><a href="user.jsp"><span class="icon icon-person"></span></a></li>
                                        <li><a href="LogoutController"><span class="icon icon-exit_to_app"></span></a>
                                        <li>
                                            <a href="cart.jsp" class="site-cart">
                                                <span class="icon icon-shopping_cart"></span>
                                                <span class="count"><%=cartDAO.getItemQuantity(user.getUser_id())%></span>
                                            </a>
                                        </li> 
                                        <%
                                            }
                                        %>
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

                            <li><a href="shop.jsp">Shop</a></li>

                        </ul>
                    </div>
                </nav>
            </header>

            <div class="col-md-7 mx-auto">

                <form action="MainController" method="POST">

                    <div class="p-3 p-lg-5 border">
                        <div class="form-group row">
                            <div class="col-md-6">
                                <label for="userID" class="text-black">User ID</label>
                                <input type="text" class="form-control" id="userID" name="user-id" value="<%= user.getUser_id()%>" readonly>
                            </div>
                            <div class="col-md-6">
                                <label for="fullName" class="text-black">Full Name</label>
                                <input type="text" class="form-control" id="fullName" name="user-name" value="<%= user.getUser_name()%>">
                            </div>
                        </div>
                            <div class="col-md-6">
                                <label for="role" class="text-black">Role</label>
                                <input type="text" class="form-control" id="role" name="role" value="<%= user.getRole()%>" readonly="">
                            </div>
                        <div class="form-group row">
                            <div class="col-md-12">
                                <label for="password" class="text-black">Password</label>
                                <input type="password" class="form-control" id="password" name="password" value="<%= user.getPassword()%>">
                            </div>
                        </div>
                            
                        <input type="submit" class="btn btn-primary btn-lg btn-block" name="action" value="edit user">
                    </div>
                </form>
            </div>
        </div>


        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/aos.js"></script>

        <script src="js/main.js"></script>
    </body>
</html>
