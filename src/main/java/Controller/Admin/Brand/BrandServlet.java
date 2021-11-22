package Controller.Admin.Brand;

import DAO.Implement.TypeOfWatchDAOImpl;
import Model.TypeOfWatch;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.Servlet;

import static java.lang.System.out;

public class BrandServlet extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    public BrandServlet () {
        // TODO Auto-generated constructor stub
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher=this.getServletContext().getRequestDispatcher("/brand.jsp");
        dispatcher.forward(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        String name =request.getParameter("Name");
        TypeOfWatch brand=new TypeOfWatch(1,name);
        String err=null;
        TypeOfWatchDAOImpl a=new TypeOfWatchDAOImpl();
        try {
            a.addTypeOfWatch(brand);
        } catch (SQLException e) {
            e.printStackTrace();
            err=e.getMessage();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
