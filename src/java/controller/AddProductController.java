/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.product.ProductDAO;

/**
 *
 * @author quang
 */
    @MultipartConfig
public class AddProductController extends HttpServlet {

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
        String url = "addProduct.jsp";
        try {

//            String fileName = request.getParameter("image");
            String prod_id = request.getParameter("prod-id");
            String prod_name = request.getParameter("prod-name");
            String category = request.getParameter("category");
            double price = Double.parseDouble(request.getParameter("price"));
            BigDecimal priceRounded = new BigDecimal(price).setScale(2, RoundingMode.HALF_UP);
            price = priceRounded.doubleValue();

            int stock = Integer.parseInt(request.getParameter("stock"));
            String description = request.getParameter("description");
            double discount = Double.parseDouble(request.getParameter("discount"));
            String brand = request.getParameter("brand");

            Part filePart = request.getPart("image");
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            InputStream fileContent = filePart.getInputStream();
            File uploads = new File(getServletContext().getRealPath("/") + "/images");
            File file = new File(uploads, fileName);
            Files.copy(fileContent, file.toPath(), StandardCopyOption.REPLACE_EXISTING);

//            String prod_id = "H";
//            String prod_name = "B";
//            String category = "C";
//            double price = 100.11;
//            int stock = 1;
//            String description = "D";
//            double discount = 0.5;
//            String brand = "E";
//            String fileName = "F";
            ProductDAO dao = new ProductDAO();
            boolean result = true;
            result = dao.addProduct(prod_id, prod_name, category, price, stock, description, discount, brand, fileName);
            if (result) {
                url = "productManager.jsp";
                request.setAttribute("msg", "Add Successfully");
            } else {
                request.setAttribute("msg", "Add fail");

            }
        } catch (Exception e) {
            log(e.toString());
            request.setAttribute("msg", e);
            e.printStackTrace();
        }
        request.getRequestDispatcher(url).forward(request, response);

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
