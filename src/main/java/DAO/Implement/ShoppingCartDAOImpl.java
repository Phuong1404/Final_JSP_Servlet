package DAO.Implement;

import DAO.DBConnection;
import DAO.ShoppingCartDAO;
import Model.ShoppingCart;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ShoppingCartDAOImpl implements ShoppingCartDAO
{

    @Override
    public void addCart(ShoppingCart a) throws SQLException, ClassNotFoundException {
        Connection conn = DBConnection.getConnection();
        String sql="{call sp_Insert_Cart(?,?,?)}";
        try
        {
            CallableStatement csnt=conn.prepareCall(sql);
            csnt.setString(1,a.getUserID());
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
    public void delCart(String UserID, String Watch_ID) throws SQLException, ClassNotFoundException {
        Connection conn = DBConnection.getConnection();
        String sql="{call  sp_Delete_Cart(?,?)}";
        try
        {
            CallableStatement csnt=conn.prepareCall(sql);
            csnt.setString(1,UserID);
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
    public List<ShoppingCart> getList(String UserId) throws SQLException, ClassNotFoundException {
        Connection conn =DBConnection.getConnection();
        String sql="Select * from ShoppingCart where UserID= '"+UserId+"'";
        List<ShoppingCart>list = new ArrayList<ShoppingCart>();
        try
        {
            PreparedStatement ps=conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next())
            {
                String UserID=rs.getString("UserID");
                String Watch_ID=rs.getString("Watch_ID");
                int Quantity =rs.getInt("Quantity");
                list.add(new ShoppingCart(UserID,Watch_ID,Quantity));
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
    public ShoppingCart getCart(String UserId, String Watch_Id) throws SQLException, ClassNotFoundException {
        Connection conn =DBConnection.getConnection();
        String sql="Select * from ShoppingCart where UserID= '"+UserId+"' AND Watch_ID='"+Watch_Id+"'";
        ShoppingCart i = new ShoppingCart();
        try
        {
            PreparedStatement ps=conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next())
            {
                String UserID=rs.getString("UserID");
                String Watch_ID=rs.getString("Watch_ID");
                int Quantity =rs.getInt("Quantity");
                i=new ShoppingCart(UserID,Watch_ID,Quantity);
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
    public void updateCart(ShoppingCart a) throws SQLException, ClassNotFoundException {
        Connection conn=DBConnection.getConnection();
        String sql="{call sp_Update_Cart (?,?,?)}";
        try
        {
            CallableStatement csmt=conn.prepareCall(sql);
            csmt.setString(1,a.getUserID());
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
