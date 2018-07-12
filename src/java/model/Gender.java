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
public class Gender {
    private int catId;
    private String catName;
    private String catDesc;

    public Gender(int catId, String catName) {
        this.catId = catId;
        this.catName = catName;
    }

    public Gender() {
    }

    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }

    public String getCatName() {
        return catName;
    }

    public void setCatName(String catName) {
        this.catName = catName;
    }

    public String getCatDesc() {
        return catDesc;
    }

    public void setCatDesc(String catDesc) {
        this.catDesc = catDesc;
    }

    @Override
    public boolean equals(Object obj) {
        Gender temp = (Gender) obj;
        return temp.getCatId()==this.catId;
    }
    
}
