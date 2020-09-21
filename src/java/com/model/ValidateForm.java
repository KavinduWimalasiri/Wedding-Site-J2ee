
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

/**
 *
 * @author Lakith
 */
public class ValidateForm {
    

    
    public int ifExmpty(Customer one,ServiceProvider two,Admin three){
           if(one.getUsername().length()==0||two.getUsername().length()==0||three.getAdminname().length()==0)
           {
           return 1;
           }else
           return 0;
 
            }
    
    
    
    public int ifEmptyPassword(Customer one,ServiceProvider two,Admin three)
    {
            if(one.getPassword().length()==0||two.getPassword().length()==0||three.getPassword().length()==0)
           {
           return 1;
           }else
           return 0;
 
    }    
    
//validate client sign
    public int emptyClientUName(Customer one){
    if(one.getUsername().length()==0){
    return 1;
    }else 
    
    return 0;
    
    }
    public int emptyClientName(Customer one){
    if(one.getName().length()==0){
    return 1;
    }else 
    
    return 0;
    
    }
    public int emptyClientEmail(Customer one){
    if(one.getEmail().length()==0){
    return 1;
    }else 
    
            return 0;
    
    }
    public int emptyClientPassword(Customer one){
    if(one.getPassword().length()==0){
    return 1;
    }else 
    
            return 0;
    
    }
    public int emptyClientRePassword(Customer one){
    if(one.getRepassword().length()==0){
    return 1;
    }else 
    
            return 0;
    
    }
    //check password similarity
    public int checkCustomerPassword(Customer one){
    if(one.getPassword().equals(one.getRepassword())){
    return 1;
    }else
    return 0;
        
    }
    
    //validate sp sign
     public int emptyCompanyName(ServiceProvider one){
    if(one.getCompanyname().length()==0){
    return 1;
    }else 
    
    return 0;
    
    }
    public int emptyspUserName(ServiceProvider one){
    if(one.getUsername().length()==0){
    return 1;
    }else 
    
    return 0;
    
    }
    public int emptyspEmail(ServiceProvider one){
    if(one.getEmail().length()==0){
    return 1;
    }else 
    
            return 0;
    
    }
    public int emptyspCategory(ServiceProvider one){
    if(one.getCategory().equals("category")){
    return 1;
    }else 
    
            return 0;
    
    }
    public int emptyspPassword(ServiceProvider one){
    if(one.getPassword().length()==0){
    return 1;
    }else 
    
            return 0;
    
    }
    public int emptyspRePassword(ServiceProvider one){
    if(one.getRepassword().length()==0){
    return 1;
    }else 
    
            return 0;
    
    }
    public int checkSpPassword(ServiceProvider one){
    if(one.getPassword().equals(one.getRepassword())){
    return 1;
    }else
    return 0;
        
    }

    
    
    }


    

