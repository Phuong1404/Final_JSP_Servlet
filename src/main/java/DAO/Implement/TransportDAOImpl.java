package DAO.Implement;

import DAO.DBConnection;
import DAO.TransportDAO;
import Model.Transport;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TransportDAOImpl implements TransportDAO
{

    @Override
    public void addTransport(Transport a) throws SQLException, ClassNotFoundException {
        Connection conn= DBConnection.getConnection();
        String sql="{call sp_Insert_Transport(?,?,?,?,?,?,?,?,?)}";
        try
        {
            CallableStatement csmt=conn.prepareCall(sql);
            csmt.setString(1,a.getInvoice_ID());
            csmt.setString(2,a.getName());
            csmt.setString(3,a.getEmail());
            csmt.setString(4,a.getPhone());
            csmt.setString(5,a.getAddress());
            csmt.setString(6,a.getStatus());
            csmt.setBoolean(7,a.getCheckS());
            csmt.setInt(8,a.getTotal());
            csmt.setString(9,a.getMethodShip());
            csmt.executeUpdate();
            conn.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }

    @Override
    public void delTransport(String ID) throws SQLException, ClassNotFoundException {
        Connection conn=DBConnection.getConnection();
        String sql="{call sp_Delete_Transport(?)}";
        try
        {
            CallableStatement ps=conn.prepareCall(sql);
            ps.setString(1,ID);
            ps.executeUpdate();
            conn.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }

    @Override
    public void updateTransport(String ID) throws SQLException, ClassNotFoundException {
        Connection conn=DBConnection.getConnection();
        String sql="{call sp_Update_Transport(?)}";
        try
        {
            CallableStatement ps=conn.prepareCall(sql);
            ps.setString(1,ID);
            ps.executeUpdate();
            conn.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }

    @Override
    public List<Transport> getList(String UserID) throws SQLException, ClassNotFoundException {
        Connection conn= DBConnection.getConnection();

        String sql="SELECT Transport.ID,Invoice_ID,Name,Email,Phone,Address,Status,CheckS,Total,MethodShip FROM dbo.Transport,dbo.Invoice WHERE Invoice_ID=Invoice.ID AND UserID = ?";
        List<Transport>list=new ArrayList<Transport>();
        try
        {
            PreparedStatement ps= conn.prepareStatement(sql);
            ps.setString(1,UserID);
            ResultSet rs=ps.executeQuery();
            while (rs.next())
            {
                String ID=rs.getString("ID");
                String Invoice_ID=rs.getString("Invoice_ID");
                String Name=rs.getString("Name");
                String Email=rs.getString("Email");
                String Phone=rs.getString("Phone");
                String Address=rs.getString("Address");
                String Status=rs.getString("Status");
                boolean CheckS=rs.getBoolean("CheckS");
                int Total=rs.getInt("Total");
                String MethodShip=rs.getString("MethodShip");

                list.add(new Transport(ID,Invoice_ID,Name,Email,Phone,Address,Status,CheckS,Total,MethodShip));
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
    public Transport getTransport(String Id) throws SQLException, ClassNotFoundException {
        Connection conn=DBConnection.getConnection();
        String sql="SELECT * FROM dbo.Transport WHERE Invoice_ID= ?";
        Transport tr=new Transport();
        try
        {
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setString(1,Id);
            ResultSet rs=ps.executeQuery();
            while (rs.next())
            {
                String ID=rs.getString("ID");
                String Invoice_ID=rs.getString("Invoice_ID");
                String Name=rs.getString("Name");
                String Email=rs.getString("Email");
                String Phone=rs.getString("Phone");
                String Address=rs.getString("Address");
                String Status=rs.getString("Status");
                boolean CheckS=rs.getBoolean("CheckS");
                int Total=rs.getInt("Total");
                String MethodShip=rs.getString("MethodShip");
                tr=new Transport(ID,Invoice_ID,Name,Email,Phone,Address,Status,CheckS,Total,MethodShip);
            }
            conn.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        return tr;
    }
}
