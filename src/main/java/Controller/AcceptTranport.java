package Controller;

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

public class AcceptTranport extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AcceptTranport() {

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        Account loginedUser= MyUtils.getLoginedUser(session);
        if(loginedUser==null)
        {
            MyUtils.storelink(session,"http://localhost:8082/JSP_servlet_war_exploded/accept");
            response.sendRedirect(request.getContextPath()+"/login");
            return;
        }
        //trước mỗi sản phẩm sẽ có checkbox khi on thì thêm vào 1 biến data off thì xóa khỏi biến data
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/AcceptTranport.jsp");
        dispatcher.forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ID=request.getParameter("ID");
        TransportDAOImpl tran=new TransportDAOImpl();
        try {
            tran.updateTransport(ID);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
