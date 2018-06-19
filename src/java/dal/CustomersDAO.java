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
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Customers;

/**
 *
 * @author DrAgOn
 */
public class CustomersDAO extends BaseDAO<Customers> {

    @Override
    public Customers get(Customers model) {

        Customers cus = null;
        try {

            String query = "SELECT [ContactName]\n"
                    + "      ,[Address]\n"
                    + "      ,[City]\n"
                    + "      ,[Phone]\n"
                    + "  FROM [Customers] WHERE CustomerID =?";
            CallableStatement prepareCall = connection.prepareCall(query);
            prepareCall.setInt(1, model.getCusID());
            ResultSet rs = prepareCall.executeQuery();
            if (rs.next()) {
                cus = new Customers();
                cus.setCusID(model.getCusID());
                cus.setCusName(rs.getString("ContactName"));
                cus.setAddress(rs.getString("Address"));
                cus.setCity(rs.getString("City"));
                cus.setPhone(rs.getString("Phone"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cus;
    }

    @Override
    public ArrayList<Customers> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int update(Customers model) {
        HashMap<Integer, Object[]> params = new HashMap<>();
        int paramIndex = 0;
        try {
            String query = "UPDATE [Customers]\n"
                    + " SET ";
            if (model.getCusName() != null) {
                paramIndex++;
                query += " [ContactName] = ?\n,";
                Object[] objects = new Object[2];
                objects[0] = model.getCusName();
                objects[1] = "String";
                params.put(paramIndex, objects);
            }
            if (model.getAddress() != null) {
                paramIndex++;
                query += " [Address] = ?\n,";
                Object[] objects = new Object[2];
                objects[0] = model.getAddress();
                objects[1] = "String";
                params.put(paramIndex, objects);
            }
            if (model.getCity() != null) {
                paramIndex++;
                query += " [City] = ?\n,";
                Object[] objects = new Object[2];
                objects[0] = model.getCity();
                objects[1] = "String";
                params.put(paramIndex, objects);
            }
            if (model.getPhone() != null) {
                paramIndex++;
                query += " [Phone] = ?\n,";
                Object[] objects = new Object[2];
                objects[0] = model.getPhone();
                objects[1] = "String";
                params.put(paramIndex, objects);
            }

            paramIndex++;
            query += " WHERE [CustomerID] = ?";
            Object[] objects = new Object[2];
            objects[0] = model.getCusID();
            objects[1] = "int";
            params.put(paramIndex, objects);

            PreparedStatement statement = connection.prepareStatement(query);
            for (Map.Entry<Integer, Object[]> entry : params.entrySet()) {
                Integer key = entry.getKey();
                Object[] value = entry.getValue();
                if (value[1].equals("int")) {
                    statement.setInt(key, (Integer) value[0]);
                }
                if (value[1].equals("String")) {
                    statement.setString(key, value[0].toString());
                }
                if (value[1].equals("Date")) {
                    statement.setDate(key, java.sql.Date.valueOf(value[0].toString()));
                }
            }
            return statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    @Override
    public int delete(Customers model) {
        try {

            String query = "DELETE FROM [Customers]\n"
                    + "      WHERE CustomerID =?";
            CallableStatement prepareCall = connection.prepareCall(query);
            prepareCall.setInt(1, model.getCusID());
            return prepareCall.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    @Override
    public int insert(Customers model) {
        try {
            String query = "INSERT INTO [Customers]\n"
                    + "           ([ContactName]\n"
                    + "           ,[Address]\n"
                    + "           ,[City]\n"
                    + "           ,[Phone]) Output Inserted.CustomerID \n"
                    + "     VALUES\n"
                    + "           (?,?,?,?)";
            CallableStatement prepareCall = connection.prepareCall(query);
            if (model.getCusName().isEmpty()) {
                prepareCall.setNull(1, Types.NVARCHAR);
            } else {
                prepareCall.setString(1, model.getCusName());
            }
            if (model.getCusName().isEmpty()) {
                prepareCall.setNull(2, Types.NVARCHAR);
            } else {
                prepareCall.setString(2, model.getAddress());
            }
            if (model.getCusName().isEmpty()) {
                prepareCall.setNull(3, Types.NVARCHAR);
            } else {
                prepareCall.setString(3, model.getCity());
            }
            if (model.getCusName().isEmpty()) {
                prepareCall.setNull(4, Types.NVARCHAR);
            } else {
                prepareCall.setString(4, model.getPhone());

            }
            ResultSet rs = prepareCall.executeQuery();
            if(rs.next()){
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

}
