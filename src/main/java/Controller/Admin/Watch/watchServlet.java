package Controller.Admin.Watch;

import DAO.Implement.PhotoOfWatchDAOImpl;
import DAO.Implement.WatchDAOImpl;
import DAO.MyUtils;
import Model.Account;
import Model.PhotoOfWatch;
import Model.Watch;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
        maxFileSize = 1024 * 1024 * 50, // 50 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class watchServlet extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    public watchServlet(){

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        Account loginedUser= MyUtils.getLoginedUser(session);
        if(loginedUser==null)
        {
            MyUtils.storelink(session,"http://localhost:8082/JSP_servlet_war_exploded/watch");
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
        RequestDispatcher dispatcher=this.getServletContext().getRequestDispatcher("/watch.jsp");
        dispatcher.forward(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        WatchDAOImpl t=new WatchDAOImpl();
        request.setCharacterEncoding("UTF-8");
        //L???y h??nh ???nh
        Part I1=request.getPart("I1");
        Part I2=request.getPart("I2");
        Part I3=request.getPart("I3");
        Part I4=request.getPart("I4");
        Part I5=request.getPart("I5");
        //L???y data ?????ng h???
        String name =request.getParameter("Name");
        String Machine =request.getParameter("Machine");
        String Wire =request.getParameter("Wire");
        String Brand =request.getParameter("Brand");
        String Piece =request.getParameter("Piece");
        String Sale =request.getParameter("Sale");
        String QuantityInStock =request.getParameter("QuantityInStock");
        //Th??m ?????ng h???
        Watch a=new Watch("1",name,Integer.parseInt(Brand),Machine,Wire,Integer.parseInt(Piece),Integer.parseInt(QuantityInStock),Integer.parseInt(Sale));
        try {
            t.addWatch(a);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        //L???y t??n c???a c??c file ???? nh???p
        String name1=I1.getSubmittedFileName();
        String name2=I2.getSubmittedFileName();
        String name3=I3.getSubmittedFileName();
        String name4=I4.getSubmittedFileName();
        String name5=I5.getSubmittedFileName();
        //???????ng d???n c???a th?? m???c ch???a ???nh
        String realPath=request.getServletContext().getRealPath("/Image");
        //Ghi ???nh v??o th?? m???c
        I1.write(realPath+"/"+name1);
        I2.write(realPath+"/"+name2);
        I3.write(realPath+"/"+name3);
        I4.write(realPath+"/"+name4);
        I5.write(realPath+"/"+name5);
        //L???y id c???a ?????ng h??? v???a nh???p
        PhotoOfWatchDAOImpl pt=new PhotoOfWatchDAOImpl();
        String W_ID="";
        try {
            W_ID=t.getOneWatchByName(name).getID();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        //Khai b??o th??ng tin v??? ???nh
        PhotoOfWatch pt1=new PhotoOfWatch(W_ID,name1);
        PhotoOfWatch pt2=new PhotoOfWatch(W_ID,name2);
        PhotoOfWatch pt3=new PhotoOfWatch(W_ID,name3);
        PhotoOfWatch pt4=new PhotoOfWatch(W_ID,name4);
        PhotoOfWatch pt5=new PhotoOfWatch(W_ID,name5);
        //????a ???nh v??o database
        try {
            pt.addPhotoOfWatch(pt1);
            pt.addPhotoOfWatch(pt2);
            pt.addPhotoOfWatch(pt3);
            pt.addPhotoOfWatch(pt4);
            pt.addPhotoOfWatch(pt5);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
