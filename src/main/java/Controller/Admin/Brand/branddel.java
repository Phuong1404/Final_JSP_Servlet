package Controller.Admin.Brand;

import DAO.Implement.TypeOfWatchDAOImpl;
import Model.TypeOfWatch;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class branddel  extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    public branddel(){

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        TypeOfWatchDAOImpl a = new TypeOfWatchDAOImpl();
        String ID=(String)request.getParameter("ID");
        try {
            a.delTypeOfWatch(Integer.parseInt(ID));
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
