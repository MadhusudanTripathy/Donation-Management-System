package com.mst.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String umail=request.getParameter("email");
		String upass=request.getParameter("password");
		String url = "jdbc:mysql://localhost:3306/dms?autoReconnect=true&useSSL=false";
	    String dbusername = "root";   
	    String dbpassword = "123@qweASD";
		HttpSession session=request.getSession();
		RequestDispatcher dispatcher=null;
		Connection con=null;
		if(umail==null||umail.equals(""))
		{
			request.setAttribute("status","invalidEmail");
	    	dispatcher=request.getRequestDispatcher("sign.jsp");
	    	dispatcher.forward(request, response);
		}
		if(upass==null||upass.equals(""))
		{
			request.setAttribute("status","invalidPassword");
	    	dispatcher=request.getRequestDispatcher("sign.jsp");
	    	dispatcher.forward(request, response);
		}
		try{
	    	Class.forName("com.mysql.cj.jdbc.Driver");
		    con = DriverManager.getConnection(url,dbusername, dbpassword);
		    PreparedStatement pst=con.prepareStatement("SELECT * FROM users WHERE uemail=? and upwd=?");
		    pst.setString(1,umail);
		    pst.setString(2, upass);
		    ResultSet rs=pst.executeQuery();
		    if(rs.next())
		    {
		    	session.setAttribute("name", rs.getString("uname"));
		    	session.setAttribute("display", "hide");
		    	
		    	dispatcher=request.getRequestDispatcher("index.jsp");		    
		    }else{
		    	request.setAttribute("status","failed");
		    	dispatcher=request.getRequestDispatcher("sign.jsp");
		    }
		    dispatcher.forward(request, response);
	    }catch(Exception e){
	    	e.printStackTrace();
	    }finally{
	    	try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    }
	    
		
	}

}
