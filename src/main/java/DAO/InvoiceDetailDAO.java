package DAO;

import Model.InvoiceDetail;

import java.sql.SQLException;
import java.util.List;

public interface InvoiceDetailDAO
{
    public void addInvoiceDetail(InvoiceDetail a) throws SQLException, ClassNotFoundException;

    public void delInvoiceDetail(String Invoice_ID,String Watch_ID) throws SQLException, ClassNotFoundException;

    public List<InvoiceDetail>getList(String Invoice_ID) throws SQLException, ClassNotFoundException;

    public InvoiceDetail getInvoiceDetail(String Invoice_ID,String Watch_ID) throws SQLException, ClassNotFoundException;

    public void updateInvoiceDetail(InvoiceDetail a) throws SQLException, ClassNotFoundException;
}
