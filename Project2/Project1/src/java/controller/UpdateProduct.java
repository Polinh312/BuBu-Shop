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
import model.Account;
import model.Category;
import model.Product;

/**
 *
 * @author Phuong-Linh
 */
@WebServlet(name = "UpdateProduct", urlPatterns = {"/updateproduct"})
public class UpdateProduct extends HttpServlet {

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
            out.println("<title>Servlet UpdateProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateProduct at " + request.getContextPath() + "</h1>");
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
        Account acc = (Account) session.getAttribute("account");
        request.setAttribute("acc", acc);
        ProductDAO d = new ProductDAO();
        String id_raw = request.getParameter("id");
        try {
            int id = Integer.parseInt(id_raw);
            Product p = d.getProductById(id);
            String cname = p.getCategory().getName();
            int cid = p.getCategory().getId();
            request.setAttribute("product", p);
            request.setAttribute("cname", cname);
            request.setAttribute("cid", cid);
        } catch (Exception e) {
            System.out.println(e);
        }
        request.getRequestDispatcher("updateproduct.jsp").forward(request, response);
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
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String description = request.getParameter("description");
        String discount = request.getParameter("discount");
        String stock = request.getParameter("stock");
        String cid = request.getParameter("category");
        String image = request.getParameter("image");
        String weight = request.getParameter("weight");
        String country = request.getParameter("country");
        CategoryDAO d = new CategoryDAO();
        ProductDAO p = new ProductDAO();
        try {
            int masp = Integer.parseInt(id);
            int c = Integer.parseInt(cid);
            double gia = Double.parseDouble(price);
            int unitstock = Integer.parseInt(stock);
            Category cat = d.getCategoryByID(c);
            p.updateProduct(new Product(masp, name, gia, description, discount, unitstock, cat, image, weight, country));
        } catch (Exception e) {
            System.out.println(e);
        }
        response.sendRedirect("manageproduct");
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
