/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Utils.TimeUtils;
import dal.AnimeDAO;
import dal.GenderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Anime;
import model.Gender;

/**
 *
 * @author DrAgOn
 */
public class Homepage extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AnimeDAO aniDAO = new AnimeDAO();
        TimeUtils timeUtils = new TimeUtils();

//        String currentDate = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
        //
        ArrayList<Anime> anime_this_season = aniDAO.get_top_n_ani_season(0,  timeUtils.getStartTimeOfSeason(TimeUtils.CURRENT_SEASON), timeUtils.getStopTimeOfSeason(TimeUtils.CURRENT_SEASON), TimeUtils.BY_SEASON);
        ArrayList<Anime> anime_pre_season = null;
        ArrayList<Anime> anime_new_update = null;
        Map<String, ArrayList<Anime>> anime_this_season_map = new LinkedHashMap<>();
        //
        if (anime_this_season.size() <= 0) {
            //trường hợp mùa này chưa có anime nào thì sẽ hiển thị 2 mùa trước đó
            anime_this_season = aniDAO.get_top_n_ani_season(0, timeUtils.getStartTimeOfSeason(TimeUtils.PRE_SEASON), timeUtils.getStopTimeOfSeason(TimeUtils.PRE_SEASON), TimeUtils.BY_SEASON);
            anime_pre_season = aniDAO.get_top_n_ani_season(0, timeUtils.getStartTimeOfSeason(TimeUtils.PRE_2_SEASON), timeUtils.getStopTimeOfSeason(TimeUtils.PRE_2_SEASON), TimeUtils.BY_SEASON);
            //set title tab úng với từng mùa
            anime_this_season_map.put(timeUtils.getSeasonYearByDate(Date.valueOf(timeUtils.getStartTimeOfSeason(TimeUtils.PRE_SEASON))), anime_this_season);
            anime_this_season_map.put(timeUtils.getSeasonYearByDate(Date.valueOf(timeUtils.getStartTimeOfSeason(TimeUtils.PRE_2_SEASON))), anime_pre_season);
        } else {
            //trường hợp mùa này đã có anime
            //k cần set anime_this_season vì đã set ở trên
            anime_pre_season = aniDAO.get_top_n_ani_season(0, timeUtils.getStartTimeOfSeason(TimeUtils.PRE_SEASON), timeUtils.getStopTimeOfSeason(TimeUtils.PRE_SEASON), TimeUtils.BY_SEASON);
            //set title tab úng với từng mùa
            anime_this_season_map.put(timeUtils.getSeasonYearByDate(Date.valueOf(timeUtils.getStartTimeOfSeason(TimeUtils.CURRENT_SEASON))), anime_this_season);
            anime_this_season_map.put(timeUtils.getSeasonYearByDate(Date.valueOf(timeUtils.getStartTimeOfSeason(TimeUtils.PRE_SEASON))), anime_pre_season);
        }
        anime_new_update = aniDAO.get_top_n_ani_new_update(0);
        anime_this_season_map.put("", anime_new_update);
        //
        ArrayList<Anime> anime_most_clicked = aniDAO.get_top_n_most_view_of_day(10);
        ArrayList<Anime> anime_most_ep = aniDAO.get_top_n_most_ep(4);
//        ArrayList<Categories> cats = catDAO.getAll();

        //send to jsp
        request.setAttribute("3_tabs_anime", anime_this_season_map);
        request.setAttribute("anime_most_ep", anime_most_ep);
        request.setAttribute("anime_most_clicked", anime_most_clicked);
        request.getRequestDispatcher("view/homepage.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
