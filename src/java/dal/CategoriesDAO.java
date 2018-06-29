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
import model.Categories;

/**
 *
 * @author DrAgOn
 */
public class CategoriesDAO extends BaseDAO<Categories> {

    @Override
    public Categories get(Categories model) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<Categories> getAll() {
        ArrayList<Categories> cats = new ArrayList<>();
        try {
            String query = "SELECT [CatID]\n"
                    + "      ,[CatName]\n"
                    + "      ,[Desc]\n"
                    + "  FROM [Categories]\n"
                    + "  ORDER BY CatName";
            PreparedStatement statement = connection.prepareCall(query);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Categories cat = new Categories();
                cat.setCatDesc(rs.getString("Desc"));
                cat.setCatId(rs.getInt("CatID"));
                cat.setCatName(rs.getString("CatName"));
                cats.add(cat);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoriesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cats;
    }

    @Override
    public int update(Categories model) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int delete(Categories model) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int insert(Categories model) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
