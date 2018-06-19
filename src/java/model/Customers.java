/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author DrAgOn
 */
public class Customers {

    private int cusID;
    private String cusName;
    private String address;
    private String city;
    private String phone;

    public Customers() {
    }

    public Customers(int cusID, String contactName, String address, String city, String phone) {
        this.cusID = cusID;
        this.cusName = contactName;
        this.address = address;
        this.city = city;
        this.phone = phone;
    }

    public Customers(String contactName, String address, String city, String phone) {
        this.cusName = contactName;
        this.address = address;
        this.city = city;
        this.phone = phone;
    }

    public Customers(int cusID) {
        this.cusID = cusID;
    }

    public int getCusID() {
        return cusID;
    }

    public void setCusID(int cusID) {
        this.cusID = cusID;
    }

    public String getCusName() {
        return cusName;
    }

    public void setCusName(String contactName) {
        this.cusName = contactName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

}
