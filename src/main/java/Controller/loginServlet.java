package Controller;

import DAO.Implement.AccountDAOImpl;
import DAO.MyUtils;
import Model.Account;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AccountDAOImpl Account=new AccountDAOImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatcher=this.getServletContext().getRequestDispatcher("/login.jsp");
		dispatcher.forward(request, response);
	}

	private String getMd5(String input)
	{
		try {

			// Static getInstance method is called with hashing MD5
			MessageDigest md = MessageDigest.getInstance("MD5");

			// digest() method is called to calculate message digest
			//  of an input digest() return array of byte
			byte[] messageDigest = md.digest(input.getBytes());

			// Convert byte array into signum representation
			BigInteger no = new BigInteger(1, messageDigest);

			// Convert message digest into hex value
			String hashtext = no.toString(16);
			while (hashtext.length() < 32) {
				hashtext = "0" + hashtext;
			}
			return hashtext;
		}

		// For specifying wrong message digest algorithms
		catch (NoSuchAlgorithmException e) {
			throw new RuntimeException(e);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("Username");
		String password = request.getParameter("Password");

		String Pass=getMd5(password);

		String err = "";
		Model.Account acc=new Account();
		try {
			if (Account.login(username, Pass) == false)
			{
				err += "Tên đăng nhập hoặc mật khẩu không chính xác!";
			}
			else {
				acc=Account.getAccountByUserName(username);
				HttpSession session =request.getSession();
				MyUtils.storeLoginedUser(session,acc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		if (err.length() > 0) {
			request.setAttribute("err", err);
			RequestDispatcher dispatcher=this.getServletContext().getRequestDispatcher("/login.jsp");
			dispatcher.forward(request, response);
		}
		else {
			HttpSession session=request.getSession();
			String a= MyUtils.getlink(session);
			if(a==null)
			{
				response.sendRedirect("http://localhost:8082/JSP_servlet_war_exploded/");
			}
			else {
			MyUtils.dellink(session);
			response.sendRedirect(a);
		}
		}


	}

}
