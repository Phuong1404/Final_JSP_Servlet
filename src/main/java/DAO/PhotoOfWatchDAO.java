package DAO;

import Model.PhotoOfWatch;

import java.sql.SQLException;
import java.util.List;

public interface PhotoOfWatchDAO
{
    public void addPhotoOfWatch(PhotoOfWatch a) throws SQLException, ClassNotFoundException;

    public void delPhotoOfWatch(String Watch_ID,byte[] Photos);

    public List<PhotoOfWatch>getPhoto(String Watch_ID);
}
