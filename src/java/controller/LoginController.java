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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.user.UserDAO;
import model.user.UserDTO;

/**
 *
 * @author quang
 */
public class LoginController extends HttpServlet {

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
        String url = "login.jsp";
        
        try{
            String user_id = request.getParameter("user_id");
        String password = request.getParameter("password");
        UserDAO dao = new UserDAO();
        UserDTO user = dao.checkLogin(user_id, password);
        if(user != null){
            HttpSession session = request.getSession();
            session.setAttribute("login_user", user);
            String redirectUrl = (String)session.getAttribute("redirectUrl");
            if(redirectUrl != null){
                session.removeAttribute("redirectUrl");
                response.sendRedirect(redirectUrl);
            }else{
            if(user.getRole().equals("manager") || user.getRole().equals("staff")){
                url = Constant.STAFF_PAGE;
            }else if(user.getRole().equals("user")){
                url = "shop.jsp";
            }else{
            request.setAttribute("error", "Your role is not supported");
        }}
        }else{
            request.setAttribute("error", "Incorrect user id or password");
        }
        }catch(Exception e){
            log("error at LoginController"+e.toString());
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
