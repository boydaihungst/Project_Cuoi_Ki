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
public class Favorite {
    private int accId;
    private int aniId;
    private Date addedDate;

    public Favorite() {
    }

    public Favorite(int accId, int aniId, Date addedDate) {
        this.accId = accId;
        this.aniId = aniId;
        this.addedDate = addedDate;
    }

    public int getAccId() {
        return accId;
    }

    public void setAccId(int accId) {
        this.accId = accId;
    }

    public int getAniId() {
        return aniId;
    }

    public void setAniId(int aniId) {
        this.aniId = aniId;
    }

    public Date getAddedDate() {
        return addedDate;
    }

    public void setAddedDate(Date addedDate) {
        this.addedDate = addedDate;
    }
    
}
