/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Objects;

/**
 *
 * @author DrAgOn
 */
public class Source {

    private int sourceId;
    private String sourceName;

    public Source() {
    }

    public Source(int sourceId, String sourceName) {
        this.sourceId = sourceId;
        this.sourceName = sourceName;
    }

    public int getSourceId() {
        return sourceId;
    }

    public void setSourceId(int sourceId) {
        this.sourceId = sourceId;
    }

    public String getSourceName() {
        return sourceName;
    }

    public void setSourceName(String sourceName) {
        this.sourceName = sourceName;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof Source)) {
            return false;
        }
        Source _obj = (Source) obj;
        return _obj.getSourceId() == this.sourceId && _obj.getSourceName().equalsIgnoreCase(this.sourceName);
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 29 * hash + this.sourceId;
        hash = 29 * hash + Objects.hashCode(this.sourceName);
        return hash;
    }
}
