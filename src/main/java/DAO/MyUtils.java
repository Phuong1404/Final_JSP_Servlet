package DAO;

import Model.Account;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;

public class MyUtils {
    public static final String ATT_NAME_CONNECTION="ATTRIBUTE_FOR_CONNECTION";
    public static final String ATT_NAME_USER_NAME="ATTRIBUTE_FOR_STORE_USER_NAME_IN_COOKIE";

    public static void storeLoginedUser(HttpSession session, Account loginedUser){
        session.setAttribute("loginedUser",loginedUser);
    }
    public static Account getLoginedUser(HttpSession session)
    {
        Account acc=(Account) session.getAttribute("loginedUser");
        return acc;
    }
    public static void delLoginedUser(HttpSession session)
    {
        session.removeAttribute("loginedUser");
    }
    public static void storelink(HttpSession session, String loginedUser){
        session.setAttribute("link",loginedUser);
    }
    public static String getlink(HttpSession session)
    {
        String acc=(String) session.getAttribute("link");
        return acc;
    }
    public static void dellink(HttpSession session)
    {
        session.removeAttribute("link");
    }
    public static void storeinvoice(HttpSession session, String loginedUser){
        session.setAttribute("invoice",loginedUser);
    }
    public static String getinvoice(HttpSession session)
    {
        String acc=(String) session.getAttribute("invoice");
        return acc;
    }
    public static void delinvoice(HttpSession session)
    {
        session.removeAttribute("invoice");
    }

    public static void storeUserCookie(HttpServletResponse response,Account account)
    {
        System.out.println("Store user cookie");
        Cookie cookieUserName=new Cookie(ATT_NAME_USER_NAME,account.getUserName());
        cookieUserName.setMaxAge(24*60*60);
        response.addCookie(cookieUserName);
    }
    public static String getUserCookie(HttpServletRequest request)
    {
        Cookie[] cookies=request.getCookies();
        if(cookies!=null){
            for (Cookie cookie:cookies)
            {
                if(ATT_NAME_USER_NAME.equals(cookie.getName())){
                    return cookie.getValue();
                }
            }
        }
        return null;
    }
    public static void deleteUserCookie(HttpServletResponse response)
    {
        Cookie cookieUserName=new Cookie(ATT_NAME_USER_NAME,null);
        cookieUserName.setMaxAge(0);
        response.addCookie(cookieUserName);
    }
}
