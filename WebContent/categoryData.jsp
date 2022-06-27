<%@ page language="java" contentType="text/html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--cards.css  -->
    <link href="https://drive.google.com/uc?export=view&amp;id=122RUXTKo5jDeqZm3cU3VewJXS87vRAhh" rel="stylesheet">	
    <!--explorer.css  -->
    <link href="https://drive.google.com/uc?export=view&amp;id=1sF3eXsMWmTS7hVqqfOIefDrf70RfW7Ww" rel="stylesheet">	
    <!--table.css  -->
    <link href="https://drive.google.com/uc?export=view&amp;id=1OsthepprJUq4qU-yNwwFatKENEFKfuGZ" rel="stylesheet">	
    <!--navbar.css  -->    
    <link href="https://drive.google.com/uc?export=view&amp;id=1s9_4GRwxWVdBH_5VobhPhy2Wwk8B9DZB" rel="stylesheet">	
    <!--particles.css  -->
    <link href="https://drive.google.com/uc?export=view&amp;id=1rwURIRD0vxliQ_fcgM6P_Nsq3Yj-Jz8w" rel="stylesheet">	
    <!--servicesecioon.css  -->
    <link href="https://drive.google.com/uc?export=view&amp;id=1BjYBIkcM96lrAlFmjbRUb9Kv-TSmtN9i" rel="stylesheet">	
    <!-- footer.css -->
    <link href="https://drive.google.com/uc?export=view&amp;id=13rqCzHLv_BOgTO4whBOXNqJ9vb0PVRIy" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Explore</title>
    
    <%!
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
%>
</head>

<body>
    <section class="nav-section">
        
        <nav>
            <ul class="menu">
                <li class="brand">
                    <h2>
                        D-Donation✨
                    </h2>
                </li>
                <li class="item mid">
                    <i class="fa fa-home red"></i>
                    <a href="explore.jsp#id_explore">Explore Campaigns</a>
                </li>
                <li class="item mid">
                    <i class="fa fa-dashboard green" aria-hidden="true"></i>
                    <a href="donee.jsp">Raise Fund</a>
                </li>
                <li class="item mid yellow">
                    <i class="fa fa-info-circle" aria-hidden="true"></i>
                    <a href="feedback.jsp?sender=<%=session.getAttribute("name") %>">Send Feedback</a>
                </li>
                <li class="item mid ">
                    <i class="fa fa-microphone blue" aria-hidden="true"></i>
                    <a href="">About US</a>
                </li>
                <li class="item end navbar-dropdown">
                    <i class="fa fa-user pink" aria-hidden="true"></i>
                    <a href="profile.jsp"> <strong>
                            Madhusudan Tripathy
                        </strong> 
                    </a>
                    <ul class="dropdown-content" style="background-color:#ffffe9">
                        <li style="width:88%;">
                            <a href="Logout">Log out</a>
                        </li>
                    </ul>
                </li>
            </ul>
            
     </nav>
    </section>
    
    <div class="cards-section">
            <center>
                <h1 class="second second-heading">
                    <%= request.getParameter("value") %> Fundraisers
                </h1>
             
            </center>


<%
String driverName = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/dms";
String userId = "root";
String password = "123@qweASD";


try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

%>
<div class="cards-container">
<%
try{ 
Connection connection = DriverManager.getConnection(connectionUrl, userId, password);
Statement statement=connection.createStatement();
String sql ="SELECT * FROM donees where category='"+request.getParameter("value")+"'";
ResultSet resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

                <div class="cardx">
                    <div class="boxes">
                        <div class="contents">
                        <!-- 
                            <div class="card-imgx" >
                        -->
                            
                            <div class="card-imgx">                             	
                            	<img src="data:image/jpg;base64,<%=getBase64FromBlob(resultSet.getBlob("cause_photo"))%>" alt="">
                            	<!-- 
                            	 <img src="https://i.ibb.co/NW1KK5m/india-g60aed0bf0-1920.jpg" >
                            	 -->
                            </div>
                            <h3><%=resultSet.getString("category") %></h3>
                            <p>
                                <%=resultSet.getString("subject") %>
                            </p>
                            <a href="show.jsp?id=<%=resultSet.getString("id") %>">KnowMore</a>
                        </div>
                    </div>
                </div>
                                
<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
                
            
          </div>
      </div>
      
      <%@ include file="footer.jsp"  %>
</body>

</html>