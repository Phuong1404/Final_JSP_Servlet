package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection
{
    public static Connection getConnection()throws SQLException, ClassNotFoundException
    {
        String hostName = "DESKTOP-ROPGVT3\\PHUONG";
        String database = "Website_Sell_Watches";
        String userName = "sa";
        String password = "14042001";

        return getConnection(hostName, database,
                userName, password);
    }
    public static Connection getConnection(String hostName, String database, String userName, String password) throws SQLException, ClassNotFoundException {
        DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String connectionURL = "jdbc:sqlserver://"+hostName+":1433;"
                + "databaseName="+database+";";
        Connection conn=DriverManager.getConnection(connectionURL,userName,password);
        return conn;
    }
}
