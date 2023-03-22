/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Category;
import model.Product;

/**
 *
 * @author Phuong-Linh
 */
@WebServlet(name = "ProductByCid", urlPatterns = {"/product"})
public class ProductByCid extends HttpServlet {

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
            out.println("<title>Servlet ProductByCid</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductByCid at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");
        request.setAttribute("taikhoan", a);
        ProductDAO p = new ProductDAO();
        CategoryDAO d = new CategoryDAO();
        String cid_raw = request.getParameter("cid");
        int cid;
        try {
            cid = Integer.parseInt(cid_raw);
            List<Product> listp = p.getProductByCid(cid);
            request.setAttribute("products", listp);
            ArrayList<Product> list4P = p.get4ProductsByCidAndIDDESC(cid);
            ArrayList<Product> list4bP = p.get4ProductsByCidAndUIS(cid);
            request.setAttribute("list4P", list4P);
            request.setAttribute("list4bP", list4bP);

        } catch (Exception e) {
            System.out.println(e);
        }

        ArrayList<Category> list = d.getAllCategory();
        request.setAttribute("data", list);
        request.getRequestDispatcher("productbycid.jsp").forward(request, response);
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
        String cid_raw = request.getParameter("cid");
        String sort = request.getParameter("sort");
         request.setAttribute("sort", sort);
            request.setAttribute("c", cid_raw);
            request.getRequestDispatcher("productbycid.jsp").forward(request, response);
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
