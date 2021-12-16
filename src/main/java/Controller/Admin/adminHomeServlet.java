package Controller.Admin;

import DAO.DBConnection;
import DAO.MyUtils;
import Model.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class adminHomeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public adminHomeServlet() {
        super();
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        Account loginedUser= MyUtils.getLoginedUser(session);
        if(loginedUser==null)
        {
            MyUtils.storelink(session,"http://localhost:8082/JSP_servlet_war_exploded/admin");
            response.sendRedirect(request.getContextPath()+"/login");
            return;
        }
        else{
            if(!loginedUser.getRole().equals("Admin"))
            {
                response.sendRedirect(request.getContextPath());
                return;
            }
        }

        Calendar cal = Calendar.getInstance();
        int thang=cal.get(Calendar.MONTH)+1;
        int ngay=cal.get(Calendar.DATE);
        Connection conn=null;
        try {
            conn=DBConnection.getConnection();
            String sql="SELECT DAY(TimeOrder) AS Day,SUM(TotalMoney) AS Total FROM dbo.Invoice WHERE "+thang+"=MONTH(TimeOrder) GROUP BY DAY(TimeOrder)";
            String sql1="SELECT Watch.ID,Name,SUM(Quantity) AS Quantity,SUM(dbo.Watch.Price*Quantity)AS Total FROM dbo.Invoice,dbo.Watch,dbo.InvoiceDetail WHERE Invoice.ID=Invoice_ID AND Watch_ID=Watch.ID AND DAY(TimeOrder)="+ngay+" GROUP BY dbo.Watch.ID,Name";
            String sql2="SELECT Users.ID,Name,SUM(Quantity) AS Quantity,SUM(TotalMoney) AS Total FROM dbo.InvoiceDetail,dbo.Invoice,dbo.Users WHERE Invoice.ID=Invoice_ID AND UserID=Users.ID AND DAY(TimeOrder)="+ngay+" GROUP BY Users.ID,Name";
            List<Chart>list = new ArrayList<Chart>();
            List<TopWatch>list1=new ArrayList<TopWatch>();
            List<TopUser>list2=new ArrayList<TopUser>();
            //Lấy dữ liệu cho biểu đồ
            try
            {
                PreparedStatement ps=conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                while (rs.next())
                {
                    int Day =rs.getInt(1);
                    int Total=rs.getInt(2);
                    list.add(new Chart(Day,Total));
                }
            }
            catch (SQLException e)
            {
                e.printStackTrace();
            }
            //Lấy dữ liệu cho sản phẩm
            try
            {
                PreparedStatement ps=conn.prepareStatement(sql1);
                ResultSet rs = ps.executeQuery();
                while (rs.next())
                {
                    String ID=rs.getString(1);
                    String Name=rs.getString(2);
                    int Quantity=rs.getInt(3);
                    int Total=rs.getInt(4);
                    list1.add(new TopWatch(ID,Name,Quantity,Total));
                }

            }
            catch (SQLException e)
            {
                e.printStackTrace();
            }
            //Lấy dữ liệu cho khách hàng
            try
            {
                PreparedStatement ps=conn.prepareStatement(sql2);
                ResultSet rs = ps.executeQuery();
                while (rs.next())
                {
                    String ID=rs.getString(1);
                    String Name=rs.getString(2);
                    int Quantity=rs.getInt(3);
                    int Total=rs.getInt(4);
                    list2.add(new TopUser(ID,Name,Quantity,Total));
                }
                conn.close();
            }
            catch (SQLException e)
            {
                e.printStackTrace();
            }
            request.setAttribute("chartlist",list);
            request.setAttribute("topwatch",list1);
            request.setAttribute("topuser",list2);
            request.getRequestDispatcher("adminhome.jsp").forward(request,response);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
