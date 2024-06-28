<%-- 
    Document   : home
    Created on : Jun 25, 2024, 1:05:19 PM
    Author     : quang
--%>

<%@page import="model.cart.CartDAO"%>
<%@page import="model.product.ProductDTO"%>
<%@page import="model.product.ProductDAO"%>
<%@page import="java.util.List"%>
<%@page import="model.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Spidey Tech</title>
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
                padding-top: 160px;
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

                .old-price{
                    color: red;
                    text-decoration: blue;
                }
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
        <%
            UserDTO user = (UserDTO) session.getAttribute("login_user");
            List<ProductDTO> list = null;
            ProductDAO dao = new ProductDAO();
            CartDAO cartDAO = new CartDAO();
            if (request.getAttribute("product_list") != null) {
                list = (List<ProductDTO>) request.getAttribute("product_list");
            } else {
                list = dao.getAllProduct();
            }
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
                                        <%
                                            if (user == null) {
                                        %>
                                        <li><a href="login.jsp"><span class="icon icon-person"></span></a></li>
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
                                        <% }%>
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

            <div class="site-blocks-cover" style="background-image: url(images/pc_bg.png);;" data-aos="fade">
                <div class="container">
                    <div class="row align-items-start align-items-md-center justify-content-end">
                        <div class="col-md-5 text-center text-md-left pt-5 pt-md-0">
                            <h1 class="mb-2">Find Your Powerful Gaming PC</h1>
                            <div class="intro-text text-center text-md-left">
                                <p>
                                    <a href="shop.jsp" class="btn btn-sm btn-primary">Shop Now</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



            <div class="site-section site-section-sm site-blocks-1">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4" data-aos="fade-up" data-aos-delay="">
                            <div class="icon mr-4 align-self-start">
                                <span class="icon-truck"></span>
                            </div>
                            <div class="text">
                                <h2 class="text-uppercase">Free Shipping</h2>

                            </div>
                        </div>
                        <div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4" data-aos="fade-up" data-aos-delay="100">
                            <div class="icon mr-4 align-self-start">
                                <span class="icon-refresh2"></span>
                            </div>
                            <div class="text">
                                <h2 class="text-uppercase">Free Returns</h2>

                            </div>
                        </div>
                        <div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4" data-aos="fade-up" data-aos-delay="200">
                            <div class="icon mr-4 align-self-start">
                                <span class="icon-help"></span>
                            </div>
                            <div class="text">
                                <h2 class="text-uppercase">Customer Support</h2>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="site-section site-blocks-2">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6 col-md-6 col-lg-4 mb-4 mb-lg-0" data-aos="fade" data-aos-delay="">
                            <a class="block-2-item" href="#" onclick="selectCate('Laptop')">
                                <figure class="image">
                                    <img src="images/banner-1.png" alt="" class="img-fluid">
                                </figure>
                                <div class="text">
                                    <span class="text-uppercase">Collections</span>
                                    <h3>Laptop</h3>
                                </div>
                            </a>
                        </div>
                        <div class="col-sm-6 col-md-6 col-lg-4 mb-5 mb-lg-0" data-aos="fade" data-aos-delay="100">
                            <a class="block-2-item" href="#" onclick="selectCate('PC')">
                                <figure class="image">
                                    <img src="images/banner-2.png" alt="" class="img-fluid" >
                                </figure>
                                <div class="text">
                                    <span class="text-uppercase">Collections</span>
                                    <h3>PC</h3>
                                </div>
                            </a>
                        </div>
                        <div class="col-sm-6 col-md-6 col-lg-4 mb-5 mb-lg-0" data-aos="fade" data-aos-delay="200">
                            <a class="block-2-item" href="#" onclick="selectCate('Phone')">
                                <figure class="image">
                                    <img src="images/banner-3.jpg" alt="" class="img-fluid">
                                </figure>
                                <div class="text">
                                    <span class="text-uppercase">Collections</span>
                                    <h3>Phone</h3>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="site-section block-3 site-blocks-2 bg-light">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-md-7 site-section-heading text-center pt-4">
                            <h2>Featured Products</h2>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="nonloop-block-3 owl-carousel">
                                <div class="item">
                                    <%
                                        ProductDTO fea_prod_1 = dao.getProductByID("PC_001");
                                    %>
                                    <div class="block-4 text-center">
                                        <figure class="block-4-image">
                                            <img src="images/<%=fea_prod_1.getImage()%>" alt="Image placeholder" class="img-fluid">
                                        </figure>
                                        <div class="block-4-text p-4">
                                            <h3><a href="ProductDetailController?prod-id=<%=fea_prod_1.getProd_id()%>"><%=fea_prod_1.getProd_name()%></a></h3>
                                            <p style="color: gray; text-decoration: line-through;"><%=fea_prod_1.getPrice()%>$</p>
                                            <p class="text-primary font-weight-bold"><%=fea_prod_1.getNewPrice()%>$</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="item">
                                    <%
                                        ProductDTO fea_prod_2 = dao.getProductByID("lap_acerprehelios300");
                                    %>
                                    <div class="block-4 text-center">
                                        <figure class="block-4-image">
                                            <img src="images/<%=fea_prod_2.getImage()%>" alt="Image placeholder" class="img-fluid">
                                        </figure>
                                        <div class="block-4-text p-4">
                                            <h3><a href="ProductDetailController?prod-id=<%=fea_prod_2.getProd_id()%>"><%=fea_prod_2.getProd_name()%></a></h3>
                                            <p style="color: gray; text-decoration: line-through;"><%=fea_prod_2.getPrice()%>$</p>
                                            <p class="text-primary font-weight-bold"><%=fea_prod_2.getNewPrice()%>$</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="item">
                                    <%
                                        ProductDTO fea_prod_3 = dao.getProductByID("phone_iphone15promax");
                                    %>
                                    <div class="block-4 text-center">
                                        <figure class="block-4-image">
                                            <img src="images/<%=fea_prod_3.getImage()%>" alt="Image placeholder" class="img-fluid">
                                        </figure>
                                        <div class="block-4-text p-4">
                                            <h3><a href="ProductDetailController?prod-id=<%=fea_prod_3.getProd_id()%>"><%=fea_prod_3.getProd_name()%></a></h3>
                                            <p style="color: gray; text-decoration: line-through;"><%=fea_prod_3.getPrice()%>$</p>
                                            <p class="text-primary font-weight-bold"><%=fea_prod_3.getNewPrice()%>$</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="item">
                                    <%
                                        ProductDTO fea_prod_4 = dao.getProductByID("lap_asusrogzephyg15");
                                    %>
                                    <div class="block-4 text-center">
                                        <figure class="block-4-image">
                                            <img src="images/<%=fea_prod_4.getImage()%>" alt="Image placeholder" class="img-fluid">
                                        </figure>
                                        <div class="block-4-text p-4">
                                            <h3><a href="ProductDetailController?prod-id=<%=fea_prod_4.getProd_id()%>"><%=fea_prod_4.getProd_name()%></a></h3>
                                            <p style="color: gray; text-decoration: line-through;"><%=fea_prod_4.getPrice()%>$</p>
                                            <p class="text-primary font-weight-bold"><%=fea_prod_4.getNewPrice()%>$</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="item">
                                    <%
                                        ProductDTO fea_prod_5 = dao.getProductByID("hp_xiaoredbuds5");
                                    %>
                                    <div class="block-4 text-center">
                                        <figure class="block-4-image">
                                            <img src="images/<%=fea_prod_5.getImage()%>" alt="Image placeholder" class="img-fluid">
                                        </figure>
                                        <div class="block-4-text p-4">
                                            <h3><a href="ProductDetailController?prod-id=<%=fea_prod_5.getProd_id()%>"><%=fea_prod_5.getProd_name()%></a></h3>
                                            <p style="color: gray; text-decoration: line-through;"><%=fea_prod_5.getPrice()%>$</p>
                                            <p class="text-primary font-weight-bold"><%=fea_prod_5.getNewPrice()%>$</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <form id="search_brand_form" action="SearchProductController" method="GET">
                <input type="hidden" id="search_brand_input" name="search-brand" value="">
                <input type="hidden" name="get" value="search">
            </form>
            <div class="site-section block-8">
                <div class="container">
                    <div class="row justify-content-center  mb-5">
                        <div class="col-md-7 site-section-heading text-center pt-4">
                            <h2>Big Sale!</h2>
                        </div>
                    </div>
                    <div class="row align-items-center">
                        <div class="col-md-12 col-lg-7 mb-5">
                            <a href="#" onclick="selectBrand('Logitech')"><img src="images/logitech-sale.jpg" alt="Image placeholder" class="img-fluid rounded"></a>
                        </div>
                        <div class="col-md-12 col-lg-5 text-center pl-md-5">
                            <h2><a href="#" onclick="selectBrand('Logitech')">50% discout for all <span style="color: #007bff; font-weight: bold;">Logitech</span> Products</a></h2>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quisquam iste dolor accusantium facere corporis ipsum animi deleniti fugiat. Ex, veniam?</p>
                            <p><a href="#" onclick="selectBrand('Logitech')"  class="btn btn-primary btn-sm">Shop Now</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- - - - - - - - - - - - - - - - - - - - - - -  - - - - - -  -->
        <div id="addCart" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeModal()">&times;</span>
                <p>Please login to do this. <a href="login.jsp">Login</a></p>
            </div>
        </div>

        <script>
            function selectCate(category) {
                document.getElementById('search_cate_input').value = category;
                document.getElementById('search_cate_form').submit();
            }
            function selectBrand(brand) {
                document.getElementById('search_brand_input').value = brand;
                document.getElementById('search_brand_form').submit();
            }
        </script>

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
