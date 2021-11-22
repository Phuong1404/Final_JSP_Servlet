package Controller;

import DAO.Implement.AccountDAOImpl;
import DAO.Implement.UserDAOImpl;
import Model.Account;
import Model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

public class signupServlet extends HttpServlet
{
    private static final long serialVersionUID = 1L;
    private AccountDAOImpl Account=new AccountDAOImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public signupServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        RequestDispatcher dispatcher=this.getServletContext().getRequestDispatcher("/signup.jsp");
        dispatcher.forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String Name=request.getParameter("Name");
        String Birth=request.getParameter("DOB");
        String Address=request.getParameter("Address");
        String Email=request.getParameter("Email");
        String Phone=request.getParameter("Phone");
        String UserName=request.getParameter("UserName");
        String Password=request.getParameter("Password");
        UserDAOImpl a=new UserDAOImpl();
        User u=new User("1",Name, Date.valueOf(Birth),Address,Email,Phone);
        User u1=new User();
        AccountDAOImpl b=new AccountDAOImpl();
        try {
            a.addUser(u);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        //get user
        try {
            u1=a.getUserByPhone(Phone);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        //create Account
        Model.Account acc=new Account(u1.getID(),UserName,Password,"User");
        try {
            b.addAccount(acc);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        response.sendRedirect(request.getContextPath()+"/login");
    }
}
