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
public class TimeSlotDTO {
    String slotID;
    String time;

    public TimeSlotDTO() {
    }

    public TimeSlotDTO(String slotID, String time) {
        this.slotID = slotID;
        this.time = time;
    }

    public String getSlotID() {
        return slotID;
    }

    public void setSlotID(String slotID) {
        this.slotID = slotID;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
    
    
}
