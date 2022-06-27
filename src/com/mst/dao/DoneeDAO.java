package com.mst.dao;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import com.mst.model.Donee;


public class DoneeDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/dms?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "123@qweASD";
    private static final String INSERT_DONEE_SQL = "INSERT INTO donees" + "  (donee_name, category, subject, target_amount, cause_photo, medical_proof_photo, qrcode_photo) VALUES " +
        " (?, ?, ?, ?, ?, ?, ?);";
    private static final String SELECT_DONEE_BY_ID = "select * from donees where id =?";
    private static final String SELECT_ALL_DONEES = "select * from donees";
    private static final String DELETE_DONEES_SQL = "delete from donees where id = ?;";
    private static final String UPDATE_DONEES_SQL = "update donees set donee_name=?, category=?, subject=?, target_amount=?, cause_photo=?, medical_proof_photo=?, qrcode_photo=? where id = ?;";
    
    public DoneeDAO(){}
    
    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }
    
    public void insertUser(Donee donee) throws SQLException {
        System.out.println(INSERT_DONEE_SQL);
        // try-with-resource statement will auto close the connection.
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_DONEE_SQL)) {
            preparedStatement.setString(1, donee.getDoneeName());
            preparedStatement.setString(2, donee.getCategoryValue());
            preparedStatement.setString(3, donee.getSubjectValue());
            preparedStatement.setString(4, donee.getTargetAmount());
            if(donee.getCausePhoto() != null){
            	preparedStatement.setBlob(5, donee.getCausePhoto()); 	
            }
            if(donee.getMedicalProofPhoto() != null){
            	preparedStatement.setBlob(6, donee.getMedicalProofPhoto()); 	
            }
            if(donee.getMedicalProofPhoto() != null){
            	preparedStatement.setBlob(7, donee.getQRCodePhoto()); 	
            }
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }
    private String getBase64FromBlob(Blob blob) throws IOException, SQLException{
    	InputStream inputStream = blob.getBinaryStream();
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[4096];
        int bytesRead = -1;
         
        while ((bytesRead = inputStream.read(buffer)) != -1) {
            outputStream.write(buffer, 0, bytesRead);
        }
         
        byte[] imageBytes = outputStream.toByteArray();
        String output=Base64.getEncoder().encodeToString(imageBytes);
        inputStream.close();
        outputStream.close();
		return output;
    }
    public Donee selectDonee(int id) throws IOException {
    	Donee donee = null;
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();
            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_DONEE_BY_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                String donee_name = rs.getString("donee_name");
                String category = rs.getString("category");
                String subject = rs.getString("subject");
                String target_amount = rs.getString("target_amount");
                Blob cause_photo_blob = rs.getBlob("cause_photo");
                Blob medical_proof_photo_blob = rs.getBlob("medical_proof_photo");
                Blob qrcode_photo_blob = rs.getBlob("qrcode_photo");
                String base64_cause_photo = getBase64FromBlob(cause_photo_blob);
                String base64_medical_proof_photo = getBase64FromBlob(medical_proof_photo_blob);
                String base64_qrcode_photo = getBase64FromBlob(qrcode_photo_blob);
             
                donee = new Donee(id, donee_name, category, subject, target_amount,base64_cause_photo, base64_medical_proof_photo,base64_qrcode_photo);
                
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return donee;
    }
    
    public List < Donee > selectAllDonees() throws IOException {

        // using try-with-resources to avoid closing resources (boiler plate code)
        List < Donee > donees = new ArrayList < > ();
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_DONEES);) {
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();
            
            // Step 4: Process the ResultSet object.
            while (rs.next()) {
            	int id = rs.getInt("id");
                String donee_name = rs.getString("donee_name");
                String category = rs.getString("category");
                String subject = rs.getString("subject");
                String target_amount = rs.getString("target_amount");
                Blob cause_photo_blob = rs.getBlob("cause_photo");
                Blob medical_proof_photo_blob = rs.getBlob("medical_proof_photo");
                Blob qrcode_photo_blob = rs.getBlob("qrcode_photo");
                String base64_cause_photo = getBase64FromBlob(cause_photo_blob);
                String base64_medical_proof_photo = getBase64FromBlob(medical_proof_photo_blob);
                String base64_qrcode_photo = getBase64FromBlob(qrcode_photo_blob);
                 
                
                donees.add(new Donee(id, donee_name, category, subject, target_amount, base64_cause_photo, base64_medical_proof_photo, base64_qrcode_photo));
           
                
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return donees;
    }
    public boolean deleteDonee(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_DONEES_SQL);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
    public boolean updateDonee(Donee donee) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_DONEES_SQL);) {
        	preparedStatement.setString(1, donee.getDoneeName());
            preparedStatement.setString(2, donee.getCategoryValue());
            preparedStatement.setString(3, donee.getSubjectValue());
            preparedStatement.setString(4, donee.getTargetAmount());
            if(donee.getCausePhoto() != null){
            	preparedStatement.setBlob(5, donee.getCausePhoto()); 	
            }
            if(donee.getMedicalProofPhoto() != null){
            	preparedStatement.setBlob(6, donee.getMedicalProofPhoto()); 	
            }
            if(donee.getMedicalProofPhoto() != null){
            	preparedStatement.setBlob(7, donee.getQRCodePhoto()); 	
            }

            preparedStatement.setString(8, Integer.toString(donee.getId()));
            rowUpdated = preparedStatement.executeUpdate() > 0;
        }
        return rowUpdated;
    }
    
    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
    
    
}
