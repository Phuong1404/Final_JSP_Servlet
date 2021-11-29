package Controller.Admin.Information;

import DAO.Implement.UserDAOImpl;
import DAO.MyUtils;
import Model.Account;
import Model.User;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

public class loadinforadmin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public loadinforadmin() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        Account loginedUser= MyUtils.getLoginedUser(session);
        UserDAOImpl u=new UserDAOImpl();
        User user=new User();
        String Role=loginedUser.getRole();
            try {
                user=u.getUser((String) loginedUser.getUserID());
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            Gson gson=new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
            String json=gson.toJson(user);
            response.setContentType("text/html;charset=UTF-8");
            response.setContentType("application/json");
            request.setCharacterEncoding("utf-8");
            PrintWriter out=response.getWriter();
            out.println(json);
    }
}
