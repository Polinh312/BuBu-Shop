/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CountryDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Country;
import model.Product;

/**
 *
 * @author Phuong-Linh
 */
@WebServlet(name = "SearchMany", urlPatterns = {"/searchmany"})
public class SearchMany extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SearchMany</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchMany at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String category = request.getParameter("category");
        String price = request.getParameter("price");
        String country = request.getParameter("country");
        String pfrom, pto;
        ProductDAO p = new ProductDAO();
        try {
            if (price == null) {
                pfrom = null;
                pto = null;
            } else if (price.equals("1")) {
                pfrom = "0";
                pto = "50000";
            } else if (price.equals("2")) {
                pfrom = "50000";
                pto = "100000";
            } else if (price.equals("3")) {
                pfrom = "100000";
                pto = "200000";
            } else {
                pfrom = "200000";
                pto = "1000000";
            }
            ArrayList<Product> list = p.getProductByCidPriceCountry(category, country, pfrom, pto);
            int s = list.size();
            request.setAttribute("listsearch", list);
            request.setAttribute("size", s);
        } catch (Exception e) {
            System.out.println(e);
        }
        request.getRequestDispatcher("shop").forward(request, response);
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
