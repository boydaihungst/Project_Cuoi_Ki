/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.anime;

import dal.AnimeDAO;
import dal.EpisodeDAO;
import dal.SourceDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Anime;
import model.Episode;
import model.Source;

/**
 *
 * @author DrAgOn
 */
public class AnimeWatch extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String aniId = request.getParameter("aniid");
        EpisodeDAO epDAO = new EpisodeDAO();
        ArrayList<Episode> allEpByAniID = epDAO.getAllByAniID(new Episode(Integer.parseInt(aniId)));
        Map<String, ArrayList<Episode>> allEpBySrc = new LinkedHashMap<>();
        allEpByAniID.forEach((ep) -> {
            ArrayList<Episode> _eps;
            if (!allEpBySrc.containsKey(ep.getSourceName())) {
                _eps = new ArrayList<>();
            } else {
                _eps = allEpBySrc.get(ep.getSourceName());
            }
            _eps.add(ep);
            allEpBySrc.put(ep.getSourceName(), _eps);
        });
        request.setAttribute("list_ep_by_src", allEpBySrc);

        //anime full info
        try {
            AnimeDAO aDAO = new AnimeDAO();
            Anime a = new Anime();
            a.setAniId(Integer.parseInt(aniId));
            Anime result = aDAO.get(a);
            if (result != null) {
                request.setAttribute("anime", result);
            } else {
            }
        } catch (NumberFormatException e) {
        }

        request.getRequestDispatcher("../view/anime/watch.jsp").forward(request, response);
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
