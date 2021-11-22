package Controller.Admin.Watch;

import DAO.Implement.WatchDAOImpl;
import Model.TypeOfWatch;
import Model.Watch;

import javax.servlet.http.HttpServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

public class watchload extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public watchload (){

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        WatchDAOImpl a=new WatchDAOImpl();
        List<Watch> list = null;
        try {
            list=a.getList();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        PrintWriter out=response.getWriter();
        for(Watch i:list)
        {
            out.println("<tr>\n" +
                    "                                        <td id=\"color\">"+i.getID()+"</td>\n" +
                    "                                        <td>"+i.getName()+"</td>\n" +
                    "                                        <td>"+i.getTypeOfWatch_ID()+"</td>\n" +
                    "                                        <td>"+i.getMachineType()+"</td>\n" +
                    "                                        <td>"+i.getWireType()+"</td>\n" +
                    "                                        <td>"+i.getPrice()+"</td>\n" +
                    "                                        <td>"+i.getQuantityInStock()+"</td>\n" +
                    "                                        <td>\n" +
                    "                                            <a  class=\"text-danger mr-2\" onclick=\"Delete('"+i.getID()+"')\">\n" +
                    "                                                <i class=\"far fa-trash-alt\"></i>\n" +
                    "                                            </a>\n" +
                    "                                            <a class=\"text-danger mr-2\" onclick=\"Update('"+i.getID()+"')\">\n" +
                    "                                                <i class=\"fa fa-edit\" ></i>\n" +
                    "                                            </a>\n" +
                    "                                        </td>\n" +
                    "                                    </tr>" );
        }
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub

    }
}
