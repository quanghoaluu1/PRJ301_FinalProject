/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

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
public class EditUserController extends HttpServlet {

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
        String url = "userManager.jsp";
       try{
           String userID = request.getParameter("user-id");
           String fullName = request.getParameter("user-name");
           String role = request.getParameter("role");
           UserDTO user = new UserDTO(userID, fullName, role, "");
           UserDAO dao = new UserDAO();
           HttpSession session = request.getSession();
           UserDTO loginUser = (UserDTO)session.getAttribute("login_user");
           if(loginUser.getUser_id().equals(userID)){
               loginUser.setUser_name(fullName);
               loginUser.setRole(role);
               session.setAttribute("login_user", loginUser);
           }
           boolean check = dao.editUser(user);
           
           if(check){
               if(loginUser.getRole().equals("manager")){
               url = "userManager.jsp";
               }else if(loginUser.getRole().equals("staff") || loginUser.getRole().equals("user")){
                   url = "user.jsp";
               }
           }else{
               request.setAttribute("ERROR", "Update failed");
           }
           
       }catch(Exception e){
           log("Error at UpdateController: " + e.toString());
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
