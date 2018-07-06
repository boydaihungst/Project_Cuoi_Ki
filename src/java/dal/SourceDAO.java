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
import model.Source;

/**
 *
 * @author DrAgOn
 */
public class SourceDAO extends BaseDAO<Source> {

    @Override
    public Source get(Source model) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<Source> getAll() {
        ArrayList<Source> epSources =new ArrayList<>();
        try {
            String query = "SELECT [SourceID]\n"
                    + "      ,[SourceName]\n"
                    + "  FROM [EpisodeSource]";
            CallableStatement statement = connection.prepareCall(query);
            ResultSet rs = statement.executeQuery();
            while(rs.next()){
                Source s = new Source();
                s.setSourceId(rs.getInt("SourceID"));
                s.setSourceName(rs.getString("SourceName"));
                epSources.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SourceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return epSources;
    }

    @Override
    public int update(Source model) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int delete(Source model) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int insert(Source model) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
