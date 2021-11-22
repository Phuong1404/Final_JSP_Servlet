package DAO;

import Model.Invoice;

import java.sql.SQLException;
import java.util.List;

public interface InvoiceDAO
{
    public void addInvoice(Invoice a) throws SQLException, ClassNotFoundException;

    public void delInvoice(String ID) throws SQLException, ClassNotFoundException;

    public List<Invoice>getList(String ID) throws SQLException, ClassNotFoundException;

    public Invoice getInvoice(String ID) throws SQLException, ClassNotFoundException;


}
