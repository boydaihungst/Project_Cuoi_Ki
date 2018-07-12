/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author DrAgOn
 */
public class Anime implements Serializable{
    private int aniId;
    private int catId;
    private String aniName;
    private int aniSeason;
    private Date releaseTime;
    private int aniStatus;
    private int epsMax;
    private Date updateTime;
    private int epsRel;
    private String desc;
    private String picture;
    private int totalWatch;
    private int totalSubscriber;
    private Type type;
    private ArrayList<Gender> gender= new ArrayList<>();
    private ArrayList<String> wallpager = new ArrayList<>();
    private String trailer = new String();
    public Anime() {
    }

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }

    public int getTotalSubscriber() {
        return totalSubscriber;
    }

    public void setTotalSubscriber(int totalSubscriber) {
        this.totalSubscriber = totalSubscriber;
    }

    public int getTotalWatch() {
        return totalWatch;
    }

    public void setTotalWatch(int totalWatch) {
        this.totalWatch = totalWatch;
    }

    public ArrayList<String> getWallpager() {
        return wallpager;
    }

    public void setWallpager(ArrayList<String> wallpager) {
        this.wallpager = wallpager;
    }

    public String getTrailer() {
        return trailer;
    }

    public void setTrailer(String trailer) {
        this.trailer = trailer;
    }

    public ArrayList<Gender> getGender() {
        return gender;
    }

    public void setGender(ArrayList<Gender> gender) {
        this.gender = gender;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }
    
    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public int getEpsRel() {
        return epsRel;
    }

    public void setEpsRel(int epsRel) {
        this.epsRel = epsRel;
    }

    

    public int getAniId() {
        return aniId;
    }

    public void setAniId(int aniId) {
        this.aniId = aniId;
    }

    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }

    public String getAniName() {
        return aniName;
    }

    public void setAniName(String aniName) {
        this.aniName = aniName;
    }

    public int getAniSeason() {
        return aniSeason;
    }

    public void setAniSeason(int aniSeason) {
        this.aniSeason = aniSeason;
    }

    public Date getReleaseTime() {
        return releaseTime;
    }

    public void setReleaseTime(Date releaseTime) {
        this.releaseTime = releaseTime;
    }

    public int getAniStatus() {
        return aniStatus;
    }

    public void setAniStatus(int aniStatus) {
        this.aniStatus = aniStatus;
    }

    public int getEpsMax() {
        return epsMax;
    }

    public void setEpsMax(int NOEps) {
        this.epsMax = NOEps;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    @Override
    public String toString() {
        return "Anime{" + "aniId=" + aniId + ", catId=" + catId + ", aniName=" + aniName + ", aniSeason=" + aniSeason + ", releaseTime=" + releaseTime + ", aniStatus=" + aniStatus + ", epsMax=" + epsMax + ", updateTime=" + updateTime + ", epsRel=" + epsRel + '}';
    }
    
}
