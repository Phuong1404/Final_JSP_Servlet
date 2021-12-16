package Controller.History;

import DAO.Implement.InvoiceDAOImpl;
import DAO.Implement.TransportDAOImpl;
import DAO.MyUtils;
import Model.Account;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

public class History extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    public History() {

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        Account loginedUser= MyUtils.getLoginedUser(session);
        if(loginedUser==null)
        {
            MyUtils.storelink(session,"http://localhost:8082/JSP_servlet_war_exploded/history");
            response.sendRedirect(request.getContextPath()+"/login");
            return;
        }
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/history.jsp");
        dispatcher.forward(request, response);
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
