package Controller.Admin.Brand;

import DAO.Implement.TypeOfWatchDAOImpl;
import Model.TypeOfWatch;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;


public class upbrand extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    public upbrand(){

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        TypeOfWatchDAOImpl a = new TypeOfWatchDAOImpl();
        TypeOfWatch i = new TypeOfWatch();
        String ID = (String) request.getParameter("ID");
        try {
            i = a.getTypeOfWatch(Integer.parseInt(ID));
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        PrintWriter out=response.getWriter();

        out.println("<div class=\"form-group\">\n" +
                "                            <label for=\"exampleInputEmail1\">Mã hãng</label>\n" +
                "                            <input type=\"text\" class=\"form-control\" id=\"TOWID\" value=\""+i.getID()+"\" disabled>"+
                "                        </div>\n" +
                "                        <div class=\"form-group\">\n" +
                "                            <label for=\"exampleInputEmail1\">Tên hãng</label>\n" +
                "                            <input type=\"text\" class=\"form-control\" id=\"TOWName1\" placeholder=\"Tên hãng đồng hồ\" value=\""+i.getName()+"\" onkeyup=\"Check1()\" >\n" +
                "                        </div>");


    }
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
            // TODO Auto-generated method stub
            String name =request.getParameter("Name");
            String ID=(String)request.getParameter("ID");
            TypeOfWatch brand=new TypeOfWatch(Integer.parseInt(ID),name);
            TypeOfWatchDAOImpl a=new TypeOfWatchDAOImpl();
            try {
                a.updateTyOfWatch(brand);
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
    }
}
