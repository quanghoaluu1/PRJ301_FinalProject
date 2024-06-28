/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import constants.Constant;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.user.UserDTO;

/**
 *
 * @author quang
 */
@MultipartConfig
public class MainController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String LOGIN = "login";
    private static final String LOGIN_CONTROLLER = "LoginController";
    
    private static final String LOGOUT = "logout";
    private static final String LOGOUT_CONTROLLER = "LogoutController";
    
    private static final String REGISTER = "register";
    private static final String REGISTER_CONTROLLER ="RegisterController";
    
    private static final String ADD_PRODUCT = "add product";
    private static final String ADD_PRODUCT_CONTROLLER = "AddProductController";
    
    private static final String SEARCH_ALL_PRODUCT = "search all";
    private static final String SEARCH_ALL_PRODUCT_CONTROLLER = "ProductManagerController";
    
    private static final String DELETE_PRODUCT = "delete product";
    private static final String DELETE_PRODUCT_CONTROLLER = "DeleteProductController";
    
    private static final String EDIT_PRODUCT_FORM = "edit product form";
    private static final String EDIT_PRODUCT_FORM_CONTROLLER = "EditProductForm";
    
    private static final String EDIT_PRODUCT = "edit product";
    private static final String EDIT_PRODUCT_CONTROLLER = "EditProductController";
    
    private static final String ADD_TO_CART = "add to cart";
    private static final String ADD_TO_CART_CONTROLLER = "AddToCartController";
    
    private static final String UPDATE_CART = "update";
    private static final String UPDATE_CART_CONTROLLER = "UpdateCartController";
    
    private static final String REMOVE_ITEM = "remove";
    private static final String REMOVE_ITEM_CONTROLLER = "RemoveItemsController";
    
    private static final String ADD_TO_WISH_LIST = "add to wish list";
    private static final String ADD_TO_WISH_LIST_CONTROLLER = "AddToWishListController";
    
    private static final String REMOVE_FROM_WISH_LIST = "remove wish list";
    private static final String REMOVE_FROM_WISH_LIST_CONTROLLER = "RemoveFromWishList";

    private static final String CHECK_OUT = "check out";
    private static final String CHECK_OUT_CONTROLLER = "CheckOutController";
    
    private static final String EDIT_USER = "edit user";
    private static final String EDIT_USER_CONTROLLER = "EditUserController";
    
    private static final String DELETE_USER = "delete user";
    private static final String DELETE_USER_CONTROLLER = "DeleteUserController";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String url = Constant.ERROR_PAGE;
        try{
            String action = request.getParameter("action");
         switch (action) {
                case LOGIN:
                    url = LOGIN_CONTROLLER;
                    break;
                case LOGOUT:
                    url = LOGOUT_CONTROLLER;
                    break;
                case REGISTER:
                    url = REGISTER_CONTROLLER;
                    break;
                case ADD_PRODUCT:
                    url = ADD_PRODUCT_CONTROLLER;
                    break;
                case SEARCH_ALL_PRODUCT:
                    url = SEARCH_ALL_PRODUCT_CONTROLLER;
                    break;
                case DELETE_PRODUCT:
                    url = DELETE_PRODUCT_CONTROLLER;
                    break;
                case EDIT_PRODUCT_FORM:
                    url = EDIT_PRODUCT_FORM_CONTROLLER;
                    break;
                case EDIT_PRODUCT:
                    url = EDIT_PRODUCT_CONTROLLER;
                    break;
                case ADD_TO_CART:
                    HttpSession session = request.getSession();
                    UserDTO user = (UserDTO)session.getAttribute("login_user");
                    if(user == null){
                        session.setAttribute("redirect", request.getHeader("referer"));
                        response.sendRedirect("login.jsp");
                    }else{
                        url = ADD_TO_CART_CONTROLLER;
                    }
                    break;
                case UPDATE_CART:
                    url = UPDATE_CART_CONTROLLER;
                    break;
                case REMOVE_ITEM:
                    url = REMOVE_ITEM_CONTROLLER;
                    break;
                case ADD_TO_WISH_LIST:
                    url = ADD_TO_WISH_LIST_CONTROLLER;
                    break;
                case REMOVE_FROM_WISH_LIST:
                    url = REMOVE_FROM_WISH_LIST_CONTROLLER;
                    break;
                case CHECK_OUT:
                    url = CHECK_OUT_CONTROLLER;
                    break;
                case EDIT_USER:
                    url = EDIT_USER_CONTROLLER;
                    break;
                case DELETE_USER:
                    url = DELETE_USER_CONTROLLER;
                    break;
                default:
                    request.setAttribute("error", "your action not support");
                    break;
            }
        } catch (Exception e) {
            log("Error at MainController : "+e.toString());
            e.printStackTrace();
        }finally{
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
