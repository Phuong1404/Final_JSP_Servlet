package Controller.InfoAccount;

import DAO.Implement.UserDAOImpl;
import DAO.MyUtils;
import Model.Account;
import Model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

public class InfoUser extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    public InfoUser() {
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        Account loginedUser= MyUtils.getLoginedUser(session);
        if(loginedUser==null)
        {
            MyUtils.storelink(session,"http://localhost:8082/JSP_servlet_war_exploded/infoadmin");
            response.sendRedirect(request.getContextPath()+"/login");
            return;
        }
        else {
            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/infoadmin.jsp");
            dispatcher.forward(request, response);
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDAOImpl a=new UserDAOImpl();
        String ID=request.getParameter("ID");
        String Name=request.getParameter("Name");
        String Birth=request.getParameter("Birth");
        String Address=request.getParameter("Address");
        String Email=request.getParameter("Email");
        String Phone=request.getParameter("Phone");
        User u=new User(ID,Name, Date.valueOf(Birth),Address,Email,Phone);
        try {
            a.updateUser(u);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

    }
}
