/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.account;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
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
public class reg extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession(true);
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String password2 = request.getParameter("password2");
        String email = request.getParameter("email");
        if (username.isEmpty() || password.isEmpty() || email.isEmpty() ) {
            response.getWriter().print("Bạn phải nhập tất cả thông tin");
            return;
        }
        if (!password.equals(password2)) {
            response.getWriter().print("Mật khẩu không trùng khớp");
            return;
        }
        AccountDAO aDAO = new AccountDAO();
        Account a = new Account(username, password, email);
        if (aDAO.getByUsername(new Account(username, password, email)) == null) {
            if (aDAO.getByEmail(new Account(username, password, email)) == null) {
                if (aDAO.insert(a) != 0) {
                    session.setAttribute("account", aDAO.get(a));
                    response.getWriter().print(true);
                    return;
                }
            }else{
                response.getWriter().print("Email đã có người sử dụng");
                return;
            }
        } else {
            response.getWriter().print("Tên tài khoản đã có người sử dụng");
            return;
        }
        response.getWriter().print("Có lỗi đã xảy ra");
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
