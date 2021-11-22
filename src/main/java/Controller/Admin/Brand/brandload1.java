package Controller.Admin.Brand;

import DAO.Implement.TypeOfWatchDAOImpl;
import Model.TypeOfWatch;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.Servlet;
public class brandload1 extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    public brandload1(){

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        TypeOfWatchDAOImpl a = new TypeOfWatchDAOImpl();
        List<TypeOfWatch> list = null;
        String err = null;
        try {
            list = a.getList();
        } catch (SQLException e) {
            e.printStackTrace();
            err = e.getMessage();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        PrintWriter out=response.getWriter();
        for(TypeOfWatch i:list)
        {
            out.println("<option value=\""+i.getID()+"\">"+i.getName()+"</option>");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
    }
}
