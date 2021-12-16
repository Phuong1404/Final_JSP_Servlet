package Controller.CheckOut;

import DAO.Implement.InvoiceDeailDAOImpl;
import DAO.Implement.WatchDAOImpl;
import DAO.MyUtils;
import Model.*;
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

public class loadcheckout extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    public loadcheckout() {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        InvoiceDeailDAOImpl Ind=new InvoiceDeailDAOImpl();
        List<InvoiceDetail>list=new ArrayList<InvoiceDetail>();
        HttpSession session=request.getSession();
        String invoice=MyUtils.getinvoice(session);
        List<Watch> watch=new ArrayList<Watch>();
        WatchDAOImpl w=new WatchDAOImpl();
        List<ItemInCart>list1=new ArrayList<ItemInCart>();
        try {
            list=Ind.getList(invoice);
            for (InvoiceDetail i :list)
            {
                watch.add(w.getOneWatch(i.getWatch_ID()));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        for(int i=0;i<list.size();i++)
        {
            list1.add(new ItemInCart(list.get(i).getWatch_ID(),watch.get(i).getName(),watch.get(i).getPrice(),list.get(i).getQuantity(),watch.get(i).getQuantityInStock(),watch.get(i).getSale()));
        }
        Gson gson=new Gson();
        String json=gson.toJson(list1);
        response.setContentType("text/html;charset=UTF-8");
        response.setContentType("application/json");
        request.setCharacterEncoding("utf-8");
        PrintWriter out=response.getWriter();
        out.println(json);
    }
}
