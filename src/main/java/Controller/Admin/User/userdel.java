package Controller.Admin.User;

import DAO.Implement.AccountDAOImpl;
import DAO.Implement.UserDAOImpl;
import Model.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class userdel extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    public userdel(){

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        UserDAOImpl a = new UserDAOImpl();
        AccountDAOImpl b=new AccountDAOImpl();
        String ID=(String)request.getParameter("ID");
        try {
            b.delAccount(ID);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
            a.delUser(ID);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
