package DAO.Implement;

import DAO.AccountDAO;
import DAO.DBConnection;
import Model.Account;

import java.sql.*;

public class AccountDAOImpl implements AccountDAO
{

    @Override
    public void addAccount(Account a) throws SQLException, ClassNotFoundException {
        Connection conn=DBConnection.getConnection();
        String sql="{call sp_Insert_Account(?,?,?,?)}";
        try
        {
            CallableStatement csmt=conn.prepareCall(sql);
            csmt.setString(1,a.getUserID());
            csmt.setString(2,a.getUserName());
            csmt.setString(3,a.getPassword());
            csmt.setString(4,a.getRole());
            csmt.executeUpdate();
            conn.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }

    @Override
    public void delAccount(String UserID) throws SQLException, ClassNotFoundException {
        Connection conn=DBConnection.getConnection();
        String sql="{call sp_Delete_Account(?)}";
        try
        {
            CallableStatement ps=conn.prepareCall(sql);
            ps.setString(1,UserID);
            ps.executeUpdate();
            conn.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }

    @Override
    public Account getAccount(String UserId) throws SQLException, ClassNotFoundException {
        Connection conn= DBConnection.getConnection();
        String sql="Select * from Account Where UserID= ?";
        Account a=new Account();
        try
        {
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setString(1,UserId);
            ResultSet rs=ps.executeQuery();
            while (rs.next())
            {
                String UserID=rs.getString("UserID");
                String UserName=rs.getString("UserName");
                String Password=rs.getString("Password");
                String Role=rs.getString("Role");
                a=new Account(UserID,UserName,Password,Role);
            }
            conn.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        return a;
    }

    @Override
    public Account getAccountByUserName(String userName) throws SQLException, ClassNotFoundException {
        Connection conn= DBConnection.getConnection();
        String sql="Select * from Account Where UserName= ?";
        Account a=new Account();
        try
        {
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setString(1,userName);
            ResultSet rs=ps.executeQuery();
            while (rs.next())
            {
                String UserID=rs.getString("UserID");
                String UserName=rs.getString("UserName");
                String Password=rs.getString("Password");
                String Role=rs.getString("Role");
                a=new Account(UserID,UserName,Password,Role);
            }
            conn.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        return a;
    }

    @Override
    public void updateAccount(Account a) throws SQLException, ClassNotFoundException {
        Connection conn=DBConnection.getConnection();
        String sql="{call sp_Update_Account (?,?)}";
        try
        {
            CallableStatement csmt=conn.prepareCall(sql);
            csmt.setString(1,a.getUserID());
            csmt.setString(2,a.getPassword());
            csmt.executeUpdate();
            conn.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }
    @Override
    public boolean login(String UserName,String Password) throws SQLException, ClassNotFoundException {
        Connection conn=DBConnection.getConnection();
        String sql = "select * from account where username='" + UserName
                + "' and password='" + Password + "'";
        PreparedStatement ps;
        try {
            ps = (PreparedStatement) conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                conn.close();
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
