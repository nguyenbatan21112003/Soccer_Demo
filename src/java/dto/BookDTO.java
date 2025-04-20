/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author bacda
 */
public class BookDTO {
    
    private String fullname ;
    private String field ;
    private String location ;
    private double price ;
    private String time ;
    private String status ;
    private String date;
    private String bookingid;
    public BookDTO(String fullname, String field, String location, double price, String time, String status,String date) {
        this.fullname = fullname;
        this.field = field;
        this.location = location;
        this.price = price;
        this.time = time;
        this.status = status;
        this.date=date;
    }

    public String getBookingid() {
        return bookingid;
    }

    public void setBookingid(String bookingid) {
        this.bookingid = bookingid;
    }

    public BookDTO(String fullname, String field, String location, double price, String time, String status, String date, String bookingid) {
        this.fullname = fullname;
        this.field = field;
        this.location = location;
        this.price = price;
        this.time = time;
        this.status = status;
        this.date = date;
        this.bookingid = bookingid;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    
    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getField() {
        return field;
    }

    public void setField(String field) {
        this.field = field;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
}
