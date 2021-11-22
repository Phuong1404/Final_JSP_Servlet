package DAO;

import Model.Watch;

import java.sql.SQLException;
import java.util.List;

public interface WatchDAO
{
    public void addWatch(Watch c) throws SQLException, ClassNotFoundException;

    public void delWatch(String ID) throws SQLException, ClassNotFoundException;

    public List<Watch>getList() throws SQLException, ClassNotFoundException;

    public List<Watch>getWatch(String ID) throws SQLException, ClassNotFoundException;

    public List<Watch>getListPage(int page)throws SQLException, ClassNotFoundException;

    public List<Watch>getListByName(String Name) throws SQLException, ClassNotFoundException;

    public Watch getOneWatch(String ID) throws SQLException, ClassNotFoundException;

    public Watch getOneWatchByName(String Name) throws SQLException, ClassNotFoundException;

    public Watch getOneWatch1(String Id) throws SQLException, ClassNotFoundException;

    public List<Watch> getWatchByType(int TypeOfWatch_ID) throws SQLException, ClassNotFoundException;

    public void updateWatch(Watch a) throws SQLException, ClassNotFoundException;
}
