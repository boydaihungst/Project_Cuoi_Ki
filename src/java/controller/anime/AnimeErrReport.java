/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.anime;

import dal.EpisodeDAO;
import dal.ErrorReportDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Episode;
import model.ErrorReport;

/**
 *
 * @author DrAgOn
 */
public class AnimeErrReport extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            ErrorReport er = new ErrorReport();
            ErrorReportDAO erDAO = new ErrorReportDAO();

            String aniId = request.getParameter("aniid");
            String epNum = request.getParameter("epnum");
            String srcId = request.getParameter("srcid");

            EpisodeDAO eDAO = new EpisodeDAO();
            Episode e = new Episode();
            e.setAniId(Integer.parseInt(aniId));
            e.setEpNumber(Integer.parseInt(epNum));
            e.setSourceId(Integer.parseInt(srcId));
            Episode resultEp = eDAO.get(e);

            if (resultEp != null) {
                er.setAniId(Integer.parseInt(aniId));
                er.setEpId(resultEp.getEpId());
                er.setSrcId(Integer.parseInt(srcId));
                erDAO.insert(er);
                response.getWriter().print(true);
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        response.getWriter().print(false);
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
