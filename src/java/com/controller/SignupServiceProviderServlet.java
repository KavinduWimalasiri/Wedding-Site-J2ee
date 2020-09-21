/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.model.DAO;
import com.model.ServiceProvider;
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
public class SignupServiceProviderServlet extends HttpServlet {

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
            out.println("<title>Servlet SPSignupServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SPSignupServlet at " + request.getContextPath() + "</h1>");
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
        
        String spcname = request.getParameter("spcname");
        String spuname = request.getParameter("spuname");
        String spcategory = request.getParameter("spcategory");
        String spemail = request.getParameter("spemail");
        String sppword = request.getParameter("sppword");
        String spcpword = request.getParameter("spcpword");
        
        ServiceProvider sp1 = new ServiceProvider();
        sp1.setCompanyname(spcname);
        sp1.setUsername(spuname);
        sp1.setEmail(spemail);
        sp1.setCategory(spcategory);
        sp1.setPassword(sppword);
        sp1.setRepassword(spcpword);
        ValidateForm valid=new ValidateForm();
             if(valid.emptyCompanyName(sp1)==1){
            request.setAttribute("ecmpn","ecmpn");
        }
        if(valid.emptyspUserName(sp1)==1){
            request.setAttribute("espun","espun");
        }
        if(valid.emptyspEmail(sp1)==1){
            request.setAttribute("espe","espe");
        }
        if(valid.emptyspCategory(sp1)==1){
            request.setAttribute("espc","espc");
        }
        if(valid.emptyspPassword(sp1)==1){
            request.setAttribute("espp","espp");
        }if(valid.emptyspRePassword(sp1)==1){
            request.setAttribute("esrpp","esrpp");
        }
        if(valid.checkSpPassword(sp1)!=1){
            request.setAttribute("wsppw","wsppw");
        }
       
        if(valid.emptyCompanyName(sp1)!=1&&valid.emptyspUserName(sp1)!=1&&valid.emptyspCategory(sp1)!=1&&
                valid.emptyspEmail(sp1)!=1&&valid.emptyspPassword(sp1)!=1&&valid.emptyspRePassword(sp1)!=1&&
                valid.checkSpPassword(sp1)==1)
        {    
        
        
        DAO insertserviceprovider = new DAO();
        try {
            insertserviceprovider.connection();
        } catch (Exception ex) {
            Logger.getLogger(SignupServiceProviderServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            insertserviceprovider.insertServiceProvider(sp1);
            HttpSession session = request.getSession();
            session.setAttribute("serviceprovider",spuname);
            response.sendRedirect("Home.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(SignupServiceProviderServlet.class.getName()).log(Level.SEVERE, null, ex);
        }}else{
            RequestDispatcher rs=request.getRequestDispatcher("SignupServiceprovider.jsp");
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
