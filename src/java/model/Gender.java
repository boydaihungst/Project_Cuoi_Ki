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
    private int genId;
    private String genName;

    public Gender() {
    }

    public Gender(int genId, String genName) {
        this.genId = genId;
        this.genName = genName;
    }

    public int getGenId() {
        return genId;
    }

    public void setGenId(int genId) {
        this.genId = genId;
    }

    public String getGenName() {
        return genName;
    }

    public void setGenName(String genName) {
        this.genName = genName;
    }
    
    
}
