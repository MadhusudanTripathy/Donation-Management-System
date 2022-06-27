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
 * Servlet implementation class Payment
 */
@WebServlet("/Payment")
public class Payment extends HttpServlet {
	private static final long serialVersionUID = 1L;
	RequestDispatcher dispatcher=null;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	RequestDispatcher dispatcher=null;
		String t_id=request.getParameter("transactionId");
		String amount=request.getParameter("amount");
		String donee=request.getParameter("donee");
		String donor=request.getParameter("donor");
		String cUID=request.getParameter("cUID");
		String url = "jdbc:mysql://localhost:3306/dms?autoReconnect=true&useSSL=false";
	    String dbusername = "root";   
	    String dbpassword = "123@qweASD";
	    Connection con=null;
	    if(t_id==null||t_id.equals(""))
		{
			request.setAttribute("status","invalidTransactionId");
	    	dispatcher=request.getRequestDispatcher("payment.jsp");
	    	dispatcher.forward(request, response);
		}
	    if(amount==null||amount.equals(""))
		{
			request.setAttribute("status","invalidAmount");
	    	dispatcher=request.getRequestDispatcher("payment.jsp");
	    	dispatcher.forward(request, response);
		}
	    if(donee==null||donee.equals(""))
		{
			request.setAttribute("status","invalidTransactionId");
	    	dispatcher=request.getRequestDispatcher("payment.jsp");
	    	dispatcher.forward(request, response);
		}
	    if(donor==null||donor.equals(""))
		{
			request.setAttribute("status","invalidTransactionId");
	    	dispatcher=request.getRequestDispatcher("payment.jsp");
	    	dispatcher.forward(request, response);
		}
	    if(cUID==null||cUID.equals(""))
		{
			request.setAttribute("status","invalidTransactionId");
	    	dispatcher=request.getRequestDispatcher("payment.jsp");
	    	dispatcher.forward(request, response);
		}
	    try{
	    	Class.forName("com.mysql.cj.jdbc.Driver");
		    con = DriverManager.getConnection(url,dbusername, dbpassword);
		    PreparedStatement pst=con.prepareStatement("INSERT INTO payments(donee,donor,transactionId,amount,cUID) VALUES(?,?,?,?,?)");
		    pst.setString(1, donee);
		    pst.setString(2, donor);
		    pst.setString(3, t_id);
		    pst.setString(4, amount);
		    pst.setString(5, cUID);
		    int rowAffected=pst.executeUpdate();		    
		    dispatcher=request.getRequestDispatcher("payment.jsp");
		    if(rowAffected>0)
		    {
		    	request.setAttribute("paymentStatus","success");
		    }else{
		    	request.setAttribute("paymentStatus","failed");
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


