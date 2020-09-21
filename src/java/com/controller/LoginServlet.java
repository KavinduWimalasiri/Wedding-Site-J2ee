/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.model.Admin;
import com.model.Customer;
import com.model.DAO;
import com.model.ServiceProvider;
import com.model.ValidateForm;
import java.io.IOException;
import java.io.PrintWriter;
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
public class LoginServlet extends HttpServlet {

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
            out.println("<title>Servlet LoginServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
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
        String uname = request.getParameter("uname");
        String upword = request.getParameter("upword");
        
        
        Customer cu =  new Customer();
        cu.setUsername(uname);
        cu.setPassword(upword);
        
        ServiceProvider sp = new ServiceProvider();
        sp.setUsername(uname);
        sp.setPassword(upword);
        
        Admin ad = new Admin();
        ad.setAdminname(uname);
        ad.setPassword(upword);
        
        DAO result = new DAO();
        ValidateForm validate=new ValidateForm();
        if(validate.ifExmpty(cu, sp,ad)==1&&validate.ifEmptyPassword(cu,sp,ad)==1){
            request.setAttribute("emptyboth","imageboth");
            RequestDispatcher rs=request.getRequestDispatcher("Login.jsp");
            rs.forward(request, response);
           
        }else if(validate.ifEmptyPassword(cu,sp,ad)==1){
            request.setAttribute("emptypassword","emptypassword");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
          
        }
        else if(validate.ifExmpty(cu, sp,ad)==1){
            request.setAttribute("emptyname","emptyname");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
          
        }else{
        
        try {
            result.connection();
            
            if(result.validateCustomerlogin(cu)){
               
                HttpSession session = request.getSession();
                session.setAttribute("customer",uname);
                response.sendRedirect("Home.jsp");
                
            
            }
            else if(result.validateServiceProviderlogin(sp)){
                int defvalue=result.returndefvalue(sp);
                if(defvalue==0){
                    HttpSession session = request.getSession();
                    session.setAttribute("serviceprovider",uname);
                }
                else if(defvalue==1){
                    HttpSession session = request.getSession();
                    session.setAttribute("submitedsp",uname);
                }
                else if(defvalue==2 || defvalue==3 ){
                    HttpSession session = request.getSession();
                    session.setAttribute("acceptedsp",uname);
                }
                response.sendRedirect("Home.jsp");
            }
            else if(result.validateAdmin(ad)){
                HttpSession session = request.getSession();
                session.setAttribute("admin",uname);
                response.sendRedirect("Home.jsp");
                
            }else{
                response.sendRedirect("Login.jsp");
            }
            //response.sendRedirect("Home.jsp");
            
        } catch (Exception ex) {
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