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
    private String privateKey = "3A98F14AECC125E2A87B25FAF46E8"; //random :D
    @Override
    public Account get(Account model) {
        Account acc = null;
        try {
            String query = " SELECT [AccID]\n"
                    + "      ,[Username]\n"
                    + "      ,[Password]\n"
                    + "      ,[Email]\n"
                    + "      ,[AccID]\n"
                    + "  FROM [Account]\n"
                    + "  WHERE [Username] =? AND (select convert(varchar(100),DecryptByPassPhrase(?,(SELECT [Password] FROM Account WHERE Username =?)))) = ? ";
            PreparedStatement statement = connection.prepareCall(query);
            statement.setString(1, model.getUsername());
            statement.setString(2, privateKey);
            statement.setString(3, model.getUsername());
            statement.setString(4, model.getPassword());
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                acc = new Account();
                acc.setUsername(rs.getString("Username"));
                acc.setEmail(rs.getString("Email"));
                acc.setAccid(rs.getInt("AccID"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return acc;
    }

    public Account getByUsername(Account model) {
        Account acc = null;
        try {
            String query = " SELECT [AccID]\n"
                    + "      ,[Username]\n"
                    + "      ,[Password]\n"
                    + "      ,[Email]\n"
                    + "  FROM [Account]\n"
                    + "  WHERE [Username] =?";
            PreparedStatement statement = connection.prepareCall(query);
            statement.setString(1, model.getUsername());
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                acc = new Account();
                acc.setUsername(rs.getString("Username"));
                acc.setEmail(rs.getString("Email"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return acc;
    }

    public Account getByEmail(Account model) {
        Account acc = null;
        try {
            String query = " SELECT [AccID]\n"
                    + "      ,[Username]\n"
                    + "      ,[Password]\n"
                    + "      ,[Email]\n"
                    + "  FROM [Account]\n"
                    + "  WHERE [Email]=?";
            PreparedStatement statement = connection.prepareCall(query);
            statement.setString(1, model.getEmail());
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                acc = new Account();
                acc.setUsername(rs.getString("Username"));
                acc.setEmail(rs.getString("Email"));
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

    @Override
    public int update(Account model) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int delete(Account model) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int insert(Account model) {
        try {
            String query = "INSERT INTO [Account]\n"
                    + "           ([Username]\n"
                    + "           ,[Password]\n"
                    + "           ,[Email])\n"
                    + "     VALUES\n"
                    + "           (?,(select EncryptedData = EncryptByPassPhrase(?,?)),?)";
            CallableStatement statement = connection.prepareCall(query);
            statement.setString(1, model.getUsername());
            statement.setString(2, privateKey);
            statement.setString(3, model.getPassword());
            statement.setString(4, model.getEmail());
            return statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

}
