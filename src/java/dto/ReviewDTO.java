/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author Admin
 */
public class ReviewDTO {
    private String fullname;
    private String rating;
    private String content;
    private String timecmt;

    public ReviewDTO(String fullname, String rating, String content, String timecmt) {
        this.fullname = fullname;
        this.rating = rating;
        this.content = content;
        this.timecmt = timecmt;
    }

    public ReviewDTO() {
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getRating() {
        return rating;
    }

    public void setRating(String rating) {
        this.rating = rating;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTimecmt() {
        return timecmt;
    }

    public void setTimecmt(String timecmt) {
        this.timecmt = timecmt;
    }
    
    
}
