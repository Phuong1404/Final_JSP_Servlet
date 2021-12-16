package Controller.Home;

import DAO.Implement.WatchDAOImpl;
import Model.TypeOfWatch;
import Model.Watch;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

public class loadhome extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     */
    public loadhome() {
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        WatchDAOImpl w=new WatchDAOImpl();
        List<Watch> list = null;
        try {
            list=w.getListPage(0);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        Gson gson=new Gson();
        String json=gson.toJson(list);
        response.setContentType("text/html;charset=UTF-8");
        response.setContentType("application/json");
        request.setCharacterEncoding("utf-8");
        PrintWriter out=response.getWriter();
        out.println(json);
    }
}
