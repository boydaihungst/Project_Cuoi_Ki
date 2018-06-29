/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author DrAgOn
 */
public class ClickStats {
    private int aniID;
    private int timeClicked;
    private Date date;
    public ClickStats() {
    }

    public int getAniID() {
        return aniID;
    }

    public void setAniID(int aniID) {
        this.aniID = aniID;
    }

    public int getTimeClicked() {
        return timeClicked;
    }

    public void setTimeClicked(int timeClicked) {
        this.timeClicked = timeClicked;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    
}
