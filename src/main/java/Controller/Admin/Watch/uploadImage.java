package Controller.Admin.Watch;

import DAO.Implement.PhotoOfWatchDAOImpl;
import DAO.Implement.WatchDAOImpl;
import DAO.PhotoOfWatchDAO;
import Model.PhotoOfWatch;
import Model.Watch;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.sql.SQLException;

@MultipartConfig
public class uploadImage extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public static final String SAVE_DIRECTORY = "Webapp/Image";


    public uploadImage(){

    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Part I1=request.getPart("I1");
        Part I2=request.getPart("I2");
        Part I3=request.getPart("I3");
        Part I4=request.getPart("I4");
        Part I5=request.getPart("I5");
        String Name=request.getParameter("Name");
        String name1=I1.getSubmittedFileName();
        String name2=I2.getSubmittedFileName();
        String name3=I3.getSubmittedFileName();
        String name4=I4.getSubmittedFileName();
        String name5=I5.getSubmittedFileName();
        String realPath=request.getServletContext().getRealPath("/Image");

        I1.write(realPath+"/"+name1);
        I2.write(realPath+"/"+name2);
        I3.write(realPath+"/"+name3);
        I4.write(realPath+"/"+name4);
        I5.write(realPath+"/"+name5);
        WatchDAOImpl a=new WatchDAOImpl();
        PhotoOfWatchDAOImpl pt=new PhotoOfWatchDAOImpl();
        String W_ID="";
        try {
            W_ID=a.getOneWatchByName(Name).getID();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        PhotoOfWatch pt1=new PhotoOfWatch(W_ID,name1);
        PhotoOfWatch pt2=new PhotoOfWatch(W_ID,name2);
        PhotoOfWatch pt3=new PhotoOfWatch(W_ID,name3);
        PhotoOfWatch pt4=new PhotoOfWatch(W_ID,name4);
        PhotoOfWatch pt5=new PhotoOfWatch(W_ID,name5);
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
