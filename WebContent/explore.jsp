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
                    <ul class="dropdown-content" style="background-color:#ffffe9;">
                        <li style="width:88%;">
                            <a href="Logout">Log out</a>
                        </li>
                    </ul>
                </li>
            </ul>
            
     </nav>
    </section>
    <section class="hero-bg">
        <div class="img-container">
            <img src="https://i.ibb.co/NW1KK5m/india-g60aed0bf0-1920.jpg" alt="">
            <div class="quote">
                <p>
                    Not All of Us Can Do Great Things But We Can Do Small Things With Great Love
                </p>
            </div>
        </div>
    </section>
    <section class="service-container">
	    <%String isAdmin= session.getAttribute("isAdmin").toString(); %>
		<c:if test="${isAdmin=='true'}">
			<center>				
			<h2>
				<a href="admin_panel_donee.jsp" style="padding:10px 12px;box-shadow:0 0 5px rgba(0,0,0,0.15);">
				Go To Admin Panel
				</a>	
			</h2>
			</center>
		</c:if>
        <h1 style="margin-top:40px;">Categories</h1>
        <div class="row">
            <div class="service r">
                <i class="fa fa-laptop red"></i>
                <h2>Blood </h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing.</p>
            </div>
            <div class="service g">
                <i class="fa fa-laptop green"></i>
                <h2>Accident </h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing.</p>
            </div>
            <div class="service b">
                <i class="fa fa-laptop blue"></i>
                <h2>Natural Disaster</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing.</p>
            </div>
            <div class="service p">
                <i class="fa fa-laptop pink"></i>
                <h2>Kidney </h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing.</p>
            </div>
            <div class="service y">
                <i class="fa fa-laptop yellow"></i>
                <h2>NGOs</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing.</p>
            </div>
            <div class="service v">
                <i class="fa fa-laptop violate"></i>
                <h2>Others</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing.</p>
            </div>

        </div>
    </section>
    <div class="table-box" style="margin-top:70px;">
        <div class="table-row table-head">
            <div class="table-cell">
                <p>Category Name</p>
            </div>
            <div class="table-cell">
                <p>Beneficiary Count</p>
            </div>
        </div>


<%
String driverName = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/dms";
String userId = "root";
String password = "123@qweASD";

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;

try{ 
connection = DriverManager.getConnection(connectionUrl, userId, password);
statement=connection.createStatement();
String sql ="SELECT category,COUNT(*) as quantity FROM donees GROUP BY category;";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
        <div class="table-row">

            <div class="table-cell">
                <a href="categoryData.jsp?value=<%=resultSet.getString("category")%>">
                    <p><%=resultSet.getString("category")%></p>
                </a>
            </div>
            <div class="table-cell">
                <p><%=resultSet.getString("quantity") %></p>
            </div>
        </div>
<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>        
     
 </div>

    <div id="id_explore" class="cards-section">
            <center>
                <h1 class="second second-heading">
                    Trending Fundraisers
                </h1>
                <p class="second second-para">
                    View the fundraisers that are most active right now
                </p>
            </center>

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
<%


try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

%>
<div class="cards-container">
<%
try{ 
connection = DriverManager.getConnection(connectionUrl, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM donees";

resultSet = statement.executeQuery(sql);
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