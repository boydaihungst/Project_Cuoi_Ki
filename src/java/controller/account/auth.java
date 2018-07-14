package controller.account;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import dal.AccountDAO;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.security.InvalidKeyException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author DrAgOn
 */
public class auth extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        session.removeAttribute("account");
        //response.sendRedirect("/");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession(true);
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        EnDeCryptor temp = new EnDeCryptor();
        byte[] encrypted;
        try {
            encrypted = temp.encrypt(password, username);
            String decrypted = temp.decrypt(encrypted, username);
            System.out.println(encrypted);
            System.out.println(decrypted);
        } catch (Exception ex) {
            Logger.getLogger(auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        

        AccountDAO aDAO = new AccountDAO();
        Account a;
        if ((a = aDAO.get(new Account(username, password, ""))) != null) {
            session.setAttribute("account", a);
            response.getWriter().print(true);
        } else {
            response.getWriter().print(false);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
