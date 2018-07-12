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
public class ErrorReport {
    private int errId;
    private int aniId;
    private int epId;
    private int epNum;
    private int srcId;
    
    public ErrorReport() {
    }

    public int getEpNum() {
        return epNum;
    }

    public void setEpNum(int epNum) {
        this.epNum = epNum;
    }

    public int getErrId() {
        return errId;
    }

    public void setErrId(int errId) {
        this.errId = errId;
    }

    public int getAniId() {
        return aniId;
    }

    public void setAniId(int aniId) {
        this.aniId = aniId;
    }

    public int getEpId() {
        return epId;
    }

    public void setEpId(int epId) {
        this.epId = epId;
    }

    public int getSrcId() {
        return srcId;
    }

    public void setSrcId(int srcId) {
        this.srcId = srcId;
    }
    
}
