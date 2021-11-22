package DAO.Implement;

import DAO.DBConnection;
import DAO.InvoiceDAO;
import Model.Invoice;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class InvoiceDAOImpl implements InvoiceDAO
{

    @Override
    public void addInvoice(Invoice a) throws SQLException, ClassNotFoundException {
        Connection conn = DBConnection.getConnection();
        String sql="{call sp_Insert_Invoice(?)}";
        try
        {
            CallableStatement csnt=conn.prepareCall(sql);
            csnt.setString(1,a.getUserID());
            csnt.executeUpdate();
            conn.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }

    @Override
    public void delInvoice(String ID) throws SQLException, ClassNotFoundException {
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
    public List<Invoice> getList(String Id) throws SQLException, ClassNotFoundException {
        Connection conn =DBConnection.getConnection();
        String sql="Select * from Invoice where UserID= '"+Id+"'";
        List<Invoice>list = new ArrayList<Invoice>();
        try
        {
            PreparedStatement ps=conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next())
            {
                String ID=rs.getString("ID");
                String UserID=rs.getString("UserID");
                Date TimeOrder=rs.getDate("TimeOrder");
                int TotalMoney =rs.getInt("TotalMoney");
                list.add(new Invoice(ID,UserID,TimeOrder,TotalMoney));
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
    public Invoice getInvoice(String Id) throws SQLException, ClassNotFoundException {
        Connection conn =DBConnection.getConnection();
        String sql="Select * from Invoice where UserID= '"+Id+"' AND TotalMoney IS NULL";
        Invoice i = new Invoice();
        try
        {
            PreparedStatement ps=conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next())
            {
                String ID=rs.getString("ID");
                String UserID=rs.getString("UserID");
                Date TimeOrder=rs.getDate("TimeOrder");
                int TotalMoney =rs.getInt("TotalMoney");
                i=new Invoice(ID,UserID,TimeOrder,TotalMoney);
            }
            conn.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        return i;
    }
}
