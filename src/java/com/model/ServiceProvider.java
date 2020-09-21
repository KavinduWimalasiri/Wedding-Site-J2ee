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
public class ServiceProvider {
    
    private String companyname;
    private String username;
    private String password;
    private String repassword;
    private String email;
    private String category;
    private int defvalue;
    private int ratings;
    private int attempts;

    public ServiceProvider() {
    }

    public ServiceProvider(String companyname, String password, String email, String category) {
        this.companyname = companyname;
        this.password = password;
        this.email = email;
        this.category = category;
    }

    public String getCompanyname() {
        return companyname;
    }
    

    public void setCompanyname(String companyname) {
        this.companyname = companyname;
    }
    
    public String getUsername() {
        return username;
    }

    public String getRepassword() {
        return repassword;
    }

    public void setRepassword(String repassword) {
        this.repassword = repassword;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getDefvalue() {
        return defvalue;
    }

    public void setDefvalue(int defvalue) {
        this.defvalue = defvalue;
    }

    public int getRatings() {
        return ratings;
    }

    public void setRatings(int ratings) {
        this.ratings = ratings;
    }

    public int getAttempts() {
        return attempts;
    }

    public void setAttempts(int attempts) {
        this.attempts = attempts;
    }
    
    
    
    
    
}
