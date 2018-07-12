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
import model.Anime;
import model.Gender;

/**
 *
 * @author DrAgOn
 */
public class GenderDAO extends BaseDAO<Gender> {

    @Override
    public Gender get(Gender model) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<Gender> getAll() {
        ArrayList<Gender> cats = new ArrayList<>();
        try {
            String query = "SELECT [CatID]\n"
                    + "      ,[CatName]\n"
                    + "      ,[Desc]\n"
                    + "  FROM [Categories]\n"
                    + "  ORDER BY CatName";
            PreparedStatement statement = connection.prepareCall(query);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Gender cat = new Gender();
                cat.setCatDesc(rs.getString("Desc"));
                cat.setCatId(rs.getInt("CatID"));
                cat.setCatName(rs.getString("CatName"));
                cats.add(cat);
            }
        } catch (SQLException ex) {
            Logger.getLogger(GenderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cats;
    }

    @Override
    public int update(Gender model) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int delete(Gender model) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int insert(Gender model) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
