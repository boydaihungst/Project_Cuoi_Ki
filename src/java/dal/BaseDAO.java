package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author sonnt
 * @param <T>
 */
public abstract class BaseDAO<T> {

    protected Connection connection;

    public BaseDAO() {
        try {
            String url = "jdbc:sqlserver://localhost:1433;databaseName=AnimeVietsub";
            String username = "sa";
            String password = "sa";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(BaseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public abstract T get(T model);

    public abstract ArrayList<T> getAll();

    public abstract int update(T model);

    public abstract int delete(T model);

    public abstract int insert(T model);
}