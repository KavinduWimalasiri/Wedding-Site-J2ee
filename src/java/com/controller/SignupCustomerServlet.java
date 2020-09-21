/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.model.Customer;
import com.model.DAO;
import com.model.ValidateForm;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Lakith
 */
public class SignupCustomerServlet extends HttpServlet {

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
            out.println("<title>Servlet CSignupServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CSignupServlet at " + request.getContextPath() + "</h1>");
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
        
        String cname = request.getParameter("cname");
        String cuname = request.getParameter("cuname");
        String cemail = request.getParameter("cemail");
        String cpword = request.getParameter("cpword");
        String ccpword = request.getParameter("ccpword");
        
        Customer cu1 = new Customer();
        cu1.setName(cname);
        cu1.setUsername(cuname);
        cu1.setEmail(cemail);
        cu1.setPassword(cpword);
        cu1.setRepassword(ccpword);
        ValidateForm validateo=new ValidateForm();
        if(validateo.emptyClientName(cu1)==1){
            request.setAttribute("ecn","ecn");
        }
        if(validateo.emptyClientUName(cu1)==1){
            request.setAttribute("ecun","ecun");
        }
        if(validateo.emptyClientEmail(cu1)==1){
            request.setAttribute("ece","ece");
        }
        if(validateo.emptyClientPassword(cu1)==1){
            request.setAttribute("ecpw","ecpw");
        }
        if(validateo.emptyClientRePassword(cu1)==1){
            request.setAttribute("ecrpw","ecrpw");
        }if(validateo.checkCustomerPassword(cu1)==0){
            request.setAttribute("wpw","wpw");
        }
        if(validateo.emptyClientName(cu1)!=1&&validateo.emptyClientUName(cu1)!=1&&validateo.emptyClientEmail(cu1)!=1&&validateo.emptyClientPassword(cu1)!=1&&validateo.emptyClientRePassword(cu1)!=1&&validateo.emptyClientEmail(cu1)!=1&&validateo.emptyClientPassword(cu1)!=1&&validateo.checkCustomerPassword(cu1)==1)
        {    
        
        
        DAO insertcustomer = new DAO();
        try {
            insertcustomer.connection();
        } catch (Exception ex) {
            Logger.getLogger(SignupCustomerServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            insertcustomer.insertCustomer(cu1);
            HttpSession session = request.getSession();
            session.setAttribute("customer",cuname);
            response.sendRedirect("Home.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(SignupCustomerServlet.class.getName()).log(Level.SEVERE, null, ex);
        }}else{
            RequestDispatcher rs=request.getRequestDispatcher("SignupCustomer.jsp");
            rs.forward(request, response);}
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
