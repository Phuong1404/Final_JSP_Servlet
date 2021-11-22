package Controller;

import DAO.MyUtils;
import Model.Account;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class History extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    public History() {

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        Account loginedUser= MyUtils.getLoginedUser(session);
        if(loginedUser==null)
        {
            MyUtils.storelink(session,"http://localhost:8082/JSP_servlet_war_exploded/history");
            response.sendRedirect(request.getContextPath()+"/login");
            return;
        }
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/history.jsp");
        dispatcher.forward(request, response);
    }
}
