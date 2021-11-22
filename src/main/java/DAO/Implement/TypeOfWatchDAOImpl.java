package DAO.Implement;

import DAO.DBConnection;
import DAO.TypeOfWatchDAO;
import Model.TypeOfWatch;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class TypeOfWatchDAOImpl implements TypeOfWatchDAO
{
    @Override
    public void addTypeOfWatch(TypeOfWatch a) throws SQLException, ClassNotFoundException {
        Connection conn=DBConnection.getConnection();
        String sql="{call sp_Insert_Brand(?)}";
        try
        {
            CallableStatement csmt=conn.prepareCall(sql);
            csmt.setString(1,a.getName());
            csmt.executeUpdate();
            conn.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }

    @Override
    public void delTypeOfWatch(int ID) throws SQLException, ClassNotFoundException {
        Connection conn=DBConnection.getConnection();
        String sql="{call sp_Delete_Brand(?)}";
        try
        {
            CallableStatement ps=conn.prepareCall(sql);
            ps.setInt(1,ID);
            ps.executeUpdate();
            conn.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }

    @Override
    public List<TypeOfWatch> getList() throws SQLException, ClassNotFoundException {
        Connection conn= DBConnection.getConnection();

        String sql="Select * from Brand";
        List<TypeOfWatch>list=new ArrayList<TypeOfWatch>();
        try
        {
            PreparedStatement ps= conn.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            while (rs.next())
            {
                int ID=rs.getInt("ID");
                String Name=rs.getString("Name");
                list.add(new TypeOfWatch(ID,Name));
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
    public List<TypeOfWatch> getListByName(String name) throws SQLException, ClassNotFoundException {
        Connection conn= DBConnection.getConnection();

        String sql="{call sp_SearchName_Brand(?)}";
        List<TypeOfWatch>list=new ArrayList<TypeOfWatch>();
        try
        {
            PreparedStatement ps= conn.prepareStatement(sql);
            ps.setString(1,name);
            ResultSet rs=ps.executeQuery();
            while (rs.next())
            {
                int ID=rs.getInt("ID");
                String Name=rs.getString("Name");
                list.add(new TypeOfWatch(ID,Name));
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
    public TypeOfWatch getTypeOfWatch(int Id) throws SQLException, ClassNotFoundException {
        Connection conn=DBConnection.getConnection();
        String sql="Select * from Brand Where ID= ?";
        TypeOfWatch tow=new TypeOfWatch();
        try
        {
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setInt(1,Id);
            ResultSet rs=ps.executeQuery();
            while (rs.next())
            {
                int ID=rs.getInt("ID");
                String Name=rs.getString("Name");
                tow=new TypeOfWatch(ID,Name);
            }
            conn.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        return tow;
    }

    @Override
    public void updateTyOfWatch(TypeOfWatch a) throws SQLException, ClassNotFoundException {
        Connection conn=DBConnection.getConnection();
        String sql="{call sp_Update_Brand (?,?)}";
        try
        {
            CallableStatement csmt=conn.prepareCall(sql);
            csmt.setInt(1,a.getID());
            csmt.setString(2,a.getName());
            csmt.executeUpdate();
            conn.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }
}
