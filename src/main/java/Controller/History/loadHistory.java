package Controller.History;

import DAO.Implement.TransportDAOImpl;
import DAO.MyUtils;
import Model.Account;
import Model.Transport;
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

public class loadHistory extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    public loadHistory() {

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        TransportDAOImpl tran =new TransportDAOImpl();
        HttpSession session=request.getSession();
        Account loginedUser= MyUtils.getLoginedUser(session);
        List<Transport> tr=new ArrayList<Transport>();
        try {
            tr=tran.getList(loginedUser.getUserID());
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        Gson gson=new Gson();
        String json=gson.toJson(tr);
        response.setContentType("text/html;charset=UTF-8");
        response.setContentType("application/json");
        request.setCharacterEncoding("utf-8");
        PrintWriter out=response.getWriter();
        out.println(json);
    }
}
