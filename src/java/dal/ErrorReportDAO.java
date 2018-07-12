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
import model.ErrorReport;

/**
 *
 * @author DrAgOn
 */
public class ErrorReportDAO extends BaseDAO<ErrorReport> {

    @Override
    public ErrorReport get(ErrorReport model) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<ErrorReport> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int update(ErrorReport model) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int delete(ErrorReport model) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int insert(ErrorReport model) {
        try {
            String query = " IF (SELECT count(*) FROM [ErrorReport] WHERE [AniID]=? AND [EpID]=? AND [SourceID]=?) =0\n"
                    + "INSERT INTO [ErrorReport]\n"
                    + "           ([AniID]\n"
                    + "           ,[EpID]\n"
                    + "           ,[AddedDate]\n"
                    + "           ,[SourceID]\n"
                    + "           ,[ReportContent])\n"
                    + "     VALUES\n"
                    + "           (?,?,GETDATE(),?,?)\n";
            CallableStatement statement = connection.prepareCall(query);
            statement.setInt(1, model.getAniId());
            statement.setInt(2, model.getEpId());
            statement.setInt(3, model.getSrcId());
            statement.setInt(4, model.getAniId());
            statement.setInt(5, model.getEpId());
            
            statement.setInt(6, model.getSrcId());
            statement.setString(7, "Lỗi link film");
            return statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ErrorReportDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

}
