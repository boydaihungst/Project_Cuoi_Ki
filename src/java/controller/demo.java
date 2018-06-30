/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Utils.TimeUtils;
import dal.AnimeDAO;
import dal.CategoriesDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Anime;
import model.Categories;

/**
 *
 * @author DrAgOn
 */
public class demo extends HttpServlet {

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
        CategoriesDAO catDAO = new CategoriesDAO();
        TimeUtils timeUtils = new TimeUtils();

        String currentDate = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
        ArrayList<Anime> left_side_animes = aniDAO.get_top_n_ani_season(0, currentDate, timeUtils.getStartTimeOfMonth(TimeUtils.CURRENT_SEASON), TimeUtils.BY_SEASON);
        ArrayList<Anime> down_left_side_animes = aniDAO.get_top_n_most_ep(4);
        ArrayList<Anime> right_side_animes = aniDAO.get_top_n_most_view_of_day(10);
        ArrayList<Anime> left_side_animes_1 = aniDAO.get_top_n_ani_season(0, timeUtils.getStartTimeOfMonth(TimeUtils.PRE_SEASON), timeUtils.getStartTimeOfMonth(TimeUtils.CURRENT_SEASON), TimeUtils.BY_SEASON);
        ArrayList<Anime> left_side_animes_2 = aniDAO.get_top_n_ani_new_update(0);
        ArrayList<Categories> cats = catDAO.getAll();
        
        
        request.setAttribute("left_side_animes", left_side_animes);
        request.setAttribute("down_left_side_animes", down_left_side_animes);
        request.setAttribute("right_side_animes", right_side_animes);
        request.setAttribute("left_side_animes_1", left_side_animes_1);
        request.setAttribute("left_side_animes_2", left_side_animes_2);
        request.setAttribute("cats", cats);
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
