<%-- 
    Document   : shoppingPage
    Created on : Jun 20, 2024, 5:06:30 PM
    Author     : quang
--%>

<%@page import="model.cart.CartDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        <!-- Animate.css -->
        <link rel="stylesheet" href="css/animate.css">
        <!-- Icomoon Icon Fonts-->
        <link rel="stylesheet" href="fonts/icomoon/style.css">

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
        <script>
            function selectCate(category) {
                document.getElementById('search_cate_input').value = category;
                localStorage.setItem('search_cate', category);
                document.getElementById('search_cate_form').submit();
            }
            function selectBrand(brand) {
                document.getElementById('search_brand_input').value = brand;
                localStorage.setItem('search-brand', brand);
                document.getElementById('search_cate_form').submit();
            }
            function sort(type) {
                const search_cate = localStorage.getItem('search_cate');
                const search_brand = localStorage.getItem('search_brand');
                if (search_cate) {
                    document.getElementById('search_cate_input').value = search_cate;
                    document.getElementById('search_brand_input').value = search_brand;
                }
                document.getElementById('sort-input').value = type;
                document.getElementById('search_cate_form').submit();
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
        <c:set var="min_price" value="${param.min-price != null ? param['min-price'] : ''}"/>
        <c:set var="max_price" value="${param.max-price != null ? param['max-price'] : ''}"/>
        <c:set var="sort" value="${param.sort != null ? param['sort'] : ''}}"/>
        <div class="site-wrap">
            <header class="site-navbar" role="banner">
                <div class="site-navbar-top">
                    <div class="container">
                        <div class="row align-items-center">

                            <div class="col-6 col-md-4 order-2 order-md-1 site-search-icon text-left">
                                <form action="SearchProductController" method="GET" class="site-block-top-search">
                                    <span class="icon icon-search2"></span>
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
                                    <input type="hidden" id="search_brand_input" name="search-brand" value="">
                                    <input type="hidden" id="sort-input" name="sort" value="">
                                    <input type="hidden" id="min-price" name="min-price" value=""  >   
                                    <input type="hidden" id="max-price" name="max-price" value=""  >
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


            <div class="site-section">
                <div class="container">

                    <div class="row mb-5">
                        <div class="col-md-9 order-2">

                            <div class="row">
                                <div class="col-md-12 mb-5">
                                    <div class="float-md-left mb-4"><h2 class="text-black h5">Products</h2></div>
                                    <div class="d-flex">
                                        <form id="sort-form" action="SearchProductController" method="get">

                                            <input type="hidden" name="get" value="search">
                                        </form>
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-secondary btn-sm dropdown-toggle" id="dropdownMenuReference" data-toggle="dropdown">Sort</button>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuReference">
                                                <a class="dropdown-item" href="#" onclick="sort('name-asc')">Name, A to Z</a>
                                                <a class="dropdown-item" href="#" onclick="sort('name-desc')">Name, Z to A</a>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item" href="#" onclick="sort('price-asc')">Price, low to high</a>
                                                <a class="dropdown-item" href="#" onclick="sort('price-desc')">Price, high to low</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-5">
                                <%
                                    for (ProductDTO product : list) {
                                %>

                                <div class="col-sm-6 col-lg-4 mb-4" data-aos="fade-up">
                                    <div class="block-4 text-center border">
                                        <figure class="block-4-image">
                                            <a href="ProductDetailController?prod-id=<%=product.getProd_id()%>"><img src="images/<%=product.getImage()%>" alt="Image placeholder" class="img-fluid"></a>
                                        </figure>
                                        <div class="block-4-text p-4">
                                            <h3><a href="ProductDetailController?prod-id=<%=product.getProd_id()%>"><%=product.getProd_name()%></a></h3>
                                            <p style="color: gray; text-decoration: line-through;"><%=product.getPrice()%>$</p>
                                            <p class="text-primary font-weight-bold"><%=product.getNewPrice()%>$</p>

                                            
                                        </div>
                                    </div>
                                </div>
                                <%
                                    }
                                %>
                            </div>
                            <div class="row" data-aos="fade-up">
                                <div class="col-md-12 text-center">
                                    <div class="site-block-27">
                                        <ul>
                                            <li><a href="#">&lt;</a></li>
                                            <li class="active"><span>1</span></li>
                                            <li><a href="#">2</a></li>
                                            <li><a href="#">3</a></li>
                                            <li><a href="#">4</a></li>
                                            <li><a href="#">5</a></li>
                                            <li><a href="#">&gt;</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3 order-1 mb-5 mb-md-0">
                            <div class="border p-4 rounded mb-4">
                                <h3 class="mb-3 h6 text-uppercase text-black d-block">Categories</h3>
                                <!--              <form id="search_cate_form" action="SearchProductController" method="GET">
                                                                    <input type="hidden" id="search_cate_input" name="search-cate" value="">
                                                                    <input type="hidden" name="get" value="search">
                                                                </form>-->
                                <ul class="list-unstyled mb-0">
                                    <li class="mb-1"><a href="#" onclick="selectCate('Laptop')" class="d-flex"><span>Laptop</span> <span class="text-black ml-auto"></span></a></li>
                                    <li class="mb-1"><a href="#" onclick="selectCate('PC')" class="d-flex"><span>PC</span> <span class="text-black ml-auto"></span></a></li>
                                    <li class="mb-1"><a href="#" onclick="selectCate('Phone')" class="d-flex"><span>Phone</span> <span class="text-black ml-auto"></span></a></li>
                                    <li class="mb-1"><a href="#" onclick="selectCate('Keyboard')" class="d-flex"><span>Keyboard</span> <span class="text-black ml-auto"></span></a></li>
                                    <li class="mb-1"><a href="#" onclick="selectCate('Mouse')" class="d-flex"><span>Mouse</span> <span class="text-black ml-auto"></span></a></li>
                                    <li class="mb-1"><a href="#" onclick="selectCate('Headphone')" class="d-flex"><span>Headphone</span> <span class="text-black ml-auto"></span></a></li>
                                </ul>
                            </div>

                            <div class="border p-4 rounded mb-4">
                                <div class="mb-4">
                                    <h3 class="mb-3 h6 text-uppercase text-black d-block">Filter by Price</h3>
                                    <div id="slider-range" class="border-primary"></div>
                                    <input type="text" name="text" id="amount" class="form-control border-0 pl-0 bg-white" disabled="" />
                                </div>



                                <div class="mb-4">
                                    <h3 class="mb-3 h6 text-uppercase text-black d-block">Brand</h3>
                                    <a href="#" onclick="selectBrand('Asus')" class="d-flex color-item align-items-center" >
                                        <img src="images/asus-logo.png" class="img-fluid" width="160" height="100">
                                    </a>
                                    <a href="#" onclick="selectBrand('Acer')" class="d-flex color-item align-items-center" >
                                        <img src="images/acer-logo.png" class="img-fluid" width="160" height="100">
                                    </a>
                                    <a href="#" onclick="selectBrand('Apple')" class="d-flex color-item align-items-center" >
                                        <img src="images/apple-logo.png" class="img-fluid" width="160" height="100">
                                    </a>
                                    <a href="#" onclick="selectBrand('Logitech')" class="d-flex color-item align-items-center" >
                                        <img src="images/logi-logo.png" class="img-fluid" width="160" height="100">
                                    </a>

                                </div>

                            </div>
                        </div>

                    </div>
                </div>
            </div>



        </div>

        <% String msg = (String) request.getAttribute("msg");
            if (msg != null) {%>
        <script type="text/javascript">
            alert("<%=msg%>");
        </script>
        <%
            }
        %>
        <div id="addCart" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeModal()">&times;</span>
                <p>Please login to do this. <a href="login.jsp">Login</a></p>
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
