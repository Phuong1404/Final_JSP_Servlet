package Controller.Product;

import DAO.Implement.InvoiceDeailDAOImpl;
import DAO.Implement.TransportDAOImpl;
import DAO.MyUtils;
import Model.Account;
import Model.InvoiceDetail;
import Model.Transport;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class InvoiceDetail1 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     */
    public InvoiceDetail1()
    {
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ID =request.getParameter("id");
        HttpSession session=request.getSession();
        Account loginedUser= MyUtils.getLoginedUser(session);
        Transport tr=new Transport();
        TransportDAOImpl tran=new TransportDAOImpl();
        List<InvoiceDetail> inv=new ArrayList<InvoiceDetail>();
        InvoiceDeailDAOImpl InDetail=new InvoiceDeailDAOImpl();
        try {
            tr=tran.getTransport(ID);
            inv=InDetail.getList(ID);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        if(loginedUser==null)
        {
            MyUtils.storelink(session,"http://localhost:8082/JSP_servlet_war_exploded/invoicedetail?id="+ID);
            response.sendRedirect(request.getContextPath()+"/login");
            return;
        }
        request.setAttribute("product",inv);
        request.setAttribute("info",tr);
        RequestDispatcher dispatcher=this.getServletContext().getRequestDispatcher("/invoicedetail.jsp");
        dispatcher.forward(request, response);
    }
}
