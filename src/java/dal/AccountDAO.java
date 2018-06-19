/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;

/**
 *
 * @author DrAgOn
 */
public class AccountDAO extends BaseDAO<Account> {

    @Override
    public Account get(Account model) {
        Account acc = null;
        try {

            String query = "SELECT [UserName]\n"
                    + "      ,[Password]\n"
                    + "      ,[CustomerID]\n"
                    + "  FROM [Account] WHERE [UserName]=? AND [Password]=?";
            CallableStatement prepareCall = connection.prepareCall(query);
            prepareCall.setString(1, model.getUsername());
            prepareCall.setString(2, model.getPassword());
            ResultSet rs = prepareCall.executeQuery();
            if (rs.next()) {
                acc = new Account();
                acc.setUsername(rs.getString("UserName"));
                acc.setPassword(rs.getString("Password"));
                acc.setCusID(rs.getString("CustomerID"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return acc;
    }

    @Override
    public ArrayList<Account> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    //muc dich: Update password
    //tham so truyen vao: CustomerID - lay tu gia tri trong table Account

    @Override
    public int update(Account model) {
        try {

            String query = "UPDATE [Account]\n"
                    + "   SET [Password] = ?\n"
                    + " WHERE CustomerID=? AND UserName=?";
            CallableStatement prepareCall = connection.prepareCall(query);
            prepareCall.setString(1, model.getPassword());
            prepareCall.setString(2, model.getCusID());
            prepareCall.setString(3, model.getUsername());
            return prepareCall.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    @Override
    public int delete(Account model) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    //muc dich: change non-logged in user -> logged in user
    //tham so truyen vao: CustomerID - lay tu gia tri duoc random trong table Customer
    @Override
    public int insert(Account model) {
        try {

            String query = "INSERT INTO [Account]\n"
                    + "           ([CustomerID]\n"
                    + "           ,[UserName]\n"
                    + "           ,[Password])\n"
                    + "     VALUES\n"
                    + "           (?,?,?)";
            CallableStatement prepareCall = connection.prepareCall(query);
            prepareCall.setString(1, model.getCusID());
            prepareCall.setString(2, model.getUsername());
            prepareCall.setString(3, model.getPassword());
            return prepareCall.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

}
