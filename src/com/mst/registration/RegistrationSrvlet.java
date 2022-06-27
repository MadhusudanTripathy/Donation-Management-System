package com.mst.registration;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

	
@WebServlet("/register")
@MultipartConfig(maxFileSize=16177215)
public class RegistrationSrvlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		PrintWriter out= response.getWriter();
		RequestDispatcher dispatcher=null;
		String uname=request.getParameter("name");
		String upwd=request.getParameter("password");
		String uemail=request.getParameter("email");
		String uphone=request.getParameter("uphone");
		String udob=request.getParameter("udob");
		InputStream inputStream= null;
		Part filePart = request.getPart("uimg");
		if(filePart != null){
        	inputStream = filePart.getInputStream();
        }
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
		if(uphone==null||uphone.equals(""))
		{
			request.setAttribute("status","invalidPassword");
	    	dispatcher=request.getRequestDispatcher("sign.jsp");
	    	dispatcher.forward(request, response);
		}
		if(udob==null||udob.equals(""))
		{
			request.setAttribute("status","invalidPassword");
	    	dispatcher=request.getRequestDispatcher("sign.jsp");
	    	dispatcher.forward(request, response);
		}
	    try{
	    	Class.forName("com.mysql.cj.jdbc.Driver");
		    con = DriverManager.getConnection(url,dbusername, dbpassword);
		    PreparedStatement pst=con.prepareStatement("INSERT INTO USERS(uname,upwd,uemail,uphone,udob,photo) VALUES(?,?,?,?,?,?)");
		    pst.setString(1, uname);
		    pst.setString(2, upwd);
		    pst.setString(3, uemail);
		    pst.setString(4, uphone);
		    pst.setString(5, udob);
		    pst.setBlob(6, inputStream);
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
	    	response.sendRedirect("sign.jsp");
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
