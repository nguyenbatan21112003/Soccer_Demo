/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.sql.Date;

/**
 *
 * @author bacda
 */
public class FieldDTO {
    private String fieldID;
    private String fieldName;
    private String description;
    private String location;
    private double price;
    private String imageURL;
    private String amenities;
    

    public FieldDTO() {
    }

    public FieldDTO(String fieldID, String fieldName, String description, String location, double price, String imageURL, String amenities) {
        this.fieldID = fieldID;
        this.fieldName = fieldName;
        this.description = description;
        this.location = location;
        this.price = price;
        this.imageURL = imageURL;
        this.amenities = amenities;
        
    }

    public String getFieldID() {
        return fieldID;
    }

    public void setFieldID(String fiesldID) {
        this.fieldID = fieldID;
    }

    public String getFieldName() {
        return fieldName;
    }

    public void setFieldName(String fieldName) {
        this.fieldName = fieldName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public String getAmenities() {
        return amenities;
    }

    public void setAmenities(String amenities) {
        this.amenities = amenities;
    }

    

    
}