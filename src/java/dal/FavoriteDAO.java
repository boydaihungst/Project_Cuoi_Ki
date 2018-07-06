/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Favorite;

/**
 *
 * @author DrAgOn
 */
public class FavoriteDAO extends BaseDAO<Favorite> {

    @Override
    public Favorite get(Favorite model) {
        Favorite f = null;
        try {
            String query = "SELECT [AccID]\n"
                    + "      ,[AniID]\n"
                    + "      ,[AddedDate]\n"
                    + "  FROM [Favorite] \n"
                    + "  WHERE AccID =? AND AniID=?";
            CallableStatement statement = connection.prepareCall(query);
            statement.setInt(1, model.getAccId());
            statement.setInt(2, model.getAniId());
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                f = new Favorite();
                f.setAccId(rs.getInt("AccID"));
                f.setAniId(rs.getInt("AniID"));
                f.setAddedDate(rs.getDate("AddedDate"));

            }

        } catch (SQLException ex) {
            Logger.getLogger(FavoriteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return f;
    }

    @Override
    public ArrayList<Favorite> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int update(Favorite model) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int delete(Favorite model) {
        try {
            String query = " DELETE FROM [Favorite]\n"
                    + " WHERE AccID=? AND AniID=?";
            CallableStatement statement = connection.prepareCall(query);
            statement.setInt(1, model.getAccId());
            statement.setInt(2, model.getAniId());
            return statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(FavoriteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    @Override
    public int insert(Favorite model) {
        try {
            String query = "INSERT INTO [Favorite]\n"
                    + "           ([AccID]\n"
                    + "           ,[AniID]\n"
                    + "           ,[AddedDate])\n"
                    + "     VALUES\n"
                    + "           (?,?,getdate())";
            CallableStatement statement = connection.prepareCall(query);
            statement.setInt(1, model.getAccId());
            statement.setInt(2, model.getAniId());
            return statement.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(FavoriteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

}
