package DAO.Implement;

import DAO.DBConnection;
import DAO.PhotoOfWatchDAO;
import Model.PhotoOfWatch;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class PhotoOfWatchDAOImpl implements PhotoOfWatchDAO {
    @Override
    public void addPhotoOfWatch(PhotoOfWatch a) throws SQLException, ClassNotFoundException {
        Connection conn= DBConnection.getConnection();
        String sql="{call sp_Insert_PhotosOfWatch(?,?)}";
        try
        {
            CallableStatement csnt= conn.prepareCall(sql);
            csnt.setString(1,a.getWatch_ID());
            csnt.setString(2,a.getPhotos());
            csnt.executeUpdate();
            conn.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }

    @Override
    public void delPhotoOfWatch(String Watch_ID, byte[] Photos) {

    }

    @Override
    public List<PhotoOfWatch> getPhoto(String Watch_ID) {
        return null;
    }
}
