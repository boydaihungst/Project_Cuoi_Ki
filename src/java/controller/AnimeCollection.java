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
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Anime;

/**
 *
 * @author DrAgOn
 */
public class AnimeCollection extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AnimeDAO aniDAO = new AnimeDAO();
        String filter = request.getParameter("filter");
        int pageSize = 12;
        int total = 0;
        String raw_page_index = request.getParameter("page");
        if (raw_page_index == null) {
            raw_page_index = "1";
        }
        int pageIndex = Integer.parseInt(raw_page_index);
//        TimeUtils timeUtils = new TimeUtils();
        if (filter.equalsIgnoreCase("update-recent")) {   //truong hop "anime moi cap nhat" //12 item per page
            ArrayList<Anime> anime_new_update = aniDAO.pagging_n_ani_new_update(pageSize, pageIndex);
            total = aniDAO.get_total_records_ani_new_update();
            request.setAttribute("title", "ANIME MỚI CẬP NHẬT GẦN ĐÂY");
            request.setAttribute("animes", anime_new_update);
        } else if (filter.equalsIgnoreCase("most-eps")) {//truong hop collection theo "anime dai tap"
            ArrayList<Anime> anime_most_ep = aniDAO.pagging_n_most_ep(pageSize, pageIndex);
            total = aniDAO.get_total_records_ani_most_ep();
            request.setAttribute("title", "ANIME CÓ NHIỀU TẬP NHẤT");
            request.setAttribute("animes", anime_most_ep);
        } else if (filter.equalsIgnoreCase("alphabet")) {//truong hop collection theo "tat ca anime theo alphabet"
            String keyword = request.getParameter("keyword");
             ArrayList<Anime> anime_sort_alphabet=null;
            anime_sort_alphabet = aniDAO.pagging_alphabet(keyword,pageSize, pageIndex);
            total = aniDAO.get_total_records_alphabet(keyword);
            request.setAttribute("title", "DANH SÁCH ANIME THEO ALPHABET");
            request.setAttribute("animes", anime_sort_alphabet);
        } else {  //truong hop collection theo "season-year"
            try {
                String[] _time = filter.split("-");
                String startTime = TimeUtils.convertSeasonYearToStartDate(_time[0], Integer.parseInt(_time[1])); //example return 2018-01-01
                String stopTime = TimeUtils.convertSeasonYearToStopDate(_time[0], Integer.parseInt(_time[1]));
                //default tim 12 tap thoi
                ArrayList<Anime> anime_by_season = aniDAO.pagging_n_ani_season(startTime, stopTime, TimeUtils.BY_SEASON, pageSize, pageIndex);

                total = aniDAO.get_total_records_ani_by_season(startTime, stopTime, TimeUtils.BY_SEASON);
                request.setAttribute("title", "ANIME MÙA " + TimeUtils.seasonEngtoVn(TimeUtils.getSeasonYearByDate(Date.valueOf(TimeUtils.convertSeasonYearToStartDate(_time[0], Integer.parseInt(_time[1]))))));
                request.setAttribute("animes", anime_by_season);
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("homepage");
                return;
            }
        }
        request.setAttribute("total", total);
        request.setAttribute("pageIndex", pageIndex);
        request.setAttribute("pageSize", pageSize);
        ArrayList<Anime> anime_most_clicked = aniDAO.get_top_n_most_view_of_day(20);
        request.setAttribute("anime_most_clicked", anime_most_clicked);
        request.getRequestDispatcher("view/anime/animecollection.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
