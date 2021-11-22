package Controller;

import DAO.Implement.TransportDAOImpl;
import DAO.MyUtils;
import Model.Account;
import Model.Transport;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

public class checkOutServlet extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    public checkOutServlet() {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        Account loginedUser= MyUtils.getLoginedUser(session);
        String invoice=MyUtils.getinvoice(session);
        if(loginedUser==null)
        {
            MyUtils.storelink(session,"http://localhost:8082/JSP_servlet_war_exploded/checkout");
            response.sendRedirect(request.getContextPath()+"/login");
            return;
        }
        else if(invoice==null)
        {
            response.sendRedirect(request.getContextPath());
            return;
        }
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/Checkout.jsp");
        dispatcher.forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Name =request.getParameter("Name");
        String Email =request.getParameter("Email");
        String Phone =request.getParameter("Phone");
        String Address =request.getParameter("Address");
        String MethodShip =request.getParameter("MethodShip");
        String Total =request.getParameter("Total");
        TransportDAOImpl tran=new TransportDAOImpl();
        HttpSession session=request.getSession();
        String invoice=MyUtils.getinvoice(session);
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            if(MethodShip.equals("1"))
            {
                tran.addTransport(new Transport("1",invoice,Name,Email,Phone,Address,"Chờ xác nhận",false,Integer.parseInt(Total),"hỏa tốc"));
                out.println("Đặt hàng thành công");
            }
            else
            {
                tran.addTransport(new Transport("1",invoice,Name,Email,Phone,Address,"Chờ xác nhận",false,Integer.parseInt(Total),"tiết kiệm"));
                out.println("Đặt hàng thành công");
            }
            MyUtils.delinvoice(session);
        } catch (SQLException e) {
            out.println(e.getMessage());
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            out.println(e.getMessage());
            e.printStackTrace();
        }

    }
}
