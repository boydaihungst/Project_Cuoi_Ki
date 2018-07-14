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
public class Episode {
    private int epId;
    private int aniId;
    private int epNumber;
    private Source source;
    private String url;
    public Episode() {
    }

    public int getEpId() {
        return epId;
    }

    public void setEpId(int epId) {
        this.epId = epId;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Source getSource() {
        return source;
    }

    public void setSource(Source source) {
        this.source = source;
    }

    public Episode(int aniId) {
        this.aniId = aniId;
    }

    public int getAniId() {
        return aniId;
    }

    public void setAniId(int aniId) {
        this.aniId = aniId;
    }

    public int getEpNumber() {
        return epNumber;
    }

    public void setEpNumber(int epNumber) {
        this.epNumber = epNumber;
    }

    
    
}
