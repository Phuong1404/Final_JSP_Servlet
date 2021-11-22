package DAO;

import Model.TypeOfWatch;

import java.sql.SQLException;
import java.util.List;

public interface TypeOfWatchDAO
{
    //Thêm loại đồng hồ
    public void addTypeOfWatch(TypeOfWatch a) throws SQLException, ClassNotFoundException;

    public void delTypeOfWatch(int ID) throws SQLException, ClassNotFoundException;

    //Danh sách
    public List<TypeOfWatch>getList() throws SQLException, ClassNotFoundException;

    public List<TypeOfWatch>getListByName(String name) throws SQLException, ClassNotFoundException;

    public TypeOfWatch getTypeOfWatch(int ID) throws SQLException, ClassNotFoundException;

    public void updateTyOfWatch(TypeOfWatch a) throws SQLException, ClassNotFoundException;
}
