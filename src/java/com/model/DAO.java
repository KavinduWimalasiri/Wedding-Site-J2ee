 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author Lakith
 */
public class DAO {
    
    Connection conn = null;
    String selectcustomer = "SELECT * FROM customer WHERE username = ? AND password = ?";
    String selectserviceprovider = "SELECT * FROM serviceprovider WHERE username = ? AND password = ?";
    String selectadmin = "SELECT * FROM admin WHERE adminname = ? AND password = ?";
    
    String retriveserviceprovider = "SELECT defvalue FROM serviceprovider WHERE username=?";
    
    String insertcustomer = "INSERT INTO customer VALUES (?,?,?,?,?)";
    String insertserviceprovider = "INSERT INTO serviceprovider VALUES (?,?,?,?,?,?,?,?,?,?,?)";
    
    String acceprserviceprovider = "UPDATE serviceprovider SET defvalue=? WHERE companyname=?";
    String rejectserviceprovider = "UPDATE serviceprovider SET defvalue=? WHERE companyname=?";
    
    String placeorder = "INSERT INTO sales VALUES (?,?,?,?,?,?,?)";
    String requestcompleteorder = "UPDATE sales SET defvalue=? WHERE cname=? AND spname=?";
    String confirmcompleteorder = "UPDATE sales SET defvalue=? WHERE cname=? AND spname=?";
    String updateratings = "UPDATE serviceprovider SET rating=?,attempts=? WHERE username=?";
    
    public void connection() throws Exception{
    
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/pwdb","root","");
        
    }
    
    public Connection ConnectionDB() throws ClassNotFoundException, SQLException
    {
       
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/pwdb","root","");
        return conn;
        
    }
    
    public boolean validateCustomerlogin(Customer cu) throws SQLException{
        
        PreparedStatement stmt = conn.prepareStatement(selectcustomer);
        stmt.setString(1,cu.getUsername());
        stmt.setString(2,cu.getPassword());
        ResultSet result = stmt.executeQuery();
        
        if(result.next()){
            return true;
        
        }
        
        return false;
        
    }
    public boolean validateServiceProviderlogin(ServiceProvider sp) throws SQLException{
        
        PreparedStatement stmt = conn.prepareStatement(selectserviceprovider);
        stmt.setString(1,sp.getUsername());
        stmt.setString(2,sp.getPassword());
        ResultSet result = stmt.executeQuery();
        
        if(result.next()){
            return true;
        
        }
        
        return false;
        
    }
    public int returndefvalue(ServiceProvider sp) throws SQLException{
        PreparedStatement stmt = conn.prepareStatement(retriveserviceprovider);
        stmt.setString(1, sp.getUsername());
        ResultSet rs = stmt.executeQuery();
        while(rs.next()){
        int defvalue = rs.getInt("defvalue");
            return defvalue;
        }
        return 5;
       
    }
    public boolean validateAdmin(Admin ad) throws SQLException{
        
        PreparedStatement stmt = conn.prepareStatement(selectadmin);
        stmt.setString(1,ad.getAdminname());
        stmt.setString(2,ad.getPassword());
        ResultSet result = stmt.executeQuery();
        
        if(result.next()){
            return true;
        
        }
        
        return false;
        
    }
    
    public void insertCustomer(Customer cu2) throws SQLException{
        PreparedStatement stmt = conn.prepareStatement(insertcustomer);
        stmt.setString(1,cu2.getName());
        stmt.setString(2,null);
        stmt.setString(3,cu2.getUsername());
        stmt.setString(4,cu2.getEmail());
        stmt.setString(5,cu2.getPassword());
        stmt.executeUpdate();
        
    }
    
    public void insertServiceProvider(ServiceProvider sp2) throws SQLException{
        PreparedStatement stmt = conn.prepareStatement(insertserviceprovider);
        stmt.setString(1,sp2.getCompanyname());
        stmt.setString(2, sp2.getUsername());
        stmt.setString(3,null);
        stmt.setString(4,sp2.getEmail());
        stmt.setString(5,sp2.getCategory());
        stmt.setString(6,sp2.getPassword());
        stmt.setString(7,"0");
        stmt.setString(8,"Your Company Details");
        stmt.setString(9,"Images/meeting.jpg");
        stmt.setString(10,"0");
        stmt.setString(11,"0");
        stmt.executeUpdate();
        
    }

    public void acceptservicerovider(ServiceProvider sp3) throws SQLException {
        PreparedStatement stmt = conn.prepareStatement(acceprserviceprovider);
        stmt.setInt(1,2);
        stmt.setString(2, sp3.getCompanyname());
        stmt.executeUpdate();
    }

    public void rejectservicerovider(ServiceProvider sp4) throws SQLException {
        PreparedStatement stmt = conn.prepareStatement(rejectserviceprovider);
        stmt.setInt(1,0);
        stmt.setString(2, sp4.getCompanyname());
        stmt.executeUpdate();
    }
    
    public void PlaceOrder(Order o)throws SQLException {
        PreparedStatement stmt = conn.prepareStatement(placeorder);
        stmt.setString(1, null);
        stmt.setString(2, o.getCname());
        stmt.setString(3, o.getSpname());
        stmt.setInt(4, 0);
        stmt.setString(5, o.getContactno());
        stmt.setString(6, o.getAddress());
        stmt.setString(7, o.getOtherdetails());
        stmt.executeUpdate();
    }


    public void completeorder(Order o) throws SQLException {
        PreparedStatement stmt = conn.prepareStatement(requestcompleteorder);
        stmt.setInt(1, 1);
        stmt.setString(2, o.getCname());
        stmt.setString(3, o.getSpname());
        stmt.executeUpdate();
    }

    public void confirmcompleteorder(Order o) throws SQLException {
        PreparedStatement stmt = conn.prepareStatement(confirmcompleteorder);
        stmt.setInt(1, 5);
        stmt.setString(2, o.getCname());
        stmt.setString(3, o.getSpname());
        stmt.executeUpdate();
    }

    public void updateratings(ServiceProvider sp) throws SQLException {
        PreparedStatement stmt = conn.prepareStatement(updateratings);
        stmt.setInt(1, sp.getRatings());
        stmt.setInt(2, sp.getAttempts());
        stmt.setString(3, sp.getUsername());
        stmt.executeUpdate();
    }
    
}