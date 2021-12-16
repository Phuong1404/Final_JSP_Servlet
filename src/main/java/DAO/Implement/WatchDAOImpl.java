package DAO.Implement;

import DAO.DBConnection;
import DAO.WatchDAO;
import Model.Watch;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class WatchDAOImpl implements WatchDAO
{

    @Override
    public void addWatch(Watch c) throws SQLException, ClassNotFoundException {
        Connection conn= DBConnection.getConnection();
        String sql="{call sp_Insert_Watch(?,?,?,?,?,?,?)}";
        try
        {
            CallableStatement csnt= conn.prepareCall(sql);
            csnt.setString(1,c.getName());
            csnt.setInt(2,c.getTypeOfWatch_ID());
            csnt.setString(3,c.getMachineType());
            csnt.setString(4,c.getWireType());
            csnt.setInt(5,c.getPrice());
            csnt.setInt(6,c.getQuantityInStock());
            csnt.setInt(7,c.getSale());
            csnt.executeUpdate();
            conn.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }

    @Override
    public void delWatch(String ID) throws SQLException, ClassNotFoundException {
        Connection conn =DBConnection.getConnection();
        String sql="{call sp_Delete_Watch(?)}";
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
    public List<Watch> getList() throws SQLException, ClassNotFoundException {
        Connection conn =DBConnection.getConnection();
        String sql="SELECT ID,Name,Brand_ID,MachineType,WireType,Price,QuantityInStock,Photos,Sale FROM dbo.Watch,dbo.PhotosOfWatch WHERE Watch_ID=ID AND  SUBSTRING(Photos,6,1)=1";
        List<Watch>list = new ArrayList<Watch>();
        try
        {
            PreparedStatement ps=conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next())
            {
                String ID=rs.getString(1);
                String Name=rs.getString(2);
                int TypeOfWatch_ID=rs.getInt(3);
                String MachineType=rs.getString(4);
                String WireType=rs.getString(5);
                int Price =rs.getInt(6);
                int QuantityInStock=rs.getInt(7);
                String Image=rs.getString(8);
                int Sale =rs.getInt(9);
                list.add(new Watch(ID,Name,TypeOfWatch_ID,MachineType,WireType,Price,QuantityInStock,Image,Sale));
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
    public List<Watch> getWatch(String id) throws SQLException, ClassNotFoundException {
        Connection conn =DBConnection.getConnection();
        String sql="SELECT Watch.ID,Watch.Name,Brand.Name AS Brand,MachineType,WireType,Price,QuantityInStock,Photos,Sale FROM dbo.Brand,dbo.Watch,dbo.PhotosOfWatch WHERE Brand_ID=Brand.ID AND Watch.ID=Watch_ID AND Watch.ID=?";
        List<Watch>list = new ArrayList<Watch>();
        try
        {
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setString(1,id);
            ResultSet rs = ps.executeQuery();
            while (rs.next())
            {
                String ID=rs.getString(1);
                String Name=rs.getString(2);
                String TypeOfWatch_ID=rs.getString(3);
                String MachineType=rs.getString(4);
                String WireType=rs.getString(5);
                int Price =rs.getInt(6);
                int QuantityInStock=rs.getInt(7);
                String Image=rs.getString(8);
                int Sale =rs.getInt(9);
                list.add(new Watch(ID,Name,TypeOfWatch_ID,MachineType,WireType,Price,QuantityInStock,Image,Sale));
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
    public List<Watch> getListPage(int page) throws SQLException, ClassNotFoundException {
        Connection conn =DBConnection.getConnection();
        String sql="{call sp_LoadPage(?)}";
        List<Watch>list = new ArrayList<Watch>();
        try
        {
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setInt(1,page);
            ResultSet rs = ps.executeQuery();
            while (rs.next())
            {
                String ID=rs.getString(1);
                String Name=rs.getString(2);
                int TypeOfWatch_ID=rs.getInt(3);
                String MachineType=rs.getString(4);
                String WireType=rs.getString(5);
                int Price =rs.getInt(6);
                int QuantityInStock=rs.getInt(7);
                String Image=rs.getString(8);
                int Sale =rs.getInt(9);
                list.add(new Watch(ID,Name,TypeOfWatch_ID,MachineType,WireType,Price,QuantityInStock,Image,Sale));
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
    public List<Watch> getListByName(String name) throws SQLException, ClassNotFoundException {
        Connection conn =DBConnection.getConnection();
        String sql="{call sp_SearchName_Watch(?)}";
        List<Watch>list = new ArrayList<Watch>();
        try
        {
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setString(1,name);
            ResultSet rs = ps.executeQuery();
            while (rs.next())
            {
                String ID=rs.getString(1);
                String Name=rs.getString(2);
                int TypeOfWatch_ID=rs.getInt(3);
                String MachineType=rs.getString(4);
                String WireType=rs.getString(5);
                int Price =rs.getInt(6);
                int QuantityInStock=rs.getInt(7);
                int Sale =rs.getInt(8);
                list.add(new Watch(ID,Name,TypeOfWatch_ID,MachineType,WireType,Price,QuantityInStock,Sale));
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
    public Watch getOneWatch(String Id) throws SQLException, ClassNotFoundException {
        Connection conn =DBConnection.getConnection();
        String sql="SELECT Watch.ID,Watch.Name,Brand.Name AS Brand,MachineType,WireType,Price,QuantityInStock,Sale FROM dbo.Brand,dbo.Watch WHERE Brand_ID=Brand.ID AND Watch.ID=?";
        Watch w=new Watch();
        try
        {
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setString(1,Id);
            ResultSet rs= ps.executeQuery();
            while (rs.next())
            {
                String ID=rs.getString(1);
                String Name=rs.getString(2);
                String TypeOfWatch_ID=rs.getString(3);
                String MachineType=rs.getString(4);
                String WireType=rs.getString(5);
                int Price =rs.getInt(6);
                int QuantityInStock=rs.getInt(7);
                int Sale =rs.getInt(8);
                w=new Watch(ID,Name,TypeOfWatch_ID,MachineType,WireType,Price,QuantityInStock,"1234",Sale);
            }
            conn.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        return w;
    }

    @Override
    public Watch getOneWatchByName(String name) throws SQLException, ClassNotFoundException {
        Connection conn =DBConnection.getConnection();
        String sql="SELECT Watch.ID,Watch.Name,Brand.Name AS Brand,MachineType,WireType,Price,QuantityInStock,Sale FROM dbo.Brand,dbo.Watch WHERE Brand_ID=Brand.ID AND Watch.Name=?";
        Watch w=new Watch();
        try
        {
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setString(1,name);
            ResultSet rs= ps.executeQuery();
            while (rs.next())
            {
                String ID=rs.getString(1);
                String Name=rs.getString(2);
                String TypeOfWatch_ID=rs.getString(3);
                String MachineType=rs.getString(4);
                String WireType=rs.getString(5);
                int Price =rs.getInt(6);
                int QuantityInStock=rs.getInt(7);
                int Sale =rs.getInt(8);
                w=new Watch(ID,Name,TypeOfWatch_ID,MachineType,WireType,Price,QuantityInStock,"1234",Sale);
            }
            conn.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        return w;
    }

    @Override
    public Watch getOneWatch1(String Id) throws SQLException, ClassNotFoundException {
        Connection conn =DBConnection.getConnection();
        String sql="SELECT * FROM dbo.Watch WHERE Watch.ID=?";
        Watch w=new Watch();
        try
        {
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setString(1,Id);
            ResultSet rs= ps.executeQuery();
            while (rs.next())
            {
                String ID=rs.getString(1);
                String Name=rs.getString(2);
                int TypeOfWatch_ID=rs.getInt(3);
                String MachineType=rs.getString(4);
                String WireType=rs.getString(5);
                int Price =rs.getInt(6);
                int QuantityInStock=rs.getInt(7);
                int Sale =rs.getInt(8);
                w=new Watch(ID,Name,TypeOfWatch_ID,MachineType,WireType,Price,QuantityInStock,Sale);
            }
            conn.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        return w;
    }

    @Override
    public List<Watch> getWatchByType(int TypeOfWatch_Id) throws SQLException, ClassNotFoundException {
        Connection conn =DBConnection.getConnection();
        String sql="Select * from Watch where TypeOfWatch_ID=?";
        List<Watch>list = new ArrayList<Watch>();
        try
        {
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setInt(1,TypeOfWatch_Id);
            ResultSet rs = ps.executeQuery();
            while (rs.next())
            {
                String ID=rs.getString(1);
                String Name=rs.getString(2);
                int TypeOfWatch_ID=rs.getInt(3);
                String MachineType=rs.getString(4);
                String WireType=rs.getString(5);
                int Price =rs.getInt(6);
                int QuantityInStock=rs.getInt(7);
                int Sale =rs.getInt(8);
                list.add(new Watch(ID,Name,TypeOfWatch_ID,MachineType,WireType,Price,QuantityInStock,Sale));
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
    public void updateWatch(Watch a) throws SQLException, ClassNotFoundException {
        Connection conn=DBConnection.getConnection();
        String sql="{call sp_Update_Watch (?,?,?,?,?,?,?,?)}";
        try
        {
            CallableStatement csnt=conn.prepareCall(sql);
            csnt.setString(1,a.getID());
            csnt.setString(2,a.getName());
            csnt.setInt(3,a.getTypeOfWatch_ID());
            csnt.setString(4,a.getMachineType());
            csnt.setString(5,a.getWireType());
            csnt.setInt(6,a.getPrice());
            csnt.setInt(7,a.getQuantityInStock());
            csnt.setInt(8,a.getSale());
            csnt.executeUpdate();
            conn.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }

    @Override
    public List<Watch> getList1() throws SQLException, ClassNotFoundException {
        //Rolex
        Connection conn =DBConnection.getConnection();
        String sql="SELECT ID,Name,Brand_ID,MachineType,WireType,Price,QuantityInStock,Photos,Sale FROM dbo.Watch,dbo.PhotosOfWatch WHERE Watch_ID=ID AND  SUBSTRING(Photos,6,1)=1 AND Brand_ID=1";
        List<Watch>list = new ArrayList<Watch>();
        try
        {
            PreparedStatement ps=conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next())
            {
                String ID=rs.getString(1);
                String Name=rs.getString(2);
                int TypeOfWatch_ID=rs.getInt(3);
                String MachineType=rs.getString(4);
                String WireType=rs.getString(5);
                int Price =rs.getInt(6);
                int QuantityInStock=rs.getInt(7);
                String Image=rs.getString(8);
                int Sale =rs.getInt(9);
                list.add(new Watch(ID,Name,TypeOfWatch_ID,MachineType,WireType,Price,QuantityInStock,Image,Sale));
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
    public List<Watch> getList2() throws SQLException, ClassNotFoundException {
        //Omega
        Connection conn =DBConnection.getConnection();
        String sql="SELECT ID,Name,Brand_ID,MachineType,WireType,Price,QuantityInStock,Photos,Sale FROM dbo.Watch,dbo.PhotosOfWatch WHERE Watch_ID=ID AND  SUBSTRING(Photos,6,1)=1 AND Brand_ID=2";
        List<Watch>list = new ArrayList<Watch>();
        try
        {
            PreparedStatement ps=conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next())
            {
                String ID=rs.getString(1);
                String Name=rs.getString(2);
                int TypeOfWatch_ID=rs.getInt(3);
                String MachineType=rs.getString(4);
                String WireType=rs.getString(5);
                int Price =rs.getInt(6);
                int QuantityInStock=rs.getInt(7);
                String Image=rs.getString(8);
                int Sale =rs.getInt(9);
                list.add(new Watch(ID,Name,TypeOfWatch_ID,MachineType,WireType,Price,QuantityInStock,Image,Sale));
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
    public List<Watch> getList3() throws SQLException, ClassNotFoundException {
        //Hublot
        Connection conn =DBConnection.getConnection();
        String sql="SELECT ID,Name,Brand_ID,MachineType,WireType,Price,QuantityInStock,Photos,Sale FROM dbo.Watch,dbo.PhotosOfWatch WHERE Watch_ID=ID AND  SUBSTRING(Photos,6,1)=1 AND Brand_ID=3";
        List<Watch>list = new ArrayList<Watch>();
        try
        {
            PreparedStatement ps=conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next())
            {
                String ID=rs.getString(1);
                String Name=rs.getString(2);
                int TypeOfWatch_ID=rs.getInt(3);
                String MachineType=rs.getString(4);
                String WireType=rs.getString(5);
                int Price =rs.getInt(6);
                int QuantityInStock=rs.getInt(7);
                String Image=rs.getString(8);
                int Sale =rs.getInt(9);
                list.add(new Watch(ID,Name,TypeOfWatch_ID,MachineType,WireType,Price,QuantityInStock,Image,Sale));
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
    public List<Watch> getList4() throws SQLException, ClassNotFoundException {
        //5 - 10 tr
        Connection conn =DBConnection.getConnection();
        String sql="SELECT ID,Name,Brand_ID,MachineType,WireType,Price,QuantityInStock,Photos,Sale FROM dbo.Watch,dbo.PhotosOfWatch WHERE Watch_ID=ID AND  SUBSTRING(Photos,6,1)=1 AND Price>=5000000 AND Price<=10000000";
        List<Watch>list = new ArrayList<Watch>();
        try
        {
            PreparedStatement ps=conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next())
            {
                String ID=rs.getString(1);
                String Name=rs.getString(2);
                int TypeOfWatch_ID=rs.getInt(3);
                String MachineType=rs.getString(4);
                String WireType=rs.getString(5);
                int Price =rs.getInt(6);
                int QuantityInStock=rs.getInt(7);
                String Image=rs.getString(8);
                int Sale =rs.getInt(9);
                list.add(new Watch(ID,Name,TypeOfWatch_ID,MachineType,WireType,Price,QuantityInStock,Image,Sale));
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
    public List<Watch> getList5() throws SQLException, ClassNotFoundException {
        //10 - 20 tr
        Connection conn =DBConnection.getConnection();
        String sql="SELECT ID,Name,Brand_ID,MachineType,WireType,Price,QuantityInStock,Photos,Sale FROM dbo.Watch,dbo.PhotosOfWatch WHERE Watch_ID=ID AND  SUBSTRING(Photos,6,1)=1 AND Price>=10000000 AND Price<=20000000";
        List<Watch>list = new ArrayList<Watch>();
        try
        {
            PreparedStatement ps=conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next())
            {
                String ID=rs.getString(1);
                String Name=rs.getString(2);
                int TypeOfWatch_ID=rs.getInt(3);
                String MachineType=rs.getString(4);
                String WireType=rs.getString(5);
                int Price =rs.getInt(6);
                int QuantityInStock=rs.getInt(7);
                String Image=rs.getString(8);
                int Sale =rs.getInt(9);
                list.add(new Watch(ID,Name,TypeOfWatch_ID,MachineType,WireType,Price,QuantityInStock,Image,Sale));
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
    public List<Watch> getList6() throws SQLException, ClassNotFoundException {
        Connection conn =DBConnection.getConnection();
        String sql="SELECT ID,Name,Brand_ID,MachineType,WireType,Price,QuantityInStock,Photos,Sale FROM dbo.Watch,dbo.PhotosOfWatch WHERE Watch_ID=ID AND  SUBSTRING(Photos,6,1)=1 AND Price>=20000000 AND Price<=50000000";
        List<Watch>list = new ArrayList<Watch>();
        try
        {
            PreparedStatement ps=conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next())
            {
                String ID=rs.getString(1);
                String Name=rs.getString(2);
                int TypeOfWatch_ID=rs.getInt(3);
                String MachineType=rs.getString(4);
                String WireType=rs.getString(5);
                int Price =rs.getInt(6);
                int QuantityInStock=rs.getInt(7);
                String Image=rs.getString(8);
                int Sale =rs.getInt(9);
                list.add(new Watch(ID,Name,TypeOfWatch_ID,MachineType,WireType,Price,QuantityInStock,Image,Sale));
            }
            conn.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        return list;
    }

    public List<Watch> getList7() throws SQLException, ClassNotFoundException {
        Connection conn =DBConnection.getConnection();
        String sql="SELECT ID,Name,Brand_ID,MachineType,WireType,Price,QuantityInStock,Photos,Sale FROM dbo.Watch,dbo.PhotosOfWatch WHERE Watch_ID=ID AND  SUBSTRING(Photos,6,1)=1 AND Price>=50000000 AND Price<=100000000";
        List<Watch>list = new ArrayList<Watch>();
        try
        {
            PreparedStatement ps=conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next())
            {
                String ID=rs.getString(1);
                String Name=rs.getString(2);
                int TypeOfWatch_ID=rs.getInt(3);
                String MachineType=rs.getString(4);
                String WireType=rs.getString(5);
                int Price =rs.getInt(6);
                int QuantityInStock=rs.getInt(7);
                String Image=rs.getString(8);
                int Sale =rs.getInt(9);
                list.add(new Watch(ID,Name,TypeOfWatch_ID,MachineType,WireType,Price,QuantityInStock,Image,Sale));
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
    public List<Watch> getList8() throws SQLException, ClassNotFoundException {
        //cơ
        Connection conn =DBConnection.getConnection();
        String sql="SELECT ID,Name,Brand_ID,MachineType,WireType,Price,QuantityInStock,Photos,Sale FROM dbo.Watch,dbo.PhotosOfWatch WHERE Watch_ID=ID AND  SUBSTRING(Photos,6,1)=1 AND MachineType=N'Pin'";
        List<Watch>list = new ArrayList<Watch>();
        try
        {
            PreparedStatement ps=conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next())
            {
                String ID=rs.getString(1);
                String Name=rs.getString(2);
                int TypeOfWatch_ID=rs.getInt(3);
                String MachineType=rs.getString(4);
                String WireType=rs.getString(5);
                int Price =rs.getInt(6);
                int QuantityInStock=rs.getInt(7);
                String Image=rs.getString(8);
                int Sale =rs.getInt(9);
                list.add(new Watch(ID,Name,TypeOfWatch_ID,MachineType,WireType,Price,QuantityInStock,Image,Sale));
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
    public List<Watch> getList9() throws SQLException, ClassNotFoundException {
        //pin
        Connection conn =DBConnection.getConnection();
        String sql="SELECT ID,Name,Brand_ID,MachineType,WireType,Price,QuantityInStock,Photos,Sale FROM dbo.Watch,dbo.PhotosOfWatch WHERE Watch_ID=ID AND  SUBSTRING(Photos,6,1)=1 AND MachineType=N'Quang'";
        List<Watch>list = new ArrayList<Watch>();
        try
        {
            PreparedStatement ps=conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next())
            {
                String ID=rs.getString(1);
                String Name=rs.getString(2);
                int TypeOfWatch_ID=rs.getInt(3);
                String MachineType=rs.getString(4);
                String WireType=rs.getString(5);
                int Price =rs.getInt(6);
                int QuantityInStock=rs.getInt(7);
                String Image=rs.getString(8);
                int Sale =rs.getInt(9);
                list.add(new Watch(ID,Name,TypeOfWatch_ID,MachineType,WireType,Price,QuantityInStock,Image,Sale));
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
    public List<Watch> getList10() throws SQLException, ClassNotFoundException {
        //quang
        Connection conn =DBConnection.getConnection();
        String sql="SELECT ID,Name,Brand_ID,MachineType,WireType,Price,QuantityInStock,Photos,Sale FROM dbo.Watch,dbo.PhotosOfWatch WHERE Watch_ID=ID AND  SUBSTRING(Photos,6,1)=1 AND MachineType=N'Cơ'";
        List<Watch>list = new ArrayList<Watch>();
        try
        {
            PreparedStatement ps=conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next())
            {
                String ID=rs.getString(1);
                String Name=rs.getString(2);
                int TypeOfWatch_ID=rs.getInt(3);
                String MachineType=rs.getString(4);
                String WireType=rs.getString(5);
                int Price =rs.getInt(6);
                int QuantityInStock=rs.getInt(7);
                String Image=rs.getString(8);
                int Sale =rs.getInt(9);
                list.add(new Watch(ID,Name,TypeOfWatch_ID,MachineType,WireType,Price,QuantityInStock,Image,Sale));
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
    public List<Watch> getList11() throws SQLException, ClassNotFoundException {
        //da
        Connection conn =DBConnection.getConnection();
        String sql="SELECT ID,Name,Brand_ID,MachineType,WireType,Price,QuantityInStock,Photos,Sale FROM dbo.Watch,dbo.PhotosOfWatch WHERE Watch_ID=ID AND  SUBSTRING(Photos,6,1)=1 AND WireType=N'Dây Da'";
        List<Watch>list = new ArrayList<Watch>();
        try
        {
            PreparedStatement ps=conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next())
            {
                String ID=rs.getString(1);
                String Name=rs.getString(2);
                int TypeOfWatch_ID=rs.getInt(3);
                String MachineType=rs.getString(4);
                String WireType=rs.getString(5);
                int Price =rs.getInt(6);
                int QuantityInStock=rs.getInt(7);
                String Image=rs.getString(8);
                int Sale =rs.getInt(9);
                list.add(new Watch(ID,Name,TypeOfWatch_ID,MachineType,WireType,Price,QuantityInStock,Image,Sale));
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
    public List<Watch> getList12() throws SQLException, ClassNotFoundException {
        //nhựa
        Connection conn =DBConnection.getConnection();
        String sql="SELECT ID,Name,Brand_ID,MachineType,WireType,Price,QuantityInStock,Photos,Sale FROM dbo.Watch,dbo.PhotosOfWatch WHERE Watch_ID=ID AND  SUBSTRING(Photos,6,1)=1 AND WireType=N'Dây Nhựa'";
        List<Watch>list = new ArrayList<Watch>();
        try
        {
            PreparedStatement ps=conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next())
            {
                String ID=rs.getString(1);
                String Name=rs.getString(2);
                int TypeOfWatch_ID=rs.getInt(3);
                String MachineType=rs.getString(4);
                String WireType=rs.getString(5);
                int Price =rs.getInt(6);
                int QuantityInStock=rs.getInt(7);
                String Image=rs.getString(8);
                int Sale =rs.getInt(9);
                list.add(new Watch(ID,Name,TypeOfWatch_ID,MachineType,WireType,Price,QuantityInStock,Image,Sale));
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
    public List<Watch> getList13() throws SQLException, ClassNotFoundException {
        //kim loại
        Connection conn =DBConnection.getConnection();
        String sql="SELECT ID,Name,Brand_ID,MachineType,WireType,Price,QuantityInStock,Photos,Sale FROM dbo.Watch,dbo.PhotosOfWatch WHERE Watch_ID=ID AND  SUBSTRING(Photos,6,1)=1 AND WireType=N'Dây Vải'";
        List<Watch>list = new ArrayList<Watch>();
        try
        {
            PreparedStatement ps=conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next())
            {
                String ID=rs.getString(1);
                String Name=rs.getString(2);
                int TypeOfWatch_ID=rs.getInt(3);
                String MachineType=rs.getString(4);
                String WireType=rs.getString(5);
                int Price =rs.getInt(6);
                int QuantityInStock=rs.getInt(7);
                String Image=rs.getString(8);
                int Sale =rs.getInt(9);
                list.add(new Watch(ID,Name,TypeOfWatch_ID,MachineType,WireType,Price,QuantityInStock,Image,Sale));
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
    public List<Watch> getList14() throws SQLException, ClassNotFoundException {
        //dây kim loại
        Connection conn =DBConnection.getConnection();
        String sql="SELECT ID,Name,Brand_ID,MachineType,WireType,Price,QuantityInStock,Photos,Sale FROM dbo.Watch,dbo.PhotosOfWatch WHERE Watch_ID=ID AND  SUBSTRING(Photos,6,1)=1 AND WireType=N'Dây Kim Loại'";
        List<Watch>list = new ArrayList<Watch>();
        try
        {
            PreparedStatement ps=conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next())
            {
                String ID=rs.getString(1);
                String Name=rs.getString(2);
                int TypeOfWatch_ID=rs.getInt(3);
                String MachineType=rs.getString(4);
                String WireType=rs.getString(5);
                int Price =rs.getInt(6);
                int QuantityInStock=rs.getInt(7);
                String Image=rs.getString(8);
                int Sale =rs.getInt(9);
                list.add(new Watch(ID,Name,TypeOfWatch_ID,MachineType,WireType,Price,QuantityInStock,Image,Sale));
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
    public List<Watch> getList15(String data) throws SQLException, ClassNotFoundException {
        //search Name
        data=data.replace(data.substring(data.length()-1), "");
        Connection conn =DBConnection.getConnection();
        String sql="{call sp_Search(?)}";
        List<Watch>list = new ArrayList<Watch>();
        try
        {
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setString(1,data);
            ResultSet rs = ps.executeQuery();
            while (rs.next())
            {
                String ID=rs.getString(1);
                String Name=rs.getString(2);
                int TypeOfWatch_ID=rs.getInt(3);
                String MachineType=rs.getString(4);
                String WireType=rs.getString(5);
                int Price =rs.getInt(6);
                int QuantityInStock=rs.getInt(7);
                String Image=rs.getString(8);
                int Sale =rs.getInt(9);
                list.add(new Watch(ID,Name,TypeOfWatch_ID,MachineType,WireType,Price,QuantityInStock,Image,Sale));
            }
            conn.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        return list;
    }
}
