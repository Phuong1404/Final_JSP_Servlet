package Controller;

import DAO.Implement.ShoppingCartDAOImpl;
import DAO.MyUtils;
import Model.Account;
import Model.ShoppingCart;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

public class EditCart extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public EditCart() {

    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String ID =request.getParameter("ID");
        String Quan =request.getParameter("Quantity");
        HttpSession session=request.getSession();
        Account loginedUser= MyUtils.getLoginedUser(session);
        ShoppingCartDAOImpl sp=new ShoppingCartDAOImpl();
        try {
            sp.updateCart(new ShoppingCart(loginedUser.getUserID(),ID,Integer.parseInt(Quan)));
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

    }
}
