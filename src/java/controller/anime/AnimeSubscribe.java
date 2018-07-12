/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.anime;

import dal.FavoriteDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Favorite;

/**
 *
 * @author DrAgOn
 */
public class AnimeSubscribe extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        FavoriteDAO fDAO = new FavoriteDAO();
        try {
            Account a = (Account) request.getSession(true).getAttribute("account");
            if(a == null){
                response.getWriter().print("404");
            }
            int aniId = Integer.parseInt(request.getParameter("aniid"));
            int accId = a.getAccid();
            if (fDAO.get(new Favorite(accId, aniId, null)) != null) {
                response.getWriter().print(true);
                return;
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        response.getWriter().print(false);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            Account a = (Account) request.getSession(true).getAttribute("account");
            int aniId = Integer.parseInt(request.getParameter("aniid"));
            int accId = a.getAccid();
            FavoriteDAO fDAO = new FavoriteDAO();
            if (fDAO.insert(new Favorite(accId, aniId, null)) > 0) {
                response.getWriter().print(true);
                return;
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        response.getWriter().print(false);
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
