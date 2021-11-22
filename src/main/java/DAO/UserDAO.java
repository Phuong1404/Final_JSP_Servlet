package DAO;

import Model.User;

import java.sql.SQLException;
import java.util.List;

public interface UserDAO
{
    public void addUser(User a) throws SQLException, ClassNotFoundException;

    public void delUser(String ID) throws SQLException, ClassNotFoundException;

    public List<User>getList() throws SQLException, ClassNotFoundException;

    public List<User>getListByName(String name) throws SQLException, ClassNotFoundException;

    public User getUser(String ID) throws SQLException, ClassNotFoundException;

    public User getUserByPhone(String Phone) throws SQLException, ClassNotFoundException;

    public void updateUser(User a) throws SQLException, ClassNotFoundException;
}
