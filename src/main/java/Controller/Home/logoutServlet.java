package Controller.Home;

import DAO.Implement.AccountDAOImpl;
import DAO.MyUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class logoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public logoutServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session=request.getSession();
        MyUtils.delLoginedUser(session);
        MyUtils.deleteUserCookie(response);
        MyUtils.storelink(session,"http://localhost:8082/JSP_servlet_war_exploded/");
        response.sendRedirect("http://localhost:8082/JSP_servlet_war_exploded/");
    }
}
