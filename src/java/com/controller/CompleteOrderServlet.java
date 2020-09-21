/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.model.DAO;
import com.model.Order;
import com.model.ServiceProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Lakith
 */
public class CompleteOrderServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CompleteOrderServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CompleteOrderServlet at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        if(request.getParameter("requestcomplete")!=null){
            String spname=request.getParameter("spname");
            String cname=request.getParameter("cname");

            Order o1 = new Order();
            o1.setCname(cname);
            o1.setSpname(spname);

            DAO complete = new DAO();
            try {
                complete.connection();
            } catch (Exception ex) {
                Logger.getLogger(CompleteOrderServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                complete.completeorder(o1);
                response.sendRedirect("Orders.jsp");
            } catch (SQLException ex) {
                Logger.getLogger(CompleteOrderServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        else if(request.getParameter("confirmcomplete")!=null){
            
            String spname=request.getParameter("spname");
            String cname=request.getParameter("cname");
            int oldratings = Integer.parseInt(request.getParameter("oldratings"));
            int attempts = Integer.parseInt(request.getParameter("attempts"));
            int currentratings;
            int currentattempts;
            
            if(request.getParameter("rating")!=null){
                
                int newratings = Integer.parseInt(request.getParameter("rating"));
                
                    
                if(Integer.parseInt(request.getParameter("oldratings")) == 0){

                    currentratings = newratings;
                    currentattempts = 1;
                }
                else{
                    
                    currentratings = ((oldratings*attempts)+newratings)/(attempts+1);
                    currentattempts = attempts+1;
                }
            }
            else{
                currentratings = oldratings;
                currentattempts = attempts;
            }
            
            ServiceProvider sp = new ServiceProvider();
            sp.setUsername(spname);
            sp.setRatings(currentratings);
            sp.setAttempts(currentattempts);
            
            Order o = new Order();
            o.setCname(cname);
            o.setSpname(spname);
            
            DAO confirm = new DAO();
            try {
                confirm.connection();
                confirm.confirmcompleteorder(o);
                confirm.updateratings(sp);
                response.sendRedirect("Cart.jsp");
            } catch (Exception ex) {
                Logger.getLogger(CompleteOrderServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        }
        
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
