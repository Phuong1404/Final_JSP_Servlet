package Controller;

import DAO.Implement.InvoiceDAOImpl;
import DAO.Implement.InvoiceDeailDAOImpl;
import DAO.Implement.ShoppingCartDAOImpl;
import DAO.InvoiceDAO;
import DAO.InvoiceDetailDAO;
import DAO.MyUtils;
import Model.Account;
import Model.Invoice;
import Model.InvoiceDetail;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

public class cartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public cartServlet() {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        Account loginedUser= MyUtils.getLoginedUser(session);
        if(loginedUser==null)
        {
            MyUtils.storelink(session,"http://localhost:8082/JSP_servlet_war_exploded/cart");
            response.sendRedirect(request.getContextPath()+"/login");
            return;
        }
        //trước mỗi sản phẩm sẽ có checkbox khi on thì thêm vào 1 biến data off thì xóa khỏi biến data
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/cart.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String [] ID =request.getParameterValues("ID[]");
        String [] Quan =request.getParameterValues("Quantity[]");
        String Length =request.getParameter("Length");

        HttpSession session=request.getSession();
        Account loginedUser= MyUtils.getLoginedUser(session);
        ShoppingCartDAOImpl Spc=new ShoppingCartDAOImpl();
        InvoiceDeailDAOImpl Iddao=new InvoiceDeailDAOImpl();
        Invoice In=new Invoice();

        InvoiceDAOImpl Idao=new InvoiceDAOImpl();
        try {
            Idao.addInvoice(new Invoice(loginedUser.getUserID()));
            In=Idao.getInvoice(loginedUser.getUserID());
            MyUtils.storeinvoice(session,In.getID());
            for(int i=0;i<Integer.parseInt(Length);i++)
            {
                Spc.delCart(loginedUser.getUserID(),ID[i]);
                Iddao.addInvoiceDetail(new InvoiceDetail(In.getID(),ID[i],Integer.parseInt(Quan[i])));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

    }

}