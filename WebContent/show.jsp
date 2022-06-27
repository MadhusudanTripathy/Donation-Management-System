<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Show Beneficiary</title>
    <!-- show.css -->
    <link href="https://drive.google.com/uc?export=view&amp;id=18Dw0-Lzf3sDqxdNx26nltTaXavfQFJyu" rel="stylesheet">	
    <!--particles.css  -->
    <link href="https://drive.google.com/uc?export=view&amp;id=1rwURIRD0vxliQ_fcgM6P_Nsq3Yj-Jz8w" rel="stylesheet">	
    <!--navbar.css  -->    
    <link href="https://drive.google.com/uc?export=view&amp;id=1s9_4GRwxWVdBH_5VobhPhy2Wwk8B9DZB" rel="stylesheet">	
    <!--footer.css  -->    
    <link href="https://drive.google.com/uc?export=view&amp;id=13rqCzHLv_BOgTO4whBOXNqJ9vb0PVRIy" rel="stylesheet">	    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
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
<body>
    <main>
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
                    <ul class="dropdown-content">
                        <li>
                            <a href="Logout">Log out</a>
                        </li>
                    </ul>
                </li>
            </ul>
            
     </nav>
    </section>
        <div class="particle-container">

            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
        </div>
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

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
try{ 
connection = DriverManager.getConnection(connectionUrl, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM donees where id='"+request.getParameter("id")+"'";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
        <div class="row">
            
            <section class=second-landing>
                <!-- <canvas id="canvas1"></canvas> -->
                <div class="slider">
                    <div class="slides">
                        <!-- radio button start -->
                        <input type="radio" name="radio-btn" id="radio1">
                        <input type="radio" name="radio-btn" id="radio2">
                        <input type="radio" name="radio-btn" id="radio3">
        
                        <!-- slide image start  -->
                        <div class="slide first">
                            <img src="data:image/jpg;base64,<%=getBase64FromBlob(resultSet.getBlob("cause_photo"))%>" alt="">
                        	
                        </div>
                        <div class="slide">
                            <img src="data:image/jpg;base64,<%=getBase64FromBlob(resultSet.getBlob("medical_proof_photo"))%>" alt="">
                        </div>
                        <div class="slide">
                            <img src="data:image/jpg;base64,<%=getBase64FromBlob(resultSet.getBlob("qrcode_photo"))%>" alt="">
                        </div>
        
                        <!-- <div class="slide">
                                <img src="./images/3.jpg" alt="" srcset="">
                        </div> -->
        
                        <!-- slide image end  -->
        
                        <!-- Automatic Navigation start -->
                        <div class="navigation-auto">
                            <div class="auto-btn1">
        
                            </div>
                            <div class="auto-btn2">
        
                            </div>
                            <div class="auto-btn3">
        
                            </div>
                            <div class="auto-btn4">
        
                            </div>
                        </div>
                        <!-- Automatic Navigation end -->
                    </div>
                    <!-- manual navigation start -->
                    <div class="navigation-manual">
                        <label for="radio1" class="manual-btn"></label>
                        <label for="radio2" class="manual-btn"></label>
                        <label for="radio3" class="manual-btn"></label>
                        <!-- <label for="radio4" class="manual-btn"></label> -->
                    </div>
                    <!-- manual navigation end -->
                </div>
            </section>
            <div class="info-box">
                <h1>
                    <%=resultSet.getString("donee_name")%>
                </h1>
                <h2>
                    <%=resultSet.getString("category")%>
                </h2>
                <p><%=resultSet.getString("subject")%></p>
                
                <h2>
                Target Amount: <%=resultSet.getString("target_amount")%> $
                </h2>
                <a href="payment.jsp?donee=<%=resultSet.getString("donee_name")%>"> Donate Now</a>
            </div>
        </div>
        
              <% 
}

} catch (Exception e) {
e.printStackTrace();
}
%> 
    </main>
    <center>
	    <h1 style="margin-top:20px;">
	   			We make a living by what we get. We make a life by what we give
	    </h1>
    </center>
</body>

</html>