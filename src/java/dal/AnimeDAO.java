/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import Utils.TimeUtils;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Anime;

/**
 *
 * @author DrAgOn
 */
public class AnimeDAO extends BaseDAO<Anime> {

    @Override
    public Anime get(Anime model) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<Anime> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    // hien thi o homepage top N anime theo mua hien tai sap xep theo thoi gian cap nhat ep moi nhat
    //fromTime là khoảng thời gian từ A. ? là khoảng thơi gian đến B
    //byTime: static tu TimeUtils de xdinh la theo month hay theo year;
    //get_top_n_ani_season(24,"getdate()",TimeUtils.getStartTimeOfMonth(TimeUtils.CURRENT_SEASON),TimeUtils.BY_SEASON) -> get 24 tao mua hien tai
    //get_top_n_ani_season(24,TimeUtils.getStartTimeOfMonth(TimeUtils.PRE_SEASON),TimeUtils.getStartTimeOfMonth(TimeUtils.CURRENT_SEASON),TimeUtils.BY_SEASON) -> get all tap mua truoc
    //get_top_n_ani_season(0,"",TimeUtils.getStartTimeOfMonth(TimeUtils.BY_YEAR),TimeUtils.BY_YEAR) -> get all tap nam ngoai
    public ArrayList<Anime> get_top_n_ani_season(int top, String fromTime, String toTime, int byTime) {
        ArrayList<Anime> animes = new ArrayList<>();
        String query;
        try {
            PreparedStatement statement = null;
            if (top != 0) {//truong hop la tim theo top bao nhieu day
                query = "SELECT TOP " + top + " [AniID]\n";
            } else {//truong hop tim all
                query = "SELECT [AniID]\n";
            }
            query += "      ,[AniName]\n"
                    + "      ,[AniSeason]\n"
                    + "      ,[ReleaseTime]\n"
                    + "      ,[AniStatus]\n"
                    + "      ,[EpsMax]\n"
                    + "      ,[UpdateTime]\n"
                    + "      ,[EpsReleased]\n"
                    + "      ,[Desc]\n"
                    + "      ,[Picture]\n"
                    + "  FROM [Anime]\n";
            switch (byTime) {
                case TimeUtils.BY_YEAR:
                    //tim theo nam
                    query += "  WHERE YEAR(ReleaseTime) = ?\n"
                            + "  Order by UpdateTime desc";
                    statement = connection.prepareCall(query);
                    statement.setDate(1, Date.valueOf(fromTime));
                    break;
                case TimeUtils.BY_SEASON:
                    //tim theo mua
                    query += "  WHERE ReleaseTime < ? AND ReleaseTime >= ? \n"
                            + "  Order by UpdateTime desc";
                    statement = connection.prepareCall(query);
                    statement.setDate(1, Date.valueOf(fromTime));
                    statement.setDate(2, Date.valueOf(toTime));
                    break;
                default:
                    return null;
            }
            //System.out.println(query);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Anime ani = new Anime();
                ani.setAniId(rs.getInt("AniID"));
                ani.setAniName(rs.getString("AniName"));
                ani.setAniSeason(rs.getInt("AniSeason"));
                ani.setReleaseTime(rs.getDate("ReleaseTime"));
                ani.setAniStatus(rs.getInt("AniStatus"));
                ani.setEpsMax(rs.getInt("EpsMax"));
                ani.setUpdateTime(rs.getDate("UpdateTime"));
                ani.setEpsRel(rs.getInt("EpsReleased"));
                ani.setDesc(rs.getString("Desc"));
                ani.setPicture(rs.getString("Picture"));
                animes.add(ani);
            }
            //System.out.println(animes.size());
        } catch (SQLException ex) {
            Logger.getLogger(AnimeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return animes;
    }

    public ArrayList<Anime> get_top_n_most_ep(int top) {
        ArrayList<Anime> animes = new ArrayList<>();
        try {
            String query = "SELECT TOP " + top + " [AniID]\n"
                    + "      ,[AniName]\n"
                    + "      ,[AniSeason]\n"
                    + "      ,[ReleaseTime]\n"
                    + "      ,[AniStatus]\n"
                    + "      ,[EpsMax]\n"
                    + "      ,[UpdateTime]\n"
                    + "      ,[EpsReleased]\n"
                    + "      ,[Desc]\n"
                    + "      ,[Picture]\n"
                    + "  FROM [Anime]\n"
                    + "  Order by EpsReleased desc";
            PreparedStatement statement = connection.prepareCall(query);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Anime ani = new Anime();
                ani.setAniId(rs.getInt("AniID"));
                ani.setAniName(rs.getString("AniName"));
                ani.setAniSeason(rs.getInt("AniSeason"));
                ani.setReleaseTime(rs.getDate("ReleaseTime"));
                ani.setAniStatus(rs.getInt("AniStatus"));
                ani.setEpsMax(rs.getInt("EpsMax"));
                ani.setUpdateTime(rs.getDate("UpdateTime"));
                ani.setEpsRel(rs.getInt("EpsReleased"));
                ani.setDesc(rs.getString("Desc"));
                ani.setPicture(rs.getString("Picture"));
                animes.add(ani);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AnimeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return animes;
    }

    public ArrayList<Anime> get_top_n_most_view_of_day(int top) {
        ArrayList<Anime> animes = new ArrayList<>();
        try {
            String query = " SELECT TOP " + top + " a.[AniID]\n"
                    + "      ,[AniName]\n"
                    + "      ,[AniSeason]\n"
                    + "      ,[ReleaseTime]\n"
                    + "      ,[AniStatus]\n"
                    + "      ,[EpsMax]\n"
                    + "      ,[UpdateTime]\n"
                    + "      ,[EpsReleased]\n"
                    + "      ,[Desc]\n"
                    + "      ,[Picture]\n"
                    + "  FROM [Anime] a inner join [WatchStatisticByDay] w ON a.AniID=w.AniID AND convert(date, w.Date) = convert(date, GETDATE())\n"
                    + "  Order by w.TimeClicked desc";
            PreparedStatement statement = connection.prepareCall(query);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Anime ani = new Anime();
                ani.setAniId(rs.getInt("AniID"));
                ani.setAniName(rs.getString("AniName"));
                ani.setAniSeason(rs.getInt("AniSeason"));
                ani.setReleaseTime(rs.getDate("ReleaseTime"));
                ani.setAniStatus(rs.getInt("AniStatus"));
                ani.setEpsMax(rs.getInt("EpsMax"));
                ani.setUpdateTime(rs.getDate("UpdateTime"));
                ani.setEpsRel(rs.getInt("EpsReleased"));
                ani.setDesc(rs.getString("Desc"));
                ani.setPicture(rs.getString("Picture"));
                animes.add(ani);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AnimeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return animes;
    }

    //top n anime moi cap nhat
    public ArrayList<Anime> get_top_n_ani_new_update(int top) {
        ArrayList<Anime> animes = new ArrayList<>();
        String query="";
        try {
            if (top != 0) {//truong hop la tim theo top bao nhieu day
                query = "SELECT TOP " + top + " [AniID]\n";
            } else {//truong hop tim all
                query = "SELECT [AniID]\n";
            }
            query += "      ,[AniName]\n"
                    + "      ,[AniSeason]\n"
                    + "      ,[ReleaseTime]\n"
                    + "      ,[AniStatus]\n"
                    + "      ,[EpsMax]\n"
                    + "      ,[UpdateTime]\n"
                    + "      ,[EpsReleased]\n"
                    + "      ,[Desc]\n"
                    + "      ,[Picture]\n"
                    + "  FROM [Anime] a \n"
                    + "  Order by [UpdateTime] desc";
            PreparedStatement statement = connection.prepareCall(query);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Anime ani = new Anime();
                ani.setAniId(rs.getInt("AniID"));
                ani.setAniName(rs.getString("AniName"));
                ani.setAniSeason(rs.getInt("AniSeason"));
                ani.setReleaseTime(rs.getDate("ReleaseTime"));
                ani.setAniStatus(rs.getInt("AniStatus"));
                ani.setEpsMax(rs.getInt("EpsMax"));
                ani.setUpdateTime(rs.getDate("UpdateTime"));
                ani.setEpsRel(rs.getInt("EpsReleased"));
                ani.setDesc(rs.getString("Desc"));
                ani.setPicture(rs.getString("Picture"));
                animes.add(ani);
            }
            //System.out.println(animes.size());
        } catch (SQLException ex) {
            Logger.getLogger(AnimeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return animes;
    }

    public ArrayList<Anime> filter(Anime modal) {
        ArrayList<Anime> animes = new ArrayList<>();
        HashMap<Integer, Object[]> params = new HashMap<>();
        int paramIndex = 0;
        try {
            String query = "SELECT  [AniID]\n"
                    + "      ,[AniName]\n"
                    + "      ,[AniSeason]\n"
                    + "      ,[ReleaseTime]\n"
                    + "      ,[AniStatus]\n"
                    + "      ,[EpsMax]\n"
                    + "      ,[UpdateTime]\n"
                    + "      ,[EpsReleased]\n"
                    + "      ,[Desc]\n"
                    + "      ,[Picture]\n"
                    + "  FROM [Anime]\n"
                    + "  WHERE 1=1 ";
            if (modal.getAniName() != null && !modal.getAniName().isEmpty()) {
                paramIndex++;
                query += " AND [AniName] = ?\n,";
                Object[] objects = new Object[2];
                objects[0] = modal.getAniName();
                objects[1] = "String";
                params.put(paramIndex, objects);
            }

//            paramIndex++;
//            query += " WHERE ID = ?";
//            Object[] objects = new Object[2];
//            objects[0] = modal.getUser().getID();
//            objects[1] = "String";
//            params.put(paramIndex, objects);
            PreparedStatement statement = connection.prepareStatement(query);
            for (Map.Entry<Integer, Object[]> entry : params.entrySet()) {
                Integer key = entry.getKey();
                Object[] value = entry.getValue();
                if (value[1].equals("int")) {
                    statement.setInt(key, (Integer) value[0]);
                }
                if (value[1].equals("String")) {
                    statement.setString(key, value[0].toString());
                }
            }
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Anime ani = new Anime();
                ani.setAniId(rs.getInt("AniID"));
                ani.setAniName(rs.getString("AniName"));
                ani.setAniSeason(rs.getInt("AniSeason"));
                ani.setReleaseTime(rs.getDate("ReleaseTime"));
                ani.setAniStatus(rs.getInt("AniStatus"));
                ani.setEpsMax(rs.getInt("EpsMax"));
                ani.setUpdateTime(rs.getDate("UpdateTime"));
                ani.setEpsRel(rs.getInt("EpsReleased"));
                ani.setDesc(rs.getString("Desc"));
                ani.setPicture(rs.getString("Picture"));
                animes.add(ani);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AnimeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return animes;
    }

    public int clickAutoincrement(int aniId) {
        try {
            String sql = " IF (Select count(*) from WatchStatisticByDay WHERE AniID=? AND convert(date,[Date]) = convert(date, GETDATE())) =0\n"
                    + " INSERT INTO [WatchStatisticByDay]\n"
                    + "           ([AniID]\n"
                    + "           ,[Date]\n"
                    + "           ,[TimeClicked])\n"
                    + "     VALUES\n"
                    + "           (?,GETDATE(),1)\n"
                    + "ELSE\n"
                    + "UPDATE [WatchStatisticByDay]\n"
                    + "   SET [TimeClicked] = (Select TimeClicked from WatchStatisticByDay WHERE AniID=? AND convert(date,[Date]) = convert(date, GETDATE())) +1\n"
                    + " WHERE AniID =?";
            PreparedStatement statement = connection.prepareCall(sql);
            statement.setInt(1, aniId);
            statement.setInt(2, aniId);
            statement.setInt(3, aniId);
            statement.setInt(4, aniId);
            return statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AnimeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    @Override
    public int update(Anime model) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int delete(Anime model) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int insert(Anime model) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
