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
import model.Episode;

/**
 *
 * @author DrAgOn
 */
public class EpisodeDAO extends BaseDAO<Episode> {

    @Override
    public Episode get(Episode model) {
        Episode e = null;
        try {
            String query = " SELECT [EpID]\n"
                    + "      ,[AniID]\n"
                    + "	  ,e.SourceID\n"
                    + "	  ,e.SourceName\n"
                    + "	  ,[EpNumber]\n"
                    + "	  ,a.Url\n"
                    + "  FROM [AnimeEpisodes] a inner join EpisodeSource e \n"
                    + "  ON a.SourceID=e.SourceID AND AniID=? AND e.SourceID=? AND EpNumber=?\n"
                    + "  ORDER BY e.SourceName, [EpNumber] ";
            CallableStatement statement = connection.prepareCall(query);
            statement.setInt(1, model.getAniId());
            statement.setInt(2, model.getSourceId());
            statement.setInt(3, model.getEpNumber());

            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                e = new Episode();
                e.setEpId(rs.getInt("EpID"));
                e.setAniId(rs.getInt("AniID"));
                e.setEpNumber(rs.getInt("EpNumber"));
                e.setSourceId(rs.getInt("SourceID"));
                e.setSourceName(rs.getString("SourceName"));
                e.setUrl(rs.getString("Url"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(EpisodeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return e;
    }

    public ArrayList<Episode> getAllByAniID(Episode model) {
        ArrayList<Episode> epis = new ArrayList<>();
        try {
            String query = " SELECT [EpID]\n"
                    + "      ,[AniID]\n"
                    + "	  ,e.SourceID\n"
                    + "	  ,e.SourceName\n"
                    + "	  ,[EpNumber]\n"
                    + "	  ,a.Url\n"
                    + "  FROM [AnimeEpisodes] a inner join EpisodeSource e \n"
                    + "  ON a.SourceID=e.SourceID AND AniID=?\n"
                    + "  ORDER BY e.SourceName, [EpNumber] ";
            CallableStatement statement = connection.prepareCall(query);
            statement.setInt(1, model.getAniId());
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Episode e = new Episode();
                e.setEpId(rs.getInt("EpID"));
                e.setAniId(rs.getInt("AniID"));
                e.setEpNumber(rs.getInt("EpNumber"));
                e.setSourceId(rs.getInt("SourceID"));
                e.setSourceName(rs.getString("SourceName"));
                e.setUrl(rs.getString("Url"));
                epis.add(e);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EpisodeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return epis;
    }

    @Override
    public ArrayList<Episode> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int update(Episode model) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int delete(Episode model) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int insert(Episode model) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
