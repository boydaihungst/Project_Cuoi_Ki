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
import model.Categories;
import model.ClickStats;

/**
 *
 * @author DrAgOn
 */
public class WatchStatisticDAO extends BaseDAO<ClickStats> {

    @Override
    public ClickStats get(ClickStats model) {
        int total = 0;
        ClickStats cs = null;
        try {
            String query = "SELECT [AniID]\n"
                    + "      ,[Date]\n"
                    + "      ,[TimeClicked]\n"
                    + "  FROM [WatchStatisticByDay]\n"
                    + "  WHERE AniID =?";
            PreparedStatement statement = connection.prepareCall(query);
            statement.setInt(1, model.getAniID());
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                total += rs.getInt("TimeClicked");
            }
            cs = new ClickStats();
            cs.setAniID(model.getAniID());
            cs.setTimeClicked(total);
        } catch (SQLException ex) {
            Logger.getLogger(WatchStatisticDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cs;
    }

    @Override
    public ArrayList<ClickStats> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int update(ClickStats model) {
        try {
            String query = "UPDATE [WatchStatisticByDay]\n"
                    + "   SET [TimeClicked] = ("
                    + "Select TimeClicked "
                    + "from WatchStatisticByDay "
                    + "WHERE AniID=? "
                    + "AND convert(date,[Date]) = convert(date, GETDATE())"
                    + ") +1\n"
                    + " WHERE AniID =?";
            PreparedStatement statement = connection.prepareCall(query);
            statement.setInt(1, model.getAniID());
            statement.setInt(2, model.getAniID());
             statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(WatchStatisticDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 1;
    }

    @Override
    public int delete(ClickStats model) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int insert(ClickStats model) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
