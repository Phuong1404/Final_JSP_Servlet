package DAO;

import Model.Transport;

import java.sql.SQLException;
import java.util.List;

public interface TransportDAO {

    public void addTransport(Transport a) throws SQLException, ClassNotFoundException;

    public void delTransport(String ID) throws SQLException,ClassNotFoundException;

    public void updateTransport(String ID) throws SQLException,ClassNotFoundException;

    public List<Transport> getList(String UserID) throws SQLException, ClassNotFoundException;

    public Transport getTransport(String ID) throws SQLException, ClassNotFoundException;

}
