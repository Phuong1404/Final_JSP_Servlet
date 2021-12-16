package Controller.Admin.Accept;

import DAO.Implement.TransportDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class DelTranport extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DelTranport() {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ID=request.getParameter("ID");
        TransportDAOImpl tran=new TransportDAOImpl();
        try {
            tran.delTransport(ID);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}