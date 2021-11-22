package DAO;

import Model.Account;

import java.sql.SQLException;


public interface AccountDAO
{
    public void addAccount(Account a) throws SQLException, ClassNotFoundException;

    public void delAccount(String UserID) throws SQLException, ClassNotFoundException;

    public Account getAccount(String UserID) throws SQLException, ClassNotFoundException;

    public Account getAccountByUserName(String UserName) throws SQLException, ClassNotFoundException;

    public void updateAccount(Account a) throws SQLException, ClassNotFoundException;

    public boolean login(String UserName,String Password) throws SQLException, ClassNotFoundException;
}
