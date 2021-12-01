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

    public List<Watch>getList1() throws SQLException, ClassNotFoundException;

    public List<Watch>getList2() throws SQLException, ClassNotFoundException;

    public List<Watch>getList3() throws SQLException, ClassNotFoundException;

    public List<Watch>getList4() throws SQLException, ClassNotFoundException;

    public List<Watch>getList5() throws SQLException, ClassNotFoundException;

    public List<Watch>getList6() throws SQLException, ClassNotFoundException;

    public List<Watch>getList7() throws SQLException, ClassNotFoundException;

    public List<Watch>getList8() throws SQLException, ClassNotFoundException;

    public List<Watch>getList9() throws SQLException, ClassNotFoundException;

    public List<Watch>getList10() throws SQLException, ClassNotFoundException;

    public List<Watch>getList11() throws SQLException, ClassNotFoundException;

    public List<Watch>getList12() throws SQLException, ClassNotFoundException;

    public List<Watch>getList13() throws SQLException, ClassNotFoundException;

    public List<Watch>getList14() throws SQLException, ClassNotFoundException;

    public List<Watch>getList15(String data) throws SQLException, ClassNotFoundException;
}
