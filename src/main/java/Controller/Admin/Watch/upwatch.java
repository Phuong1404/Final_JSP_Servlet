package Controller.Admin.Watch;

import DAO.Implement.WatchDAOImpl;
import Model.Watch;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import javax.servlet.http.HttpServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;


public class upwatch extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    public upwatch(){

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        WatchDAOImpl a = new WatchDAOImpl();
        Watch i = new Watch();
        String ID = (String) request.getParameter("ID");
        try {
            i = a.getOneWatch1(ID);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        Gson gson=new Gson();
        String json=gson.toJson(i);
        response.setContentType("text/html;charset=UTF-8");
        response.setContentType("application/json");
        request.setCharacterEncoding("utf-8");
        PrintWriter out=response.getWriter();
        out.println(json);





    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub

        WatchDAOImpl t=new WatchDAOImpl();
        String id =request.getParameter("ID");
        String name =request.getParameter("Name");
        String Machine =request.getParameter("Machine");
        String Wire =request.getParameter("Wire");
        String Brand =request.getParameter("Brand");
        String Piece =request.getParameter("Piece");
        String QuantityInStock =request.getParameter("QuantityInStock");
        String Sale =request.getParameter("Sale");
        Watch watch=new Watch(id,name,Integer.parseInt(Brand),Machine,Wire,Integer.parseInt(Piece),Integer.parseInt(QuantityInStock),Integer.parseInt(Sale));
        try {
            t.updateWatch(watch);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
