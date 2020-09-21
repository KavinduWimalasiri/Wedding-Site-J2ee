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
public class Order {
    String cname;
    String spname;
    String contactno;
    String address;
    String otherdetails;

    public Order() {
    }

    public Order(String cname, String spname,String contactno, String address, String otherdetails) {
        this.cname = cname;
        this.spname = spname;

        this.contactno = contactno;
        this.address = address;
        this.otherdetails = otherdetails;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getSpname() {
        return spname;
    }

    public void setSpname(String spname) {
        this.spname = spname;
    }

    public String getContactno() {
        return contactno;
    }

    public void setContactno(String contactno) {
        this.contactno = contactno;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getOtherdetails() {
        return otherdetails;
    }

    public void setOtherdetails(String otherdetails) {
        this.otherdetails = otherdetails;
    }

    

    
    
    
    
}

