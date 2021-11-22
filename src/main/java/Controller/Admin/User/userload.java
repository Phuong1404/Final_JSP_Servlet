package Controller.Admin.User;

import DAO.Implement.UserDAOImpl;
import Model.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

public class userload extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    public userload (){

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDAOImpl a=new UserDAOImpl();
        List<User> list = null;
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
        for(User i:list)
        {
            out.println("<tr>\n" +
                    "                                        <td>"+i.getID()+"</td>\n" +
                    "                                        <td>"+i.getName()+"</td>\n" +
                    "                                        <td>"+i.getDateOfBirth()+"</td>\n" +
                    "                                        <td>"+i.getAddress()+"</td>\n" +
                    "                                        <td>"+i.getEmail()+"</td>\n" +
                    "                                        <td>"+i.getPhoneNumber()+"</td>\n" +
                    "                                        <td>\n" +
                    "                                            <a  class=\"text-danger mr-2\" onclick=\"Delete('"+i.getID()+"')\">\n" +
                    "                                                <i class=\"far fa-trash-alt\"></i>\n" +
                    "                                            </a>\n" +
                    "                                        </td>\n" +
                    "                                    </tr>");
        }
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
    }
    }
