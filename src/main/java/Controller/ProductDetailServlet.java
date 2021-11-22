package Controller;

import DAO.Implement.ShoppingCartDAOImpl;
import DAO.Implement.WatchDAOImpl;
import DAO.MyUtils;
import Model.Account;
import Model.ShoppingCart;
import Model.Watch;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

public class ProductDetailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     */
    public ProductDetailServlet() {
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ID =request.getParameter("id");
        List<Watch> list = null;
        Watch w=new Watch();
        WatchDAOImpl a=new WatchDAOImpl();
        HttpSession session=request.getSession();
        Account loginedUser= MyUtils.getLoginedUser(session);
        try {
            list=a.getWatch(ID);
            w=a.getOneWatch(ID);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        request.setAttribute("product",list);
        request.setAttribute("watch",w);
        request.setAttribute("user",loginedUser);
        RequestDispatcher dispatcher=this.getServletContext().getRequestDispatcher("/productdetail.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        Account loginedUser= MyUtils.getLoginedUser(session);
        String ID=request.getParameter("ID");
        String Quantity=request.getParameter("Quantity");
        ShoppingCart Cart =new ShoppingCart();
        ShoppingCartDAOImpl sp=new ShoppingCartDAOImpl();
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            Cart=sp.getCart(loginedUser.getUserID(),ID);
            if(Cart.getWatch_ID()==null)
            {
                sp.addCart(new ShoppingCart(loginedUser.getUserID(),ID,Integer.parseInt(Quantity)));
                out.println("Đã thêm sản phẩm vào giỏ hàng");
            }
            else {
                if ((Integer.parseInt(Quantity) + Cart.getQuantity()) > 10) {
                    out.println("Số lượng tối đa có thể mua với mỗi sản phẩm là 10");
                } else {
                    sp.updateCart(new ShoppingCart(loginedUser.getUserID(), ID, Integer.parseInt(Quantity) + Cart.getQuantity()));
                    out.println("Đã thêm sản phẩm vào giỏ hàng");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
