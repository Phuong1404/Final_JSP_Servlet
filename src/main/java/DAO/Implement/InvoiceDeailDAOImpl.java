package DAO.Implement;

import DAO.DBConnection;
import DAO.InvoiceDetailDAO;
import Model.InvoiceDetail;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class InvoiceDeailDAOImpl implements InvoiceDetailDAO
{

    @Override
    public void addInvoiceDetail(InvoiceDetail a) throws SQLException, ClassNotFoundException {
        Connection conn = DBConnection.getConnection();
        String sql="{call sp_Insert_InvoiceDetail(?,?,?)}";
        try
        {
            CallableStatement csnt=conn.prepareCall(sql);
            csnt.setString(1,a.getInvoice_ID());
            csnt.setString(2,a.getWatch_ID());
            csnt.setInt(3,a.getQuantity());
            csnt.executeUpdate();
            conn.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }

    @Override
    public void delInvoiceDetailByID(String Invoice_ID) throws SQLException, ClassNotFoundException {
        Connection conn = DBConnection.getConnection();
        String sql="{call sp_Delete_InvoiceDetail(?,?)}";
        try
        {
            CallableStatement csnt=conn.prepareCall(sql);
            csnt.setString(1,Invoice_ID);
            csnt.executeUpdate();
            conn.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }

    @Override
    public void delInvoiceDetail(String Invoice_ID, String Watch_ID) throws SQLException, ClassNotFoundException {
        Connection conn = DBConnection.getConnection();
        String sql="{call sp_Delete_InvoiceDetail(?,?)}";
        try
        {
            CallableStatement csnt=conn.prepareCall(sql);
            csnt.setString(1,Invoice_ID);
            csnt.setString(2,Watch_ID);
            csnt.executeUpdate();
            conn.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }

    @Override
    public List<InvoiceDetail> getList(String Invoice_Id) throws SQLException, ClassNotFoundException {
        Connection conn =DBConnection.getConnection();
        String sql="Select Invoice_ID,PhotosOfWatch.Watch_ID,Quantity,Name,Photos,(Quantity*Price)AS Total from InvoiceDetail,dbo.Watch,dbo.PhotosOfWatch WHERE InvoiceDetail.Watch_ID=ID AND PhotosOfWatch.Watch_ID=ID AND SUBSTRING(Photos,6,1)=1 AND Invoice_ID='"+Invoice_Id+"'";
        List<InvoiceDetail>list = new ArrayList<InvoiceDetail>();
        try
        {
            PreparedStatement ps=conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next())
            {
                String Invoice_ID=rs.getString("Invoice_ID");
                String Watch_ID=rs.getString("Watch_ID");
                int Quantity =rs.getInt("Quantity");
                String Name=rs.getString("Name");
                String Photo=rs.getString("Photos");
                int Total =rs.getInt("Total");
                list.add(new InvoiceDetail(Invoice_ID,Watch_ID,Quantity,Name,Photo,Total));
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
    public InvoiceDetail getInvoiceDetail(String Invoice_Id, String Watch_Id) throws SQLException, ClassNotFoundException {
        Connection conn =DBConnection.getConnection();
        String sql="Select * from InvoiceDetail where Invoice_ID= '"+Invoice_Id+"' AND Watch_ID='"+Watch_Id+"'";
        InvoiceDetail i = new InvoiceDetail();
        try
        {
            PreparedStatement ps=conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next())
            {
                String Invoice_ID=rs.getString("Invoice_ID");
                String Watch_ID=rs.getString("Watch_ID");
                int Quantity =rs.getInt("Quantity");
                i=new InvoiceDetail(Invoice_ID,Watch_ID,Quantity);
            }
            conn.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        return i;
    }

    @Override
    public void updateInvoiceDetail(InvoiceDetail a) throws SQLException, ClassNotFoundException {
        Connection conn=DBConnection.getConnection();
        String sql="{call sp_Update_InvoiceDetail (?,?,?)}";
        try
        {
            CallableStatement csmt=conn.prepareCall(sql);
            csmt.setString(1,a.getInvoice_ID());
            csmt.setString(2,a.getWatch_ID());
            csmt.setInt(3,a.getQuantity());
            csmt.executeUpdate();
            conn.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }
}
