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
import java.util.List;

public class searchbrand extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    public searchbrand(){

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name =request.getParameter("Name");
        TypeOfWatchDAOImpl a = new TypeOfWatchDAOImpl();
        List<TypeOfWatch> list = null;
        String err = null;
        try {
            list = a.getListByName(name);
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
            out.println("<tr>\n" +
                    "                                        <td>"+i.getID()+"</td>\n" +
                    "                                        <td>"+i.getName()+"</td>\n" +
                    "                                        <td>\n" +
                    "                                            <a  class=\"text-danger mr-2\" onclick=\"Delete("+i.getID()+")\">\n" +
                    "                                                <i class=\"far fa-trash-alt\"></i>\n" +
                    "                                            </a>\n" +
                    "                                            <a class=\"text-danger mr-2\" onclick=\"Update("+i.getID()+")\">\n" +
                    "                                                <i class=\"fa fa-edit\" ></i>\n" +
                    "                                            </a>\n" +
                    "                                        </td>\n" +
                    "                                    </tr>");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
    }
}
