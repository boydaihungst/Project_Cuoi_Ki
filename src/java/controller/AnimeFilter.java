/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Utils.TimeUtils;
import dal.AnimeDAO;
import dal.TypeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Anime;
import model.Gender;
import model.Gender;
import model.Type;

/**
 *
 * @author DrAgOn
 */
public class AnimeFilter extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Anime a = new Anime();
            int pageSize = 12;
            int total = 0;
            String raw_page_index = request.getParameter("page");
            if (raw_page_index == null) {
                raw_page_index = "1";
            }
            int pageIndex = Integer.parseInt(raw_page_index);

            AnimeDAO aDAO = new AnimeDAO();
            String startTime = ""; // fromTime
            String stopTime = "";   //toTime
//            String filter = "";
            int byTime = 0;
            String season = request.getParameter("season");
            String year = request.getParameter("year");
            String genderId = request.getParameter("gender");
            String typeId = request.getParameter("type");
            String animeStatus = request.getParameter("status");

//            ArrayList<Gender> cats = (ArrayList<Gender>) request.getAttribute("cats");//list cac gender trong DB get duoc tu filter
//tim theo list cac gender
            if (genderId != null) {
                ArrayList<Gender> listGenderSearch = new ArrayList<>();
                //cac gender tach nhau boi dau +
                String[] _gender = genderId.split(" ");
                for (String gender : _gender) {
                    listGenderSearch.add(new Gender(Integer.parseInt(gender), ""));
                }
                a.setGender(listGenderSearch);
                request.setAttribute("listgendersearch", listGenderSearch);
            }
//type blur-ray, Tv ...
            if (typeId != null) {
                Type t = new Type();
                t.setTypeId(Integer.parseInt(typeId));
                a.setType(t);
            }
// anime status
            if (animeStatus != null) {
                a.setAniStatus(Integer.parseInt(animeStatus));
            }
//time release
            if (season != null && year != null) {   //by season of year
                startTime = TimeUtils.convertSeasonYearToStartDate(season, Integer.parseInt(year)); //example return 2018-01-01
                stopTime = TimeUtils.convertSeasonYearToStopDate(season, Integer.parseInt(year));
                byTime = TimeUtils.BY_SEASON;
            }
            if (season == null && year != null) {  //only by year
                startTime = TimeUtils.convertSeasonYearToStartDate(TimeUtils.SPRING, Integer.parseInt(year)); //example return 2018-01-01
                stopTime = TimeUtils.convertSeasonYearToStopDate(TimeUtils.WINTER, Integer.parseInt(year));
                byTime = TimeUtils.BY_YEAR;
            }
            ArrayList<Anime> animes = aDAO.filter(a, startTime, stopTime, byTime, pageSize, pageIndex);
            total = aDAO.get_total_records_filter(a, startTime, stopTime, byTime);
            ArrayList<Type> types = new TypeDAO().getAll();
            request.setAttribute("total", total);
            request.setAttribute("pageIndex", pageIndex);
            request.setAttribute("pageSize", pageSize);
            request.setAttribute("animes", animes);
            request.setAttribute("types", types);//
            request.getRequestDispatcher("view/anime/filter.jsp").forward(request, response);
            return;
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        response.sendRedirect("homepage");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

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
