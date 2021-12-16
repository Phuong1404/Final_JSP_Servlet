package Controller.Admin;

import DAO.Implement.AccountDAOImpl;
import DAO.Implement.UserDAOImpl;
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

public class changePasswordServlet extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    public changePasswordServlet() {
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        Account loginedUser= MyUtils.getLoginedUser(session);
        if(loginedUser==null)
        {
            MyUtils.storelink(session,"http://localhost:8082/JSP_servlet_war_exploded/changepass");
            response.sendRedirect(request.getContextPath()+"/login");
            return;
        }

        RequestDispatcher dispatcher=this.getServletContext().getRequestDispatcher("/changepass.jsp");
        dispatcher.forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        Account loginedUser= MyUtils.getLoginedUser(session);
        AccountDAOImpl a=new AccountDAOImpl();
        Account acc=new Account();
        String old=request.getParameter("old");
        String pass1=request.getParameter("pass1");
        String pass2=request.getParameter("pass2");
        try {
            acc=a.getAccount(loginedUser.getUserID());
            if(acc.getPassword().equals(old) &&pass1.equals(pass2) &&pass1.equals(old)==false)
            {
                acc=new Account((String) loginedUser.getUserID(),loginedUser.getUserName(),pass1,"Dev");
                a.updateAccount(acc);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

    }
}
