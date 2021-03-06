/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.anime;

import com.google.gson.Gson;
import dal.EpisodeDAO;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.InetSocketAddress;
import java.net.Proxy;
import java.net.SocketTimeoutException;
import java.net.URI;
import java.net.URL;
import java.net.UnknownHostException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Episode;
import model.Source;

/**
 *
 * @author DrAgOn
 */
public class GetVideoDirectLink extends HttpServlet {

    public static String getDataFromAPI(String link, String proxyHost, int port) throws Exception {
        try {
            URL url = new URL(link);
            String response = "";
            HttpURLConnection c;
            Proxy proxy = new Proxy(Proxy.Type.HTTP, new InetSocketAddress(proxyHost, port));
            c = !proxyHost.trim().isEmpty() ? ((HttpURLConnection) url.openConnection(proxy)) : ((HttpURLConnection) url.openConnection());
            c.addRequestProperty("User-Agent", "Mozilla/5.0");
            c.setRequestMethod("GET");
            c.setConnectTimeout(15000);
            if (c.getResponseCode() == 200) {
                System.out.println("get directlink ok: " + c.getResponseCode());
                BufferedReader in = new BufferedReader(new InputStreamReader(c.getInputStream()));
                String str;
                while ((str = in.readLine()) != null) {
                    response += str + "\n";
                }
                in.close();
                return response;
            } else {
                return "{'sources':[]}";
            }
        } catch (SocketTimeoutException e) {
            return "{'sources':[]}";
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String aniId = request.getParameter("aniid");
            String epNum = request.getParameter("epnum");
            String srcId = request.getParameter("srcid");
            String proxyHost = request.getServletContext().getInitParameter("proxyHost");
            String proxyPort = request.getServletContext().getInitParameter("proxyPort");

            EpisodeDAO eDAO = new EpisodeDAO();
            Episode e = new Episode();
            e.setAniId(Integer.parseInt(aniId));
            e.setEpNumber(Integer.parseInt(epNum));
            e.setSource(new Source(Integer.parseInt(srcId), ""));
            Episode resultEp = eDAO.get(e);
            if (resultEp != null) {
                String url = "https://api.123share.top/getlink/?link=" + resultEp.getUrl();
                response.getWriter().print(getDataFromAPI(url, proxyHost, Integer.parseInt(proxyPort)));
            } else {
                response.getWriter().print(false);
            }
        } catch (Exception ex) {
            response.getWriter().print(false);
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
