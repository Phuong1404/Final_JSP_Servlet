package Controller.Product;

import DAO.Implement.WatchDAOImpl;
import Model.Watch;
import com.google.gson.Gson;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

public class loadproductlist extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     */
    public loadproductlist() {
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        WatchDAOImpl w=new WatchDAOImpl();
        String ID=request.getParameter("id");
        List<Watch> list = null;
        try {
            if(ID==null) {
                list = w.getList();
            }else if(ID.equals("1")){
                list = w.getList1();
            }
            else if(ID.equals("2")){
                list = w.getList2();
            }
            else if(ID.equals("3")){
                list = w.getList3();
            }
            else if(ID.equals("4")){
                list = w.getList4();
            }

            else if(ID.equals("5")){
                list = w.getList5();
            }
            else if(ID.equals("6")){
                list = w.getList6();
            }
            else if(ID.equals("7")){
                list = w.getList7();
            }
            else if(ID.equals("8")){
                list = w.getList8();
            }
            else if(ID.equals("9")){
                list = w.getList9();
            }
            else if(ID.equals("10")){
                list = w.getList10();
            }
            else if(ID.equals("11")){
                list = w.getList11();
            }
            else if(ID.equals("12")){
                list = w.getList12();
            }
            else if(ID.equals("13")){
                list = w.getList13();
            }
            else if(ID.equals("14")){
                list = w.getList14();
            }
            else{
                list=w.getList15(ID);
            }
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