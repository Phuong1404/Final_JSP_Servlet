package DAO.Implement;

import DAO.DBConnection;
import DAO.UserDAO;
import Model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAOImpl implements UserDAO
{

    @Override
    public void addUser(User a) throws SQLException, ClassNotFoundException {
        Connection conn = DBConnection.getConnection();
        String sql="{call sp_Insert_User(?,?,?,?,?)}";
        try
        {
            CallableStatement csnt=conn.prepareCall(sql);
            csnt.setString(1,a.getName());
            csnt.setDate(2,a.getDateOfBirth());
            csnt.setString(3,a.getAddress());
            csnt.setString(4,a.getEmail());
            csnt.setString(5,a.getPhoneNumber());
            csnt.executeUpdate();
            conn.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }

    @Override
    public void delUser(String ID) throws SQLException, ClassNotFoundException {
        Connection conn = DBConnection.getConnection();
        String sql="{call sp_Delete_User(?)}";
        try
        {
            CallableStatement csnt=conn.prepareCall(sql);
            csnt.setString(1,ID);
            csnt.executeUpdate();
            conn.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }

    @Override
    public List<User> getList() throws SQLException, ClassNotFoundException {
        Connection conn =DBConnection.getConnection();
        String sql="Select * from Users";
        List<User>list = new ArrayList<User>();
        try
        {
            PreparedStatement ps=conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next())
            {
                String ID=rs.getString("ID");
                String Name=rs.getString("Name");
                java.sql.Date DateOfBirth=rs.getDate("DayOfBirth");
                String Address =rs.getString("Address");
                String Email=rs.getString("Email");
                String PhoneNumber=rs.getString("PhoneNumber");
                list.add(new User(ID,Name,DateOfBirth,Address,Email,PhoneNumber));
            }
            conn.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<User> getListByName(String name) throws SQLException, ClassNotFoundException {
        Connection conn =DBConnection.getConnection();
        String sql="{call sp_SearchName_User(?)}";
        List<User>list = new ArrayList<User>();
        try
        {
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setString(1,name);
            ResultSet rs = ps.executeQuery();
            while (rs.next())
            {
                String ID=rs.getString("ID");
                String Name=rs.getString("Name");
                java.sql.Date DateOfBirth=rs.getDate("DayOfBirth");
                String Address =rs.getString("Address");
                String Email=rs.getString("Email");
                String PhoneNumber=rs.getString("PhoneNumber");
                list.add(new User(ID,Name,DateOfBirth,Address,Email,PhoneNumber));
            }
            conn.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public User getUser(String Id) throws SQLException, ClassNotFoundException {
        Connection conn=DBConnection.getConnection();
        String sql="Select * from Users Where ID= ?";
        User u=new User();
        try
        {
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setString(1,Id);
            ResultSet rs=ps.executeQuery();
            while (rs.next())
            {
                String ID=rs.getString("ID");
                String Name=rs.getString("Name");
                Date DateOfBirth=rs.getDate("DayOfBirth");
                String Address =rs.getString("Address");
                String Email=rs.getString("Email");
                String PhoneNumber=rs.getString("PhoneNumber");
                u=new User(ID,Name,DateOfBirth,Address,Email,PhoneNumber);
            }
            conn.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        return u;
    }

    @Override
    public User getUserByPhone(String Phone) throws SQLException, ClassNotFoundException {
        Connection conn=DBConnection.getConnection();
        String sql="Select * from Users Where PhoneNumber= ?";
        User u=new User();
        try
        {
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setString(1,Phone);
            ResultSet rs=ps.executeQuery();
            while (rs.next())
            {
                String ID=rs.getString("ID");
                String Name=rs.getString("Name");
                Date DateOfBirth=rs.getDate("DayOfBirth");
                String Address =rs.getString("Address");
                String Email=rs.getString("Email");
                String PhoneNumber=rs.getString("PhoneNumber");
                u=new User(ID,Name,DateOfBirth,Address,Email,PhoneNumber);
            }
            conn.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        return u;
    }

    @Override
    public void updateUser(User a) throws SQLException, ClassNotFoundException {
        Connection conn=DBConnection.getConnection();
        String sql="{call sp_Update_User (?,?,?,?,?,?)}";
        try
        {
            CallableStatement csnt=conn.prepareCall(sql);
            csnt.setString(1,a.getID());
            csnt.setString(2,a.getName());
            csnt.setDate(3,a.getDateOfBirth());
            csnt.setString(4,a.getAddress());
            csnt.setString(5,a.getEmail());
            csnt.setString(6,a.getPhoneNumber());
            csnt.executeUpdate();
            conn.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }
}
