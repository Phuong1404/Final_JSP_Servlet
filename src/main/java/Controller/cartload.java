package Controller;

import DAO.Implement.ShoppingCartDAOImpl;
import DAO.Implement.WatchDAOImpl;
import DAO.MyUtils;
import Model.Account;
import Model.ItemInCart;
import Model.ShoppingCart;
import Model.Watch;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class cartload extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public cartload() {

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        Account loginedUser= MyUtils.getLoginedUser(session);
        List<ShoppingCart> cart = new ArrayList<ShoppingCart>();
        List<Watch> watch=new ArrayList<Watch>();
        ShoppingCartDAOImpl sc=new ShoppingCartDAOImpl();
        WatchDAOImpl w=new WatchDAOImpl();
        List<ItemInCart>list=new ArrayList<ItemInCart>();
        try {
            cart=sc.getList(loginedUser.getUserID());
            for (ShoppingCart i :cart)
            {
                watch.add(w.getOneWatch(i.getWatch_ID()));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        for(int i=0;i<cart.size();i++)
        {
            list.add(new ItemInCart(cart.get(i).getWatch_ID(),watch.get(i).getName(),watch.get(i).getPrice(),cart.get(i).getQuantity(),watch.get(i).getQuantityInStock()));
        }
        Gson gson=new Gson();
        String json=gson.toJson(list);
        response.setContentType("text/html;charset=UTF-8");
        response.setContentType("application/json");
        request.setCharacterEncoding("utf-8");
        PrintWriter out=response.getWriter();
        out.println(json);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ID =request.getParameter("ID");
        HttpSession session=request.getSession();
        Account loginedUser= MyUtils.getLoginedUser(session);
        ShoppingCartDAOImpl sp=new ShoppingCartDAOImpl();
        try {
            sp.delCart(loginedUser.getUserID(),ID);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
