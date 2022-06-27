package com.mst.util;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Feedback
 */
@WebServlet("/Feedback")
public class Feedback extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher dispatcher=null;
		String rating=request.getParameter("rate");
		String sender=request.getParameter("sender");
		String subject=request.getParameter("subject");
		String message=request.getParameter("message");
		String url = "jdbc:mysql://localhost:3306/dms?autoReconnect=true&useSSL=false";
	    String dbusername = "root";   
	    String dbpassword = "123@qweASD";
	    Connection con=null;
	    if(rating==null||rating.equals(""))
		{
			request.setAttribute("status","invalidTransactionId");
	    	dispatcher=request.getRequestDispatcher("feedback.jsp");
	    	dispatcher.forward(request, response);
		}
	    if(sender==null||sender.equals(""))
		{
			request.setAttribute("status","invalidTransactionId");
	    	dispatcher=request.getRequestDispatcher("feedback.jsp");
	    	dispatcher.forward(request, response);
		}
	    if(subject==null||subject.equals(""))
		{
			request.setAttribute("status","invalidTransactionId");
	    	dispatcher=request.getRequestDispatcher("feedback.jsp");
	    	dispatcher.forward(request, response);
		}
	    if(message==null||message.equals(""))
		{
			request.setAttribute("status","invalidAmount");
	    	dispatcher=request.getRequestDispatcher("feedback.jsp");
	    	dispatcher.forward(request, response);
		}
	    try{
	    	Class.forName("com.mysql.cj.jdbc.Driver");
		    con = DriverManager.getConnection(url,dbusername, dbpassword);
		    PreparedStatement pst=con.prepareStatement("INSERT INTO feedbacks(rating,sender,subject,message) VALUES(?,?,?,?)");
		    pst.setString(1, rating);
		    pst.setString(2, sender);
		    pst.setString(3, subject);
		    pst.setString(4, message);
		    int rowAffected=pst.executeUpdate();		    
		    dispatcher=request.getRequestDispatcher("feedback.jsp");
		    if(rowAffected>0)
		    {
		    	request.setAttribute("feedbackStatus","success");
		    }else{
		    	request.setAttribute("feedbackStatus","failed");
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
