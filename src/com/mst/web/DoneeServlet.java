package com.mst.web;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.mst.dao.DoneeDAO;
import com.mst.model.Donee;

@WebServlet("/")
@MultipartConfig(maxFileSize = 16177215)
public class DoneeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private DoneeDAO doneeDAO;

    public void init() {
        doneeDAO = new DoneeDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        doGet(request, response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    	    throws ServletException, IOException {
    	        String action = request.getServletPath();

    	        try {
    	            switch (action) {
    	                case "/new":
    	                    showNewForm(request, response);
    	                    break;
    	                case "/insert":
    	                    insertDonee(request, response);
    	                    break;
    	                case "/delete":
    	                    deleteUser(request, response);
    	                    break;
    	                case "/edit":
    	                    showEditForm(request, response);
    	                    break;
    	                case "/update":
    	                    updateDonee(request, response);
    	                    break;
    	                default:
    	                    listDonee(request, response);
    	                    break;
    	            }
    	        } catch (SQLException ex) {
    	            throw new ServletException(ex);
    	        }
    	    }
    
    
    
    
    
    
    private void listDonee(HttpServletRequest request, HttpServletResponse response)
    	    throws SQLException, IOException, ServletException {
    	        List < Donee > listDonee = doneeDAO.selectAllDonees();
    	        request.setAttribute("listDonee", listDonee);
    	        RequestDispatcher dispatcher = request.getRequestDispatcher("admin_panel_donee.jsp");
    	        dispatcher.forward(request, response);
    	    }
    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
    	    throws ServletException, IOException {
    	        RequestDispatcher dispatcher = request.getRequestDispatcher("donee.jsp");
    	        dispatcher.forward(request, response);
    	    }
    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
    	    throws SQLException, ServletException, IOException {
    	        int id = Integer.parseInt(request.getParameter("id"));
    	        Donee existingDonee = doneeDAO.selectDonee(id);
    	        RequestDispatcher dispatcher = request.getRequestDispatcher("donee.jsp");
    	        request.setAttribute("donee", existingDonee);
    	        dispatcher.forward(request, response);

    	    }
    private void insertDonee(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException, ServletException {
        String donee_name = request.getParameter("doneeName");
        String category = request.getParameter("category");
        String subject = request.getParameter("subject");
        String target_amount = request.getParameter("targetAmount");
        InputStream inputStream_1= null;
        InputStream inputStream_2= null;
        InputStream inputStream_3= null;
        Part filePart_1 = request.getPart("causePhoto");
        Part filePart_2 = request.getPart("medicalProofPhoto");
        Part filePart_3 = request.getPart("qrcodePhoto");
        if(filePart_1 != null){
        	inputStream_1 = filePart_1.getInputStream();
        }
        if(filePart_2 != null){
        	inputStream_2 = filePart_2.getInputStream();
        }
        if(filePart_3 != null){
        	inputStream_3 = filePart_3.getInputStream();
        }
        Donee newDonee = new Donee(donee_name, category, subject, target_amount, inputStream_1, inputStream_2, inputStream_3);
        doneeDAO.insertUser(newDonee);
        response.sendRedirect("list");
        
    }
    private void updateDonee(HttpServletRequest request, HttpServletResponse response)
    	    throws SQLException, IOException, ServletException {
    			int id= Integer.parseInt(request.getParameter("id"));
		    	String donee_name = request.getParameter("doneeName");
		        String category = request.getParameter("category");
		        String subject = request.getParameter("subject");
		        String target_amount = request.getParameter("targetAmount");
    	        InputStream inputStream_1= null;
    	        InputStream inputStream_2= null;
    	        InputStream inputStream_3= null;
    	        Part filePart_1 = request.getPart("causePhoto");
    	        Part filePart_2 = request.getPart("medicalProofPhoto");
    	        Part filePart_3 = request.getPart("qrcodePhoto");
    	        if(filePart_1 != null){
    	        	inputStream_1 = filePart_1.getInputStream();
    	        }
    	        if(filePart_2 != null){
    	        	inputStream_2 = filePart_2.getInputStream();
    	        }
    	        if(filePart_3 != null){
    	        	inputStream_3 = filePart_3.getInputStream();
    	        }
    	        Donee updtaedDonee = new Donee(id,donee_name, category, subject, target_amount, inputStream_1, inputStream_2, inputStream_3);
    	        doneeDAO.updateDonee(updtaedDonee);
    	        response.sendRedirect("list");
    	        
    	    }
    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
    	    throws SQLException, IOException {
    	        int id = Integer.parseInt(request.getParameter("id"));
    	        doneeDAO.deleteDonee(id);
    	        response.sendRedirect("list");

    	    }

}
