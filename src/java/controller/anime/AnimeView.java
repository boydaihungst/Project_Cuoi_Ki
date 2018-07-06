/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.anime;

import dal.AnimeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Anime;

/**
 *
 * @author DrAgOn
 */
public class AnimeView extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String aniId = request.getParameter("aniid");
            AnimeDAO aDAO = new AnimeDAO();
            Anime a = new Anime();
            a.setAniId(Integer.parseInt(aniId));
            Anime result = aDAO.get(a);
            if (result != null) {
                request.setAttribute("anime", result);
                request.getRequestDispatcher("../view/anime/preview.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/homepage");
            }
        } catch (NumberFormatException e) {
                response.sendRedirect(request.getContextPath() + "/homepage");
        }
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
