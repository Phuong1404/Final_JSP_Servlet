package Controller;

import DAO.Implement.InvoiceDAOImpl;
import DAO.Implement.TransportDAOImpl;
import Model.Transport;
import Model.Watch;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class loadTransport extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public loadTransport() {

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        TransportDAOImpl tran=new TransportDAOImpl();
        List<Transport> tr=new ArrayList<Transport>();
        try {
            tr=tran.getList();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        PrintWriter out=response.getWriter();
        for(Transport i:tr) {
            if (i.getCheckS() == false) {
                out.println("<tr>\n" +
                        "                                        <td id=\"color\">" + i.getInvoice_ID() + "</td>\n" +
                        "                                        <td>" + i.getName() + "</td>\n" +
                        "                                        <td>" + i.getAddress() + "</td>\n" +
                        "                                        <td>" + i.getPhone() + "</td>\n" +
                        "                                        <td>" + i.getMethodShip() + "</td>\n" +
                        "                                        <td>" + i.getTotal() + "</td>\n" +
                        "                                        <td>" + i.getStatus() + "</td>\n" +
                        "                                        <td>\n" +
                        "                                            <a  class=\"text-danger mr-2\"  onclick=\"Update('" + i.getID() + "')\">\n" +
                        "                                                <i class=\"fas fa-check\"></i>\n Xác nhận" +
                        "                                            </a>\n" +
                        "                                            <a class=\"text-danger mr-2\" onclick=\"Delete('" + i.getID() + ","+i.getInvoice_ID()+"')\">\n" +
                        "                                                <i class=\"fas fa-trash-alt\"></i>\n Xóa" +
                        "                                            </a>\n" +
                        "                                        </td>\n" +
                        "                                    </tr>");
            }
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //delete
        String ID=request.getParameter("ID");
        String Invoice_ID=request.getParameter("Invoice_ID");
        TransportDAOImpl tran=new TransportDAOImpl();
        InvoiceDAOImpl in=new InvoiceDAOImpl();
        try {
            tran.delTransport(ID);
            in.delInvoice(Invoice_ID);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
