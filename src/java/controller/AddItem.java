/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;
import model.Item;
import model.Product;

/**
 *
 * @author Phuong-Linh
 */
@WebServlet(name = "AddItem", urlPatterns = {"/additem"})
public class AddItem extends HttpServlet {

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
            out.println("<title>Servlet AddItem</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddItem at " + request.getContextPath() + "</h1>");
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

        String id_raw = request.getParameter("id");
        String quantity = request.getParameter("quantity");
        ProductDAO dao = new ProductDAO();
        HttpSession session = request.getSession();
        Object o = session.getAttribute("cart");
        Cart cart = null;
        if (o != null) {
            cart = (Cart) o;
        } else {
            cart = new Cart();
        }
        try {
            int id = Integer.parseInt(id_raw);
            int q = Integer.parseInt(quantity);
            Product p = dao.getProductById(id);
            Item i = new Item(p, q, p.getPrice());
            cart.addItem(i);
            session.setAttribute("cart", cart);
        } catch (Exception e) {
            System.out.println(e);
        }
        PrintWriter out = response.getWriter();
        //out.println(cart.getItems().get(0).getProduct().getName());
        //out.print(quantity);
        response.sendRedirect("shoppingcart");

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
