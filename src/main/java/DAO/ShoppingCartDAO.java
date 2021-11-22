package DAO;

import Model.ShoppingCart;

import java.sql.SQLException;
import java.util.List;

public interface ShoppingCartDAO
{
    public void addCart(ShoppingCart a) throws SQLException, ClassNotFoundException;

    public void delCart(String UserID,String Watch_ID) throws SQLException, ClassNotFoundException;

    public List<ShoppingCart>getList(String UserID) throws SQLException, ClassNotFoundException;

    public ShoppingCart getCart(String UserID,String Watch_ID) throws SQLException, ClassNotFoundException;

    public void updateCart(ShoppingCart a) throws SQLException, ClassNotFoundException;
}
