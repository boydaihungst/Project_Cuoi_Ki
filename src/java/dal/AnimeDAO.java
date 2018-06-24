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
    public ArrayList<Anime> get_top_n_ani_season(int top) {
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
                    + "  WHERE ReleaseTime < GETDATE() AND ReleaseTime >= ?  \n"
                    + "  Order by UpdateTime desc";
            PreparedStatement statement = connection.prepareCall(query);
            statement.setDate(1, TimeUtils.getStartTimeOfMonth());
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
            System.out.println(animes.size());
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
            String query = " SELECT TOP "+top+" a.[AniID]\n"
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
