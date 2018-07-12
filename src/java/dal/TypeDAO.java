/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Type;

/**
 *
 * @author DrAgOn
 */
public class TypeDAO extends BaseDAO<Type> {

    @Override
    public Type get(Type model) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<Type> getAll() {
        ArrayList<Type> types =  new ArrayList<>();
        try {
            String query = " 	SELECT [TypeID]\n"
                    + "		  ,[TypeName]\n"
                    + "		  ,[TypeNameShort]\n"
                    + "	  FROM [Type] ";
            PreparedStatement statement = connection.prepareCall(query);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Type t = new Type();
                t.setTypeId(rs.getInt("TypeID"));
                t.setTypeName(rs.getString("TypeName"));
                t.setTypeNameShort(rs.getString("TypeNameShort"));
                types.add(t);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return types;
    }

    @Override
    public int update(Type model) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int delete(Type model) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int insert(Type model) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
