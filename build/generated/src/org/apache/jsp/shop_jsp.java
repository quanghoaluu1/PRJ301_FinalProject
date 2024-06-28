package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import model.cart.CartDAO;
import model.user.UserDTO;
import java.util.List;
import model.product.ProductDAO;
import model.product.ProductDTO;

public final class shop_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_set_var_value_nobody;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_c_set_var_value_nobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _jspx_tagPool_c_set_var_value_nobody.release();
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Spidey Tech</title>\n");
      out.write("        <link rel=\"icon\" type=\"image/x-icon\" href=\"images/spi_logo.png\">\n");
      out.write("\n");
      out.write("        <!-- Animate.css -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/animate.css\">\n");
      out.write("        <!-- Icomoon Icon Fonts-->\n");
      out.write("        <link rel=\"stylesheet\" href=\"fonts/icomoon/style.css\">\n");
      out.write("\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/bootstrap.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/magnific-popup.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/jquery-ui.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/animate.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/bootstrap.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/flexslider.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/owl.carousel.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/owl.theme.default.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/aos.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/style.css\">\n");
      out.write("        <script src=\"js/modernizr-2.6.2.min.js\"></script>\n");
      out.write("        <style>\n");
      out.write("            .modal {\n");
      out.write("                display: none;\n");
      out.write("                position: fixed;\n");
      out.write("                z-index: 1;\n");
      out.write("                left: 0;\n");
      out.write("                top: 0;\n");
      out.write("                width: 100%;\n");
      out.write("                height: 100%;\n");
      out.write("                overflow: auto;\n");
      out.write("                background-color: rgb(0, 0, 0);\n");
      out.write("                background-color: rgba(0, 0, 0, 0.4);\n");
      out.write("                padding-top: 60px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .modal-content {\n");
      out.write("                background-color: #fefefe;\n");
      out.write("                margin: 5% auto;\n");
      out.write("                padding: 20px;\n");
      out.write("                border: 1px solid #888;\n");
      out.write("                width: 80%;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .close {\n");
      out.write("                color: #aaa;\n");
      out.write("                float: right;\n");
      out.write("                font-size: 28px;\n");
      out.write("                font-weight: bold;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .close:hover,\n");
      out.write("            .close:focus {\n");
      out.write("                color: black;\n");
      out.write("                text-decoration: none;\n");
      out.write("                cursor: pointer;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("        <script>\n");
      out.write("            function showModal() {\n");
      out.write("                document.getElementById(\"addCart\").style.display = \"block\";\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            function closeModal() {\n");
      out.write("                document.getElementById(\"addCart\").style.display = \"none\";\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            window.onclick = function (event) {\n");
      out.write("                var modal = document.getElementById(\"addCart\");\n");
      out.write("                if (event.target === modal) {\n");
      out.write("                    modal.style.display = \"none\";\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("\n");
      out.write("        </script>\n");
      out.write("        <script>\n");
      out.write("            function selectCate(category) {\n");
      out.write("                document.getElementById('search_cate_input').value = category;\n");
      out.write("                document.getElementById('search_cate_form').submit();\n");
      out.write("            }\n");
      out.write("            function selectBrand(brand) {\n");
      out.write("                document.getElementById('search_brand_input').value = brand;\n");
      out.write("                document.getElementById('search_brand_form').submit();\n");
      out.write("            }\n");
      out.write("            function sort(type) {\n");
      out.write("                document.getElementById('sort-input').value = type;\n");
      out.write("                document.getElementById('sort-form').submit();\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

            UserDTO user = (UserDTO) session.getAttribute("login_user");
            List<ProductDTO> list = null;
            ProductDAO dao = new ProductDAO();
            CartDAO cartDAO = new CartDAO();
            if (request.getAttribute("product_list") != null) {
                list = (List<ProductDTO>) request.getAttribute("product_list");
            } else {
                list = dao.getAllProduct();
            }
        
      out.write("\n");
      out.write("        ");
      if (_jspx_meth_c_set_0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("        ");
      if (_jspx_meth_c_set_1(_jspx_page_context))
        return;
      out.write("\n");
      out.write("        <div class=\"site-wrap\">\n");
      out.write("            <header class=\"site-navbar\" role=\"banner\">\n");
      out.write("                <div class=\"site-navbar-top\">\n");
      out.write("                    <div class=\"container\">\n");
      out.write("                        <div class=\"row align-items-center\">\n");
      out.write("\n");
      out.write("                            <div class=\"col-6 col-md-4 order-2 order-md-1 site-search-icon text-left\">\n");
      out.write("                                <form action=\"SearchProductController\" method=\"GET\" class=\"site-block-top-search\">\n");
      out.write("                                    <span class=\"icon icon-search2\"></span>\n");
      out.write("                                    <input type=\"text\" name=\"search-name\" class=\"form-control border-0\" placeholder=\"Search\">\n");
      out.write("                                    <input type=\"hidden\" name=\"get\" value=\"search\">\n");
      out.write("                                </form>\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                            <div class=\"col-12 mb-3 mb-md-0 col-md-4 order-1 order-md-2 text-center\">\n");
      out.write("                                <div class=\"site-logo\">\n");
      out.write("                                    <a href=\"home.jsp\" class=\"js-logo-clone\">Spidey Tech</a>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                            <div class=\"col-6 col-md-4 order-3 order-md-3 text-right\">\n");
      out.write("                                <div class=\"site-top-icons\">\n");
      out.write("                                    <ul>\n");
      out.write("                                        ");

                                            if (user == null) {
                                        
      out.write("\n");
      out.write("                                        <li><a href=\"login.jsp\"><span class=\"icon icon-person\"></span></a></li>\n");
      out.write("                                        <li>\n");
      out.write("                                            <a href=\"\" onclick=\"showModal()\" class=\"site-cart\">\n");
      out.write("                                                <span class=\"icon icon-shopping_cart\"></span>\n");
      out.write("                                            </a>\n");
      out.write("                                        </li> \n");
      out.write("                                        ");

                                        } else {
                                        
      out.write("\n");
      out.write("                                        <li><a href=\"user.jsp\"><span class=\"icon icon-person\"></span></a></li>\n");
      out.write("                                        <li>\n");
      out.write("                                            <a href=\"cart.jsp\" class=\"site-cart\">\n");
      out.write("                                                <span class=\"icon icon-shopping_cart\"></span>\n");
      out.write("                                                <span class=\"count\">");
      out.print(cartDAO.getItemQuantity(user.getUser_id()));
      out.write("</span>\n");
      out.write("                                            </a>\n");
      out.write("                                        </li> \n");
      out.write("                                        ");
 }
      out.write("\n");
      out.write("                                        <li class=\"d-inline-block d-md-none ml-md-0\"><a href=\"#\" class=\"site-menu-toggle js-menu-toggle\"><span class=\"icon-menu\"></span></a></li>\n");
      out.write("                                    </ul>\n");
      out.write("                                </div> \n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div> \n");
      out.write("                <nav class=\"site-navigation text-right text-md-center\" role=\"navigation\">\n");
      out.write("                    <div class=\"container\">\n");
      out.write("                        <ul class=\"site-menu js-clone-nav d-none d-md-block\">\n");
      out.write("                            <li class=\"has-children active\">\n");
      out.write("                                <a href=\"shop.jsp\">Category</a>\n");
      out.write("                                <form id=\"search_cate_form\" action=\"SearchProductController\" method=\"GET\">\n");
      out.write("                                    <input type=\"hidden\" id=\"search_cate_input\" name=\"search-cate\" value=\"\">\n");
      out.write("                                    <input type=\"hidden\" name=\"get\" value=\"search\">\n");
      out.write("                                </form>\n");
      out.write("                                <ul class=\"dropdown\">\n");
      out.write("                                    <li><a href=\"#\" onclick=\"selectCate('Laptop')\" class=\"icon-laptop\"> Laptop</a></li>\n");
      out.write("                                    <li><a href=\"#\" onclick=\"selectCate('PC')\" class=\"icon-desktop\"> PC</a></li>\n");
      out.write("                                    <li><a href=\"#\" onclick=\"selectCate('Phone')\" class=\"icon-mobile-phone\"> Phone</a></li>\n");
      out.write("                                    <li><a href=\"#\" onclick=\"selectCate('Keyboard')\" class=\"icon-keyboard\"> Keyboard</a></li>\n");
      out.write("                                    <li><a href=\"#\" onclick=\"selectCate('Mouse')\" class=\"icon-mouse\"> Mouse</a></li>\n");
      out.write("                                    <li><a href=\"#\" onclick=\"selectCate('Headphone')\" class=\"icon-headset_mic\"> Headphone</a></li>\n");
      out.write("\n");
      out.write("                                </ul>\n");
      out.write("                            </li>\n");
      out.write("                            <li class=\"has-children\">\n");
      out.write("                                <a href=\"about.html\">About</a>\n");
      out.write("                                <ul class=\"dropdown\">\n");
      out.write("                                    <li><a href=\"#\">Menu One</a></li>\n");
      out.write("                                    <li><a href=\"#\">Menu Two</a></li>\n");
      out.write("                                    <li><a href=\"#\">Menu Three</a></li>\n");
      out.write("                                </ul>\n");
      out.write("                            </li>\n");
      out.write("                            <li><a href=\"shop.html\">Shop</a></li>\n");
      out.write("                            <li><a href=\"#\">Catalogue</a></li>\n");
      out.write("                            <li><a href=\"#\">New Arrivals</a></li>\n");
      out.write("                            <li><a href=\"contact.html\">Contact</a></li>\n");
      out.write("                        </ul>\n");
      out.write("                    </div>\n");
      out.write("                </nav>\n");
      out.write("            </header>\n");
      out.write("\n");
      out.write("            ");


                if (user != null) {
            
      out.write("\n");
      out.write("            <p>Welcome ");
      out.print(user.getUser_name());
      out.write("</p>\n");
      out.write("            <form action=\"MainController\">\n");
      out.write("                <input type=\"submit\" name=\"action\" value=\"logout\">\n");
      out.write("            </form>\n");
      out.write("            ");

                }
            
      out.write("\n");
      out.write("\n");
      out.write("            ");
      if (_jspx_meth_c_set_2(_jspx_page_context))
        return;
      out.write("\n");
      out.write("            ");
      if (_jspx_meth_c_set_3(_jspx_page_context))
        return;
      out.write("\n");
      out.write("            ");
      if (_jspx_meth_c_set_4(_jspx_page_context))
        return;
      out.write("\n");
      out.write("            ");
      if (_jspx_meth_c_set_5(_jspx_page_context))
        return;
      out.write("\n");
      out.write("            ");
      if (_jspx_meth_c_set_6(_jspx_page_context))
        return;
      out.write("\n");
      out.write("\n");
      out.write("            <div class=\"site-section\">\n");
      out.write("                <div class=\"container\">\n");
      out.write("\n");
      out.write("                    <div class=\"row mb-5\">\n");
      out.write("                        <div class=\"col-md-9 order-2\">\n");
      out.write("\n");
      out.write("                            <div class=\"row\">\n");
      out.write("                                <div class=\"col-md-12 mb-5\">\n");
      out.write("                                    <div class=\"float-md-left mb-4\"><h2 class=\"text-black h5\">Sort</h2></div>\n");
      out.write("                                    <div class=\"d-flex\">\n");
      out.write("                                        <form id=\"sort-form\" action=\"SearchProductController\" method=\"get\">\n");
      out.write("                                            <input type=\"hidden\" id=\"sort-input\" name=\"sort\" value=\"\">\n");
      out.write("                                            <input type=\"hidden\" name=\"get\" value=\"search\">\n");
      out.write("                                        </form>\n");
      out.write("                                        <div class=\"btn-group\">\n");
      out.write("                                            <button type=\"button\" class=\"btn btn-secondary btn-sm dropdown-toggle\" id=\"dropdownMenuReference\" data-toggle=\"dropdown\">Reference</button>\n");
      out.write("                                            <div class=\"dropdown-menu\" aria-labelledby=\"dropdownMenuReference\">\n");
      out.write("                                                <a class=\"dropdown-item\" href=\"\" onclick=\"sort('name-asc')\">Name, A to Z</a>\n");
      out.write("                                                <a class=\"dropdown-item\" href=\"\" onclick=\"sort('name-desc')\">Name, Z to A</a>\n");
      out.write("                                                <div class=\"dropdown-divider\"></div>\n");
      out.write("                                                <a class=\"dropdown-item\" href=\"\" onclick=\"sort('price-asc')\">Price, low to high</a>\n");
      out.write("                                                <a class=\"dropdown-item\" href=\"\" onclick=\"sort('price-desc')\">Price, high to low</a>\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"row mb-5\">\n");
      out.write("                                ");

                                    for (ProductDTO product : list) {
                                
      out.write("\n");
      out.write("\n");
      out.write("                                <div class=\"col-sm-6 col-lg-4 mb-4\" data-aos=\"fade-up\">\n");
      out.write("                                    <div class=\"block-4 text-center border\">\n");
      out.write("                                        <figure class=\"block-4-image\">\n");
      out.write("                                            <a href=\"shop-single.html\"><img src=\"images/");
      out.print(product.getImage());
      out.write("\" alt=\"Image placeholder\" class=\"img-fluid\"></a>\n");
      out.write("                                        </figure>\n");
      out.write("                                        <div class=\"block-4-text p-4\">\n");
      out.write("                                            <h3><a href=\"ProductDetailController?prod-id=");
      out.print(product.getProd_id());
      out.write('"');
      out.write('>');
      out.print(product.getProd_name());
      out.write("</a></h3>\n");
      out.write("                                            <p style=\"color: gray; text-decoration: line-through;\">");
      out.print(product.getPrice());
      out.write("$</p>\n");
      out.write("                                            <p class=\"text-primary font-weight-bold\">");
      out.print(product.getNewPrice());
      out.write("$</p>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                                ");

                                    }
                                
      out.write("\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("            ");
 String msg = (String) request.getAttribute("msg");
            if (msg != null) {
      out.write("\n");
      out.write("            <script type=\"text/javascript\">\n");
      out.write("                alert(\"");
      out.print(msg);
      out.write("\");\n");
      out.write("            </script>\n");
      out.write("            ");

                }
            
      out.write("\n");
      out.write("            <div id=\"addCart\" class=\"modal\">\n");
      out.write("                <div class=\"modal-content\">\n");
      out.write("                    <span class=\"close\" onclick=\"closeModal()\">&times;</span>\n");
      out.write("                    <p>Please login to do this. <a href=\"login.jsp\">Login</a></p>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <script src=\"js/jquery-3.3.1.min.js\"></script>\n");
      out.write("            <script src=\"js/jquery-ui.js\"></script>\n");
      out.write("            <script src=\"js/popper.min.js\"></script>\n");
      out.write("            <script src=\"js/jquery.magnific-popup.min.js\"></script>\n");
      out.write("            <script src=\"js/aos.js\"></script>\n");
      out.write("            <script src=\"js/jquery.min.js\"></script>\n");
      out.write("            <!-- jQuery Easing -->\n");
      out.write("            <script src=\"js/jquery.easing.1.3.js\"></script>\n");
      out.write("            <!-- Bootstrap -->\n");
      out.write("            <script src=\"js/bootstrap.min.js\"></script>\n");
      out.write("            <!-- Waypoints -->\n");
      out.write("            <script src=\"js/jquery.waypoints.min.js\"></script>\n");
      out.write("            <!-- Carousel -->\n");
      out.write("            <script src=\"js/owl.carousel.min.js\"></script>\n");
      out.write("            <!-- countTo -->\n");
      out.write("            <script src=\"js/jquery.countTo.js\"></script>\n");
      out.write("            <!-- Flexslider -->\n");
      out.write("            <script src=\"js/jquery.flexslider-min.js\"></script>\n");
      out.write("            <!-- Main -->\n");
      out.write("            <script src=\"js/main.js\"></script>\n");
      out.write("            <script src=\"js/main1.js\"></script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_set_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:set
    org.apache.taglibs.standard.tag.rt.core.SetTag _jspx_th_c_set_0 = (org.apache.taglibs.standard.tag.rt.core.SetTag) _jspx_tagPool_c_set_var_value_nobody.get(org.apache.taglibs.standard.tag.rt.core.SetTag.class);
    _jspx_th_c_set_0.setPageContext(_jspx_page_context);
    _jspx_th_c_set_0.setParent(null);
    _jspx_th_c_set_0.setVar("search_name");
    _jspx_th_c_set_0.setValue((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param.search-name != null ? param['search-name'] : ''}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    int _jspx_eval_c_set_0 = _jspx_th_c_set_0.doStartTag();
    if (_jspx_th_c_set_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_set_var_value_nobody.reuse(_jspx_th_c_set_0);
      return true;
    }
    _jspx_tagPool_c_set_var_value_nobody.reuse(_jspx_th_c_set_0);
    return false;
  }

  private boolean _jspx_meth_c_set_1(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:set
    org.apache.taglibs.standard.tag.rt.core.SetTag _jspx_th_c_set_1 = (org.apache.taglibs.standard.tag.rt.core.SetTag) _jspx_tagPool_c_set_var_value_nobody.get(org.apache.taglibs.standard.tag.rt.core.SetTag.class);
    _jspx_th_c_set_1.setPageContext(_jspx_page_context);
    _jspx_th_c_set_1.setParent(null);
    _jspx_th_c_set_1.setVar("search_cate");
    _jspx_th_c_set_1.setValue((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param.search-cate != null ? param['search-cate'] : ''}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    int _jspx_eval_c_set_1 = _jspx_th_c_set_1.doStartTag();
    if (_jspx_th_c_set_1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_set_var_value_nobody.reuse(_jspx_th_c_set_1);
      return true;
    }
    _jspx_tagPool_c_set_var_value_nobody.reuse(_jspx_th_c_set_1);
    return false;
  }

  private boolean _jspx_meth_c_set_2(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:set
    org.apache.taglibs.standard.tag.rt.core.SetTag _jspx_th_c_set_2 = (org.apache.taglibs.standard.tag.rt.core.SetTag) _jspx_tagPool_c_set_var_value_nobody.get(org.apache.taglibs.standard.tag.rt.core.SetTag.class);
    _jspx_th_c_set_2.setPageContext(_jspx_page_context);
    _jspx_th_c_set_2.setParent(null);
    _jspx_th_c_set_2.setVar("search_name");
    _jspx_th_c_set_2.setValue((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param.search-name != null ? param['search-name'] : ''}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    int _jspx_eval_c_set_2 = _jspx_th_c_set_2.doStartTag();
    if (_jspx_th_c_set_2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_set_var_value_nobody.reuse(_jspx_th_c_set_2);
      return true;
    }
    _jspx_tagPool_c_set_var_value_nobody.reuse(_jspx_th_c_set_2);
    return false;
  }

  private boolean _jspx_meth_c_set_3(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:set
    org.apache.taglibs.standard.tag.rt.core.SetTag _jspx_th_c_set_3 = (org.apache.taglibs.standard.tag.rt.core.SetTag) _jspx_tagPool_c_set_var_value_nobody.get(org.apache.taglibs.standard.tag.rt.core.SetTag.class);
    _jspx_th_c_set_3.setPageContext(_jspx_page_context);
    _jspx_th_c_set_3.setParent(null);
    _jspx_th_c_set_3.setVar("search_cate");
    _jspx_th_c_set_3.setValue((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param.search-cate != null ? param['search-cate'] : ''}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    int _jspx_eval_c_set_3 = _jspx_th_c_set_3.doStartTag();
    if (_jspx_th_c_set_3.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_set_var_value_nobody.reuse(_jspx_th_c_set_3);
      return true;
    }
    _jspx_tagPool_c_set_var_value_nobody.reuse(_jspx_th_c_set_3);
    return false;
  }

  private boolean _jspx_meth_c_set_4(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:set
    org.apache.taglibs.standard.tag.rt.core.SetTag _jspx_th_c_set_4 = (org.apache.taglibs.standard.tag.rt.core.SetTag) _jspx_tagPool_c_set_var_value_nobody.get(org.apache.taglibs.standard.tag.rt.core.SetTag.class);
    _jspx_th_c_set_4.setPageContext(_jspx_page_context);
    _jspx_th_c_set_4.setParent(null);
    _jspx_th_c_set_4.setVar("min_price");
    _jspx_th_c_set_4.setValue((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param.min-price != null ? param['min-price'] : ''}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    int _jspx_eval_c_set_4 = _jspx_th_c_set_4.doStartTag();
    if (_jspx_th_c_set_4.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_set_var_value_nobody.reuse(_jspx_th_c_set_4);
      return true;
    }
    _jspx_tagPool_c_set_var_value_nobody.reuse(_jspx_th_c_set_4);
    return false;
  }

  private boolean _jspx_meth_c_set_5(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:set
    org.apache.taglibs.standard.tag.rt.core.SetTag _jspx_th_c_set_5 = (org.apache.taglibs.standard.tag.rt.core.SetTag) _jspx_tagPool_c_set_var_value_nobody.get(org.apache.taglibs.standard.tag.rt.core.SetTag.class);
    _jspx_th_c_set_5.setPageContext(_jspx_page_context);
    _jspx_th_c_set_5.setParent(null);
    _jspx_th_c_set_5.setVar("max_price");
    _jspx_th_c_set_5.setValue((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param.max-price != null ? param['max-price'] : ''}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    int _jspx_eval_c_set_5 = _jspx_th_c_set_5.doStartTag();
    if (_jspx_th_c_set_5.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_set_var_value_nobody.reuse(_jspx_th_c_set_5);
      return true;
    }
    _jspx_tagPool_c_set_var_value_nobody.reuse(_jspx_th_c_set_5);
    return false;
  }

  private boolean _jspx_meth_c_set_6(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:set
    org.apache.taglibs.standard.tag.rt.core.SetTag _jspx_th_c_set_6 = (org.apache.taglibs.standard.tag.rt.core.SetTag) _jspx_tagPool_c_set_var_value_nobody.get(org.apache.taglibs.standard.tag.rt.core.SetTag.class);
    _jspx_th_c_set_6.setPageContext(_jspx_page_context);
    _jspx_th_c_set_6.setParent(null);
    _jspx_th_c_set_6.setVar("sort");
    _jspx_th_c_set_6.setValue((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param.sort != null ? param.sort : ''}}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    int _jspx_eval_c_set_6 = _jspx_th_c_set_6.doStartTag();
    if (_jspx_th_c_set_6.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_set_var_value_nobody.reuse(_jspx_th_c_set_6);
      return true;
    }
    _jspx_tagPool_c_set_var_value_nobody.reuse(_jspx_th_c_set_6);
    return false;
  }
}
