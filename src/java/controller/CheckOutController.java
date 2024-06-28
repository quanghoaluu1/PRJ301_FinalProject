/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.cart.CartDAO;
import model.cart.CartDTO;
import model.order.OrderDAO;
import model.order.OrderDTO;
import model.user.UserDTO;

/**
 *
 * @author quang
 */
public class CheckOutController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try{
        HttpSession session = request.getSession();
        UserDTO user = (UserDTO)session.getAttribute("login_user");
        CartDAO cartDAO = new CartDAO();
        List<CartDTO> cart = cartDAO.getItems(user.getUser_id());
        if(cart != null && !cart.isEmpty()){
            OrderDAO orderDAO = new OrderDAO();
            if(orderDAO.isStockAvailable(cart)){
            List<OrderDTO> orders = new ArrayList<>();
                Timestamp time_now = Timestamp.valueOf(LocalDateTime.now(ZoneId.systemDefault()));
            for(CartDTO item : cart){
                OrderDTO order = new OrderDTO(item.getUser_id(), item.getProd_id(), item.getQuantity(), time_now);
                orders.add(order);
            }
            
        orderDAO.saveOrders(orders);
        cartDAO.clearItems(user.getUser_id());
        }else{
                request.setAttribute("msg", "Out of Stock");
            }
        }
        
        }catch(Exception e){
            log(e.toString());
            e.printStackTrace();
        }finally{
            request.getRequestDispatcher("thankyou.jsp").forward(request, response);
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
