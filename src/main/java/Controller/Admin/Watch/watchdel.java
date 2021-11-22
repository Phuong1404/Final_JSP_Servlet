package Controller.Admin.Watch;



import DAO.Implement.WatchDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class watchdel  extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    public watchdel(){

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        WatchDAOImpl a = new WatchDAOImpl();
        String ID=(String)request.getParameter("ID");
        try {
            a.delWatch(ID);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

