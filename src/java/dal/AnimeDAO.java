/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import Utils.TimeUtils;
import java.sql.CallableStatement;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Anime;
import model.Gender;
import model.Type;

/**
 *
 * @author DrAgOn
 */
public class AnimeDAO extends BaseDAO<Anime> {

    @Override
    public Anime get(Anime model) {
        Anime ani = null;
        ArrayList<Gender> gender = new ArrayList<>();
        ArrayList<String> wallpapers = new ArrayList<>();
        int subscribers = 0;
        try {
            //get gender list of anime
            connection.setAutoCommit(false);
            String query_select_gender = "select c.CatName,c.CatID from CategorieDetails cd inner join Categories c on cd.CatID=c.CatID and cd.AniID=?";
            PreparedStatement statement_select_gender = connection.prepareCall(query_select_gender);
            statement_select_gender.setInt(1, model.getAniId());
            ResultSet rs1 = statement_select_gender.executeQuery();
            while (rs1.next()) {
                gender.add(new Gender(rs1.getInt("CatID"), rs1.getString("CatName")));
            }
            //get wallpaper list of anime
            String query_select_wallpaper = "SELECT "
                    + "     [Link]\n"
                    + "  FROM [Wallpaper]\n"
                    + "  WHERE AniID = ?";
            PreparedStatement statement_select_wallpaper = connection.prepareCall(query_select_wallpaper);
            statement_select_wallpaper.setInt(1, model.getAniId());
            ResultSet rs3 = statement_select_wallpaper.executeQuery();
            while (rs3.next()) {
                wallpapers.add(rs3.getString("Link"));
            }
            //get number of subscriber
            String query_select_subscriber = "SELECT count(*) as subscriber\n"
                    + "  FROM [Favorite] WHERE AniID =?";
            PreparedStatement statement_select_subscriber = connection.prepareCall(query_select_subscriber);
            statement_select_subscriber.setInt(1, model.getAniId());
            ResultSet rs4 = statement_select_subscriber.executeQuery();

            if (rs4.next()) {
                subscribers = rs4.getInt("subscriber");
            }
            //get anime info
            String query_select_anime = " SELECT a.[AniID]\n"
                    + "      ,a.[AniName]\n"
                    + "      ,a.[AniSeason]\n"
                    + "      ,a.[ReleaseTime]\n"
                    + "      ,a.[AniStatus]\n"
                    + "      ,a.[EpsMax]\n"
                    + "      ,a.[UpdateTime]\n"
                    + "      ,a.[EpsReleased]\n"
                    + "      ,a.[Desc]\n"
                    + "      ,a.[Picture]\n"
                    + "      ,a.[Trailer]\n"
                    + "      ,t.[TypeID]\n"
                    + "      ,t.[TypeName]\n"
                    + "      ,t.[TypeNameShort]\n"
                    + "	  ,(select sum(TimeClicked) from WatchStatisticByDay where AniID=?) as 'totalwatch'\n"
                    + "  FROM [Anime] a inner join [Type] t ON a.TypeID = t.TypeID AND a.AniID=?\n";
            PreparedStatement statement_select_anime = connection.prepareCall(query_select_anime);
            statement_select_anime.setInt(1, model.getAniId());
            statement_select_anime.setInt(2, model.getAniId());
            ResultSet rs2 = statement_select_anime.executeQuery();
            if (rs2.next()) {
                ani = new Anime();
                Type t = new Type();
                t.setTypeId(rs2.getInt("TypeID"));
                t.setTypeName(rs2.getString("TypeName"));
                t.setTypeNameShort(rs2.getString("TypeNameShort"));

                ani.setAniId(rs2.getInt("AniID"));
                ani.setAniName(rs2.getString("AniName"));
                ani.setAniSeason(rs2.getInt("AniSeason"));
                ani.setReleaseTime(rs2.getDate("ReleaseTime"));
                ani.setAniStatus(rs2.getInt("AniStatus"));
                ani.setEpsMax(rs2.getInt("EpsMax"));
                ani.setUpdateTime(rs2.getDate("UpdateTime"));
                ani.setEpsRel(rs2.getInt("EpsReleased"));
                ani.setDesc(rs2.getString("Desc"));
                ani.setPicture(rs2.getString("Picture"));
                ani.setTrailer(rs2.getString("Trailer"));
                ani.setTotalWatch(rs2.getInt("totalwatch"));
                ani.setTotalSubscriber(subscribers);
                ani.setWallpager(wallpapers);
                ani.setGender(gender);
                ani.setType(t);
            }
        } catch (SQLException | IndexOutOfBoundsException ex) {
            Logger.getLogger(AnimeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ani;
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
                query = "SELECT TOP " + top + " a.[AniID]\n";
            } else {//truong hop tim all
                query = "SELECT a.[AniID]\n";
            }
            query += "      ,a.[AniName]\n"
                    + "      ,a.[AniSeason]\n"
                    + "      ,a.[ReleaseTime]\n"
                    + "      ,a.[AniStatus]\n"
                    + "      ,a.[EpsMax]\n"
                    + "      ,a.[UpdateTime]\n"
                    + "      ,a.[EpsReleased]\n"
                    + "      ,a.[Desc]\n"
                    + "      ,a.[Picture]\n"
                    + "      ,t.[TypeID]\n"
                    + "      ,t.[TypeName]\n"
                    + "      ,t.[TypeNameShort]\n"
                    + "  FROM [Anime] a inner join [Type] t ON a.TypeID = t.TypeID\n ";
            switch (byTime) {
                case TimeUtils.BY_YEAR:
                    //tim theo nam
                    query += "  AND YEAR(a.ReleaseTime) = ?\n"
                            + "  Order by a.UpdateTime desc";
                    statement = connection.prepareCall(query);
                    statement.setDate(1, Date.valueOf(fromTime));
                    break;
                case TimeUtils.BY_SEASON:
                    //tim theo mua
                    query += "  AND a.ReleaseTime BETWEEN ? AND ? \n"
                            + "  Order by a.UpdateTime desc";
                    statement = connection.prepareCall(query);
                    statement.setDate(1, Date.valueOf(fromTime));
                    statement.setDate(2, Date.valueOf(toTime));
                    break;
                default:
                    return null;
            }
//            System.out.println(query);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Anime ani = new Anime();
                Type t = new Type();
                t.setTypeId(rs.getInt("TypeID"));
                t.setTypeName(rs.getString("TypeName"));
                t.setTypeNameShort(rs.getString("TypeNameShort"));

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
                ani.setType(t);
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
            String query = "SELECT TOP " + top + " a.[AniID]\n"
                    + "      ,a.[AniName]\n"
                    + "      ,a.[AniSeason]\n"
                    + "      ,a.[ReleaseTime]\n"
                    + "      ,a.[AniStatus]\n"
                    + "      ,a.[EpsMax]\n"
                    + "      ,a.[UpdateTime]\n"
                    + "      ,a.[EpsReleased]\n"
                    + "      ,a.[Desc]\n"
                    + "      ,a.[Picture]\n"
                    + "      ,t.[TypeID]\n"
                    + "      ,t.[TypeName]\n"
                    + "      ,t.[TypeNameShort]\n"
                    + "  FROM [Anime] a inner join [Type] t ON a.TypeID = t.TypeID AND a.EpsReleased > 24\n"//> 24 tap tinh la anime dai tap
                    + "  Order by a.EpsReleased desc ";
            PreparedStatement statement = connection.prepareCall(query);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Anime ani = new Anime();
                Type t = new Type();
                t.setTypeId(rs.getInt("TypeID"));
                t.setTypeName(rs.getString("TypeName"));
                t.setTypeNameShort(rs.getString("TypeNameShort"));
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
                ani.setType(t);
                animes.add(ani);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AnimeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return animes;
    }

    public ArrayList<Anime> pagging_n_most_ep(int pageSize, int pageIndex) {
        ArrayList<Anime> animes = new ArrayList<>();
        String query = "";
        try {
            query += "SELECT a.[AniID]\n"
                    + "      ,a.[AniName]\n"
                    + "      ,a.[AniSeason]\n"
                    + "      ,a.[ReleaseTime]\n"
                    + "      ,a.[AniStatus]\n"
                    + "      ,a.[EpsMax]\n"
                    + "      ,a.[UpdateTime]\n"
                    + "      ,a.[EpsReleased]\n"
                    + "      ,a.[Desc]\n"
                    + "      ,a.[Picture]\n"
                    + "      ,a.[Trailer]\n"
                    + "      ,t.[TypeID]\n"
                    + "      ,t.[TypeName]\n"
                    + "      ,t.[TypeNameShort]\n"
                    + "	FROM  (SELECT  ROW_NUMBER() OVER (ORDER BY EpsReleased desc) as RowNumber,*\n"
                    + "				FROM [Anime] WHERE EpsReleased > 24) a INNER JOIN [Type] t ON a.TypeID = t.TypeID " //> 24 tap tinh la anime dai tap
                    + "	AND RowNumber BETWEEN (((? - 1) * ? )+ 1) AND ?*?";
            PreparedStatement statement = connection.prepareCall(query);
            statement.setInt(1, pageIndex);
            statement.setInt(2, pageSize);
            statement.setInt(3, pageIndex);
            statement.setInt(4, pageSize);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Anime ani = new Anime();
                Type t = new Type();
                t.setTypeId(rs.getInt("TypeID"));
                t.setTypeName(rs.getString("TypeName"));
                t.setTypeNameShort(rs.getString("TypeNameShort"));
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
                ani.setType(t);
                animes.add(ani);
            }
            //System.out.println(animes.size());
        } catch (SQLException ex) {
            Logger.getLogger(AnimeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return animes;
    }

    public int get_total_records_ani_most_ep() {
        String query = "SELECT COUNT(*) as Total FROM [Anime] WHERE EpsReleased > 24"; //> 24 tap tinh la anime dai tap
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getInt("Total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AnimeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    //het pagging
    public ArrayList<Anime> get_top_n_most_view_of_day(int top) {
        ArrayList<Anime> animes = new ArrayList<>();
        try {
            String query = " SELECT TOP " + top + " a.[AniID]\n"
                    + "      ,a.[AniName]\n"
                    + "      ,a.[AniSeason]\n"
                    + "      ,a.[ReleaseTime]\n"
                    + "      ,a.[AniStatus]\n"
                    + "      ,a.[EpsMax]\n"
                    + "      ,a.[UpdateTime]\n"
                    + "      ,a.[EpsReleased]\n"
                    + "      ,a.[Desc]\n"
                    + "      ,a.[Picture]\n"
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
        String query = "";
        try {
            if (top != 0) {//truong hop la tim theo top bao nhieu day
                query = "SELECT TOP " + top + " a.[AniID]\n";
            } else {//truong hop tim all
                query = "SELECT a.[AniID]\n";
            }
            query += "      ,a.[AniName]\n"
                    + "      ,a.[AniSeason]\n"
                    + "      ,a.[ReleaseTime]\n"
                    + "      ,a.[AniStatus]\n"
                    + "      ,a.[EpsMax]\n"
                    + "      ,a.[UpdateTime]\n"
                    + "      ,a.[EpsReleased]\n"
                    + "      ,a.[Desc]\n"
                    + "      ,a.[Picture]\n"
                    + "      ,t.[TypeID]\n"
                    + "      ,t.[TypeName]\n"
                    + "      ,t.[TypeNameShort]\n"
                    + "  FROM [Anime] a INNER JOIN [Type] t ON a.TypeID = t.TypeID\n"
                    + "  Order by a.[UpdateTime] desc";
            PreparedStatement statement = connection.prepareCall(query);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Anime ani = new Anime();
                Type t = new Type();
                t.setTypeId(rs.getInt("TypeID"));
                t.setTypeName(rs.getString("TypeName"));
                t.setTypeNameShort(rs.getString("TypeNameShort"));
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
                ani.setType(t);
                animes.add(ani);
            }
            //System.out.println(animes.size());
        } catch (SQLException ex) {
            Logger.getLogger(AnimeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return animes;
    }

    //pagging n anime by season
    public ArrayList<Anime> pagging_n_ani_season(String fromTime, String toTime, int byTime, int pageSize, int pageIndex) {
        ArrayList<Anime> animes = new ArrayList<>();
        String query = "";
        try {
            PreparedStatement statement = null;
            query += " SELECT a.[AniID]\n"
                    + "      ,a.[AniName]\n"
                    + "      ,a.[AniSeason]\n"
                    + "      ,a.[ReleaseTime]\n"
                    + "      ,a.[AniStatus]\n"
                    + "      ,a.[EpsMax]\n"
                    + "      ,a.[UpdateTime]\n"
                    + "      ,a.[EpsReleased]\n"
                    + "      ,a.[Desc]\n"
                    + "      ,a.[Picture]\n"
                    + "      ,a.[Trailer] \n"
                    + "      ,t.[TypeID]\n"
                    + "      ,t.[TypeName]\n"
                    + "      ,t.[TypeNameShort]\n";
            switch (byTime) {
                case TimeUtils.BY_YEAR:
                    //tim theo nam
                    query += " FROM (SELECT  ROW_NUMBER() OVER (ORDER BY UpdateTime desc) as RowNumber,*\n"
                            + "				FROM [Anime] WHERE YEAR(ReleaseTime) = ? ) a INNER JOIN [Type] t ON a.TypeID = t.TypeID "
                            + "	AND RowNumber BETWEEN (((? - 1) * ? )+ 1) AND ?*? ";
                    statement = connection.prepareCall(query);
                    statement.setDate(1, Date.valueOf(fromTime));
                    statement.setInt(2, pageIndex);
                    statement.setInt(3, pageSize);
                    statement.setInt(4, pageIndex);
                    statement.setInt(5, pageSize);
                    break;
                case TimeUtils.BY_SEASON:
                    //tim theo mua
                    query += " FROM (SELECT  ROW_NUMBER() OVER (ORDER BY UpdateTime desc) as RowNumber,*\n"
                            + "				FROM [Anime] WHERE ReleaseTime BETWEEN ? AND ?) a INNER JOIN [Type] t ON a.TypeID = t.TypeID\n"
                            + "	AND RowNumber BETWEEN (((? - 1) * ? )+ 1) AND ?*? ";
                    statement = connection.prepareCall(query);
                    statement.setDate(1, Date.valueOf(fromTime));
                    statement.setDate(2, Date.valueOf(toTime));
                    statement.setInt(3, pageIndex);
                    statement.setInt(4, pageSize);
                    statement.setInt(5, pageIndex);
                    statement.setInt(6, pageSize);
                    break;
                default:
                    return null;
            }
//            System.out.println(query);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Anime ani = new Anime();
                Type t = new Type();
                t.setTypeId(rs.getInt("TypeID"));
                t.setTypeName(rs.getString("TypeName"));
                t.setTypeNameShort(rs.getString("TypeNameShort"));
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
                ani.setType(t);
                animes.add(ani);
            }
            //System.out.println(animes.size());
        } catch (SQLException ex) {
            Logger.getLogger(AnimeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return animes;
    }

    public int get_total_records_ani_by_season(String fromTime, String toTime, int byTime) {
        String query = "SELECT COUNT(*) as Total FROM [Anime]";
        try {
            PreparedStatement statement;
            switch (byTime) {
                case TimeUtils.BY_YEAR:
                    //tim theo nam
                    query += " WHERE YEAR(ReleaseTime) = ? ";
                    statement = connection.prepareCall(query);
                    statement.setDate(1, Date.valueOf(fromTime));
                    break;
                case TimeUtils.BY_SEASON:
                    //tim theo mua
                    query += " WHERE ReleaseTime BETWEEN ? AND ? ";
                    statement = connection.prepareCall(query);
                    statement.setDate(1, Date.valueOf(fromTime));
                    statement.setDate(2, Date.valueOf(toTime));
                    break;
                default:
                    return 0;
            }
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getInt("Total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AnimeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
//pagging n anime by alphabet

    public ArrayList<Anime> pagging_alphabet(String keyword, int pageSize, int pageIndex) {
        ArrayList<Anime> animes = new ArrayList<>();
        String query = "";
        try {
            PreparedStatement statement = null;
            query += " SELECT a.[AniID]\n"
                    + "      ,a.[AniName]\n"
                    + "      ,a.[AniSeason]\n"
                    + "      ,a.[ReleaseTime]\n"
                    + "      ,a.[AniStatus]\n"
                    + "      ,a.[EpsMax]\n"
                    + "      ,a.[UpdateTime]\n"
                    + "      ,a.[EpsReleased]\n"
                    + "      ,a.[Desc]\n"
                    + "      ,a.[Picture]\n"
                    + "      ,a.[Trailer] \n"
                    + "      ,t.[TypeID]\n"
                    + "      ,t.[TypeName]\n"
                    + "      ,t.[TypeNameShort]\n ";
            if (keyword != null) {
                query += " FROM (SELECT  ROW_NUMBER() OVER (ORDER BY AniName asc) as RowNumber,*\n"
                        + "				FROM [Anime] WHERE AniName like ? ) a INNER JOIN [Type] t ON a.TypeID = t.TypeID \n"
                        + "	AND RowNumber BETWEEN (((? - 1) * ? )+ 1) AND ?*? ";
                statement = connection.prepareCall(query);
                statement.setString(1, keyword + "%");
                statement.setInt(2, pageIndex);
                statement.setInt(3, pageSize);
                statement.setInt(4, pageIndex);
                statement.setInt(5, pageSize);
            } else {
                query += " FROM (SELECT  ROW_NUMBER() OVER (ORDER BY AniName asc) as RowNumber,*\n"
                        + "				FROM [Anime]) a INNER JOIN [Type] t ON a.TypeID = t.TypeID \n"
                        + "	AND RowNumber BETWEEN (((? - 1) * ? )+ 1) AND ?*? ";
                statement = connection.prepareCall(query);
                statement.setInt(1, pageIndex);
                statement.setInt(2, pageSize);
                statement.setInt(3, pageIndex);
                statement.setInt(4, pageSize);
            }
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Anime ani = new Anime();
                Type t = new Type();
                t.setTypeId(rs.getInt("TypeID"));
                t.setTypeName(rs.getString("TypeName"));
                t.setTypeNameShort(rs.getString("TypeNameShort"));
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
                ani.setType(t);
                animes.add(ani);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AnimeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return animes;
    }

    public int get_total_records_alphabet(String keyword) {
        String query = "SELECT COUNT(*) as Total FROM [Anime]";
        try {
            PreparedStatement statement = null;
            if (keyword != null) {
                query += " WHERE AniName like ? ";
                statement = connection.prepareCall(query);
                statement.setString(1, keyword + "%");
            } else {
                statement = connection.prepareCall(query);
            }
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getInt("Total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AnimeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public ArrayList<Anime> pagging_n_ani_new_update(int pageSize, int pageIndex) {
        ArrayList<Anime> animes = new ArrayList<>();
        String query = "";
        try {
            query += "SELECT a.[AniID]\n"
                    + "      ,a.[AniName]\n"
                    + "      ,a.[AniSeason]\n"
                    + "      ,a.[ReleaseTime]\n"
                    + "      ,a.[AniStatus]\n"
                    + "      ,a.[EpsMax]\n"
                    + "      ,a.[UpdateTime]\n"
                    + "      ,a.[EpsReleased]\n"
                    + "      ,a.[Desc]\n"
                    + "      ,a.[Picture]\n"
                    + "      ,a.[Trailer] \n"
                    + "      ,t.[TypeID]\n"
                    + "      ,t.[TypeName]\n"
                    + "      ,t.[TypeNameShort]\n"
                    + "	FROM  (SELECT  ROW_NUMBER() OVER (ORDER BY UpdateTime desc) as RowNumber,*\n"
                    + "				FROM [Anime]) a INNER JOIN [Type] t ON a.TypeID = t.TypeID \n"
                    + "	AND RowNumber BETWEEN (((? - 1) * ? )+ 1) AND ?*?";
            PreparedStatement statement = connection.prepareCall(query);
            statement.setInt(1, pageIndex);
            statement.setInt(2, pageSize);
            statement.setInt(3, pageIndex);
            statement.setInt(4, pageSize);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Anime ani = new Anime();
                Type t = new Type();
                t.setTypeId(rs.getInt("TypeID"));
                t.setTypeName(rs.getString("TypeName"));
                t.setTypeNameShort(rs.getString("TypeNameShort"));
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
                ani.setType(t);
                animes.add(ani);
            }
            //System.out.println(animes.size());
        } catch (SQLException ex) {
            Logger.getLogger(AnimeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return animes;
    }

    public int get_total_records_ani_new_update() {
        String query = "SELECT COUNT(*) as Total FROM [Anime]";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getInt("Total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AnimeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

//end pagging new update
    public ArrayList<Anime> searchByName(Anime modal) {
        ArrayList<Anime> animes = new ArrayList<>();
        HashMap<Integer, Object[]> params = new HashMap<>();
        int paramIndex = 0;
        try {
            String query = "SELECT a.[AniID]\n"
                    + "      ,a.[AniName]\n"
                    + "      ,a.[AniSeason]\n"
                    + "      ,a.[ReleaseTime]\n"
                    + "      ,a.[AniStatus]\n"
                    + "      ,a.[EpsMax]\n"
                    + "      ,a.[UpdateTime]\n"
                    + "      ,a.[EpsReleased]\n"
                    + "      ,a.[Desc]\n"
                    + "      ,a.[Picture]\n"
                    + "      ,a.[Trailer] \n"
                    + "      ,t.[TypeID]\n"
                    + "      ,t.[TypeName]\n"
                    + "      ,t.[TypeNameShort]\n"
                    + "  FROM [Anime] a INNER JOIN [Type] t ON a.TypeID = t.TypeID\n";
            if (modal.getAniName() != null && !modal.getAniName().isEmpty()) {
                paramIndex++;
                query += " AND a.[AniName] like ?\n";
                Object[] objects = new Object[2];
                objects[0] = "%" + modal.getAniName() + "%";
                objects[1] = "String";
                params.put(paramIndex, objects);
            }
            PreparedStatement statement = connection.prepareStatement(query);
            for (Map.Entry<Integer, Object[]> entry : params.entrySet()) {

                Integer key = entry.getKey();
                Object[] value = entry.getValue();
                if (value[1].toString().equals("int")) {
                    statement.setInt(key, (Integer) value[0]);
                }
                if (value[1].toString().equals("String")) {
                    statement.setString(key, value[0].toString());
                }
            }
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Anime ani = new Anime();
                Type t = new Type();
                t.setTypeId(rs.getInt("TypeID"));
                t.setTypeName(rs.getString("TypeName"));
                t.setTypeNameShort(rs.getString("TypeNameShort"));
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
                ani.setType(t);
                animes.add(ani);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AnimeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return animes;
    }
//paggin

    public ArrayList<Anime> filter(Anime modal, String fromTime, String toTime, int byTime, int pageSize, int pageIndex) {
        ArrayList<Anime> animes = new ArrayList<>();
        HashMap<Integer, Object[]> params = new HashMap<>();
        int paramIndex = 0;
        try {
            String query = "SELECT *\n"
                    + "  FROM (SELECT  ROW_NUMBER() OVER (ORDER BY a.[AniName] asc) as RowNumber\n"
                    + "				,a.[AniID]\n"
                    + "				,a.[AniName]\n"
                    + "				,a.[AniSeason]\n"
                    + "				,a.[ReleaseTime]\n"
                    + "				,a.[AniStatus]\n"
                    + "				,a.[EpsMax]\n"
                    + "				,a.[UpdateTime]\n"
                    + "				,a.[EpsReleased]\n"
                    + "				,a.[Desc]\n"
                    + "				,a.[Picture]\n"
                    + "				,a.[Trailer]\n"
                    + "				,t.[TypeID]\n"
                    + "				,t.[TypeName]\n"
                    + "				,t.[TypeNameShort] \n"
                    + " FROM   [Anime] a INNER JOIN [Type] t \n"
                    + "	ON a.TypeID = t.TypeID \n";

            if (byTime == TimeUtils.BY_YEAR && fromTime != null && !fromTime.trim().isEmpty()) {
                paramIndex++;
                query += " AND YEAR(a.ReleaseTime) = YEAR(?) \n";
                Object[] objects = new Object[2];
                objects[0] = fromTime;
                objects[1] = "Date";
                params.put(paramIndex, objects);
            }
            if (byTime == TimeUtils.BY_SEASON && fromTime != null && !fromTime.trim().isEmpty()
                    && toTime != null && !toTime.trim().isEmpty()) {
                query += " AND convert(date, a.ReleaseTime) BETWEEN convert(date, ?) AND convert(date, ?) \n";
                paramIndex++;
                Object[] objects = new Object[2];
                objects[0] = fromTime;
                objects[1] = "Date";
                params.put(paramIndex, objects);
                paramIndex++;
                Object[] objects2 = new Object[2];
                objects2[0] = toTime;
                objects2[1] = "Date";
                params.put(paramIndex, objects2);
            }
            if (modal.getType() != null && modal.getType().getTypeId() > 0) {
                paramIndex++;
                query += " AND t.TypeID =? \n";
                Object[] objects = new Object[2];
                objects[0] = modal.getType().getTypeId();
                objects[1] = "int";
                params.put(paramIndex, objects);
            }
            if (modal.getAniStatus() > 0) {
                paramIndex++;
                query += " AND a.AniStatus =? \n";
                Object[] objects = new Object[2];
                objects[0] = modal.getAniStatus();
                objects[1] = "int";
                params.put(paramIndex, objects);
            }
            if (modal.getGender() != null && !modal.getGender().isEmpty()) {
                query += " INNER JOIN (SELECT cd.AniID FROM [CategorieDetails] cd where cd.CatID in ( ";
                int numGenderValid = 0;
                for (Gender g : modal.getGender()) {
                    if (g != null && g.getCatId() > 0) {
                        numGenderValid++;
                        query += "?,";
                        paramIndex++;
                        Object[] objects = new Object[2];
                        objects[0] = g.getCatId();
                        objects[1] = "int";
                        params.put(paramIndex, objects);
                    }
                }
                query = query.substring(0, query.length() - 1);
                query += ")\n"
                        + "	  group by cd.AniID\n"
                        + "   having\n"
                        + "      count(*) = " + numGenderValid + ") tblB ON tblB.AniID = a.AniID\n";
            }
            query += ") as tblFinal WHERE RowNumber BETWEEN (((? - 1) * ? )+ 1) AND ?*?";
            for (int i = 0; i < 4; i++) {
                if (i % 2 == 0) {
                    paramIndex++;
                    Object[] objects = new Object[2];
                    objects[0] = pageIndex;
                    objects[1] = "int";
                    params.put(paramIndex, objects);
                } else {
                    paramIndex++;
                    Object[] objects = new Object[2];
                    objects[0] = pageSize;
                    objects[1] = "int";
                    params.put(paramIndex, objects);
                }
            }
            PreparedStatement statement = connection.prepareStatement(query);
            for (Map.Entry<Integer, Object[]> entry : params.entrySet()) {

                Integer key = entry.getKey();
                Object[] value = entry.getValue();
                if (value[1].toString().equals("int")) {
                    statement.setInt(key, (Integer) value[0]);
                }
                if (value[1].toString().equals("String")) {
                    statement.setString(key, value[0].toString());
                }
                if (value[1].toString().equals("Date")) {
                    statement.setDate(key, Date.valueOf(value[0].toString()));
                }
            }
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Anime ani = new Anime();
                Type t = new Type();
                t.setTypeId(rs.getInt("TypeID"));
                t.setTypeName(rs.getString("TypeName"));
                t.setTypeNameShort(rs.getString("TypeNameShort"));
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
                ani.setType(t);
                animes.add(ani);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AnimeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return animes;
    }
//total record filter

    public int get_total_records_filter(Anime modal, String fromTime, String toTime, int byTime) {
        HashMap<Integer, Object[]> params = new HashMap<>();
        int paramIndex = 0;
        try {
            String query = "SELECT count(*) as 'Total'\n"
                    + "  FROM (SELECT  ROW_NUMBER() OVER (ORDER BY a.[AniName] asc) as RowNumber\n"
                    + "         FROM   [Anime] a INNER JOIN [Type] t \n"
                    + "                           ON a.TypeID = t.TypeID \n";

            if (modal.getAniName() != null && !modal.getAniName().isEmpty()) {
                paramIndex++;
                query += " AND a.[AniName] like ?\n";
                Object[] objects = new Object[2];
                objects[0] = "%" + modal.getAniName() + "%";
                objects[1] = "String";
                params.put(paramIndex, objects);
            }
            if (byTime == TimeUtils.BY_YEAR && fromTime != null && !fromTime.trim().isEmpty()) {
                paramIndex++;
                query += " AND YEAR(a.ReleaseTime) = ?\n";
                Object[] objects = new Object[2];
                objects[0] = fromTime;
                objects[1] = "Date";
                params.put(paramIndex, objects);
            }
            if (byTime == TimeUtils.BY_SEASON && fromTime != null && !fromTime.trim().isEmpty()
                    && toTime != null && !toTime.trim().isEmpty()) {
                query += " AND convert(date, a.ReleaseTime) BETWEEN convert(date, ?) AND convert(date, ?) \n";
                paramIndex++;
                Object[] objects = new Object[2];
                objects[0] = fromTime;
                objects[1] = "Date";
                params.put(paramIndex, objects);
                paramIndex++;
                Object[] objects2 = new Object[2];
                objects2[0] = toTime;
                objects2[1] = "Date";
                params.put(paramIndex, objects2);
            }
            if (modal.getType() != null && modal.getType().getTypeId() > 0) {
                paramIndex++;
                query += " AND t.TypeID =? \n";
                Object[] objects = new Object[2];
                objects[0] = modal.getType().getTypeId();
                objects[1] = "int";
                params.put(paramIndex, objects);
            }
            if (modal.getAniStatus() > 0) {
                paramIndex++;
                query += " AND a.AniStatus =? \n";
                Object[] objects = new Object[2];
                objects[0] = modal.getAniStatus();
                objects[1] = "int";
                params.put(paramIndex, objects);
            }
            if (modal.getGender() != null && !modal.getGender().isEmpty()) {
                query += " INNER JOIN (SELECT cd.AniID FROM [CategorieDetails] cd where cd.CatID in ( ";
                int numGenderValid = 0;
                for (Gender g : modal.getGender()) {
                    if (g != null && g.getCatId() > 0) {
                        numGenderValid++;
                        query += "?,";
                        paramIndex++;
                        Object[] objects = new Object[2];
                        objects[0] = modal.getAniStatus();
                        objects[1] = "int";
                        params.put(paramIndex, objects);
                    }
                }
                query = query.substring(0, query.length() - 1);
                query += ")\n"
                        + "	  group by cd.AniID\n"
                        + "   having\n"
                        + "      count(*) = " + numGenderValid + ") tblB ON tblB.AniID = a.AniID\n";
            }
            query += ") as tblFinal";
            PreparedStatement statement = connection.prepareStatement(query);
            for (Map.Entry<Integer, Object[]> entry : params.entrySet()) {
                Integer key = entry.getKey();
                Object[] value = entry.getValue();
                if (value[1].toString().equals("int")) {
                    statement.setInt(key, (Integer) value[0]);
                }
                if (value[1].toString().equals("String")) {
                    statement.setString(key, value[0].toString());
                }
                if (value[1].toString().equals("Date")) {
                    statement.setDate(key, Date.valueOf(value[0].toString()));
                }
            }
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getInt("Total");
            }
        } catch (SQLException e) {

        }
        return 0;
    }

    public ArrayList<Anime> getAllFavotireByAcc(Account model) {
        ArrayList<Anime> animes = new ArrayList<>();
        try {
            String query = "SELECT a.[AniID]\n"
                    + "      ,a.[AniName]\n"
                    + "      ,a.[AniSeason]\n"
                    + "      ,a.[ReleaseTime]\n"
                    + "      ,a.[AniStatus]\n"
                    + "      ,a.[EpsMax]\n"
                    + "      ,a.[UpdateTime]\n"
                    + "      ,a.[EpsReleased]\n"
                    + "      ,a.[Desc]\n"
                    + "      ,a.[Picture]\n"
                    + "      ,a.[Trailer]\n"
                    + "      ,a.[TypeID]\n"
                    + "      ,f.[AddedDate]\n"
                    + "  FROM [Anime] a INNER JOIN Favorite f ON a.AniID= f.AniID AND f.AccID =?\n"
                    + "  ORDER BY f.AddedDate";
            CallableStatement statement = connection.prepareCall(query);
            statement.setInt(1, model.getAccid());
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
            Logger.getLogger(FavoriteDAO.class.getName()).log(Level.SEVERE, null, ex);
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
                    + " ELSE\n"
                    + " UPDATE [WatchStatisticByDay]\n"
                    + "   SET [TimeClicked] = (Select TimeClicked from WatchStatisticByDay WHERE AniID=? AND convert(date,[Date]) = convert(date, GETDATE())) +1\n"
                    + " WHERE AniID =? AND convert(date,[Date]) = convert(date, GETDATE()) ";
            PreparedStatement statement = connection.prepareCall(sql);
            statement.setInt(1, aniId);
            statement.setInt(2, aniId);
            statement.setInt(3, aniId);
            statement.setInt(4, aniId);
            return statement.executeUpdate();
        } catch (SQLException ex) {
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
