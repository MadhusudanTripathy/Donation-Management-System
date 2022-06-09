	package com.mst.registration;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class RegistrationSrvlet
 */
@WebServlet("/register")
public class RegistrationSrvlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		PrintWriter out= response.getWriter();
		RequestDispatcher dispatcher=null;
		String uname=request.getParameter("name");
		String upwd=request.getParameter("password");
		String uemail=request.getParameter("email");
		String url = "jdbc:mysql://localhost:3306/dms?autoReconnect=true&useSSL=false";
	    String dbusername = "root";   
	    String dbpassword = "123@qweASD";
	    Connection con=null;
	    if(uname==null||uname.equals(""))
		{
			request.setAttribute("status","invalidUserName");
	    	dispatcher=request.getRequestDispatcher("sign.jsp");
	    	dispatcher.forward(request, response);
		}
	    if(uemail==null||uemail.equals(""))
		{
			request.setAttribute("status","invalidEmail");
	    	dispatcher=request.getRequestDispatcher("sign.jsp");
	    	dispatcher.forward(request, response);
		}
		if(upwd==null||upwd.equals(""))
		{
			request.setAttribute("status","invalidPassword");
	    	dispatcher=request.getRequestDispatcher("sign.jsp");
	    	dispatcher.forward(request, response);
		}
	    try{
	    	Class.forName("com.mysql.cj.jdbc.Driver");
		    con = DriverManager.getConnection(url,dbusername, dbpassword);
		    PreparedStatement pst=con.prepareStatement("INSERT INTO USERS(uname,upwd,uemail) VALUES(?,?,?)");
		    pst.setString(1, uname);
		    pst.setString(2, upwd);
		    pst.setString(3, uemail);
		    int rowAffected=pst.executeUpdate();		    
		    dispatcher=request.getRequestDispatcher("sign.jsp");
		    if(rowAffected>0)
		    {
		    	request.setAttribute("status","success");
		    }else{
		    	request.setAttribute("status","failed");
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
