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
public class Type {
    private int typeId;
    private String typeName;
    private String typeNameShort;
    
    public Type() {
    }

    public String getTypeNameShort() {
        return typeNameShort;
    }

    public void setTypeNameShort(String typeNameShort) {
        this.typeNameShort = typeNameShort;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }
    
}
