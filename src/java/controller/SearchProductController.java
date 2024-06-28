/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.product.ProductDAO;
import model.product.ProductDTO;
import model.user.UserDTO;

/**
 *
 * @author quang
 */
public class SearchProductController extends HttpServlet {

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
        String url = constants.Constant.ERROR_PAGE;
        String action = request.getParameter("get");
        ProductDAO dao = new ProductDAO();
        List<ProductDTO> list = new ArrayList<>();
        
        HttpSession session = request.getSession();
        UserDTO user = (UserDTO)session.getAttribute("login_user");
        try{
            if("search".equals(action)){
                String search_name = request.getParameter("search-name");
                String search_cate = request.getParameter("search-cate");
                String min_price_para = request.getParameter("min-price");
                String max_price_para = request.getParameter("max-price");
                String search_brand = request.getParameter("search-brand");
                String sort = request.getParameter("sort");
                Double min_price = parseDoublePara(min_price_para);
                Double max_price = parseDoublePara(max_price_para);
                
                if(hasSearchCriteria(search_name, search_cate, min_price, max_price, search_brand, sort)){
                   list = dao.getByCriteria(search_name, search_cate, min_price, max_price, search_brand, sort);
                    System.out.println(list);
                }else{
                    list = dao.getAllProduct();
                }
                if(list.size() > 0){
                    request.setAttribute("product_list", list);
                }
                if(user == null || "user".equals(user.getRole())){
                    url = "shop.jsp";
                }else if("staff".equals(user.getRole()) || "manager".equals(user.getRole())){
                    url = "productManager.jsp";
                }
//                for(ProductDTO prod : list){
//                    System.out.println(prod.getProd_name());
//                }
            }
        }catch(Exception e){
            e.printStackTrace();
            request.setAttribute("error", e);
        }
        request.getRequestDispatcher(url).forward(request, response);
    }
    
    private Double parseDoublePara(String para){
        if(para != null && !para.trim().isEmpty()){
            try{
                return Double.parseDouble(para);
            }catch(Exception e){
                e.printStackTrace();
            }
        }
        return null;
    }
    
    private boolean hasSearchCriteria(String name, String category, Double min_pirce, Double max_price, String brand, String sort){
        return (name != null && !name.trim().isEmpty()||
                category != null && !category.trim().isEmpty()||
                min_pirce != null||
                max_price != null||
                brand != null && !brand.trim().isEmpty() ||
                sort != null && !sort.trim().isEmpty());
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
