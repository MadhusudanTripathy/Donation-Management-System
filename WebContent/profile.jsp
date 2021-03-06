<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel</title>
    <link rel="stylesheet" href="stylesheets/dashboard.css">
    <!-- Dashboard.css -->
    <link href="https://drive.google.com/uc?export=view&amp;id=1kBuGx1_ggALp7xxYhBO2DjflB2jgA4aa" rel="stylesheet">	
	<!-- Navbar.css -->
    <link href="https://drive.google.com/uc?export=view&amp;id=1s9_4GRwxWVdBH_5VobhPhy2Wwk8B9DZB" rel="stylesheet">	
	<!-- Table.css -->
    <link href="https://drive.google.com/uc?export=view&amp;id=1OsthepprJUq4qU-yNwwFatKENEFKfuGZ" rel="stylesheet">	
    <script src="https://kit.fontawesome.com/c8e4d183c2.js"></script> 
</head>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>

<%!
private String getBase64FromBlob(String id) throws IOException, SQLException{
	Blob blob=null;
	try
	{
	    Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
	    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dms","root","123@qweASD");     
	    Statement st=con.createStatement();
	    String strQuery = "SELECT photo FROM users where id='"+id+"';";
	    ResultSet rs = st.executeQuery(strQuery);
	      while(rs.next()){
	    	  blob = rs.getBlob(1);
	       } 
	    }
	catch (Exception e){
	    e.printStackTrace();
	  }
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
private int getPaymentsCount() throws IOException, SQLException{
	int counter=0;
	String Countrow="";
	try
	{
	    Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
	    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dms","root","123@qweASD");     
	    Statement st=con.createStatement();
	    String strQuery = "SELECT SUM(amount + 0) FROM payments";
	    ResultSet rs = st.executeQuery(strQuery);
	      while(rs.next()){
	    	  counter = rs.getInt(1);
	      		
	       } 
	    }
	catch (Exception e){
	    e.printStackTrace();
	  }
	return counter;
	
}
private int getFeedbacksCount(String id) throws IOException, SQLException{
	int counter=0;
	String Countrow="";
	try
	{
	    Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
	    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dms","root","123@qweASD");     
	    Statement st=con.createStatement();
	    String strQuery = "SELECT COUNT(*) FROM feedbacks where id='"+id+"';";
	    ResultSet rs = st.executeQuery(strQuery);

	      while(rs.next()){
	      Countrow = rs.getString(1);
	      
	       } 
	    }
	catch (Exception e){
	    e.printStackTrace();
	  }
	counter= Integer.parseInt(Countrow);
	return counter;
	
}
private int getUsersCount() throws IOException, SQLException{
	int counter=0;
	String Countrow="";
	try
	{
	    Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
	    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dms","root","123@qweASD");     
	    Statement st=con.createStatement();
	    String strQuery = "SELECT COUNT(*) FROM users";
	    ResultSet rs = st.executeQuery(strQuery);

	      while(rs.next()){
	      Countrow = rs.getString(1);
	      
	       } 
	    }
	catch (Exception e){
	    e.printStackTrace();
	  }
	counter= Integer.parseInt(Countrow);
	return counter;
	
}
private int getDoneesCount() throws IOException, SQLException{
	int counter=0;
	String Countrow="";
	try
	{
	    Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
	    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dms","root","123@qweASD");     
	    Statement st=con.createStatement();
	    String strQuery = "SELECT COUNT(*) FROM donees";
	    ResultSet rs = st.executeQuery(strQuery);

	      while(rs.next()){
	      Countrow = rs.getString(1);
	      
	       } 
	    }
	catch (Exception e){
	    e.printStackTrace();
	  }
	counter= Integer.parseInt(Countrow);
	return counter;
	
}
%>
<%
String driverName = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/dms";
String userId = "root";
String password = "123@qweASD";
String cUID= session.getAttribute("currentUserId").toString();

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<body>

    <section class="nav-section">
        
        <nav>
            <ul class="menu">
                <li class="brand">
                    <h2>
                        D-Donation???
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
    <section class="hero">
        

        <div class="left-sidebar">
        	<% System.out.print(session.getAttribute("currentUserId")); %>
            <img src="data:image/jpg;base64,<%=getBase64FromBlob(cUID) %>" alt="" srcset="">
             <div class="link-section">
                <div class="contact-info">
                    <p>
                    
                    <strong>
                    Name:
                    </strong>
                    <%= session.getAttribute("name") %>
                        
                    </p>
                    <p>
                    	<strong>
	                    Email:
	                    </strong>
                        <%= session.getAttribute("email") %>
                      
                    </p>
                    <p>
                    	<strong>
	                    Tel:
	                    </strong>
                        <%= session.getAttribute("phone") %>
                      
                    </p>
                    <p>
                    	<strong>
	                    DOB:
	                    </strong>
                        <%= session.getAttribute("dob") %>   
                    </p>
                </div>
            </div>
        </div>
        <div class="right-section">
            <h1>
                Welcome <%= session.getAttribute("name") %>
            </h1>
            <div class="info-cards">
                <div class="i-card">
                   
                    <h1>
                        <%= getUsersCount() %>
                    </h1>
                    <p>
                       <i class="fa fa-users pink">

                       </i> Users Count
                    </p>
                </div>
                <div class="i-card">
                   
                    <h1>
                        <%= getDoneesCount() %>
                    </h1>
                    <p>
                       <i class="fa fa-handshake blue">

                       </i> Active Beneficiary 
                    </p>
                </div>
                <div class="i-card">
                   
                    <h1>
                        <%= getFeedbacksCount(cUID) %>
                    </h1>
                    <p>
                       <i class="fa fa-envelope green">

                       </i>
                       Feedbacks Sent 
                    </p>
                </div>
                <div class="i-card">
                   
                    <h1>
                        <%= getPaymentsCount() %> 
                        <span>  
                            &dollar;
                        </span> 
                    </h1>
                    <p>
                       <i class="fa fa-dollar-sign red">

                       </i> Donation Exchanged
                    </p>
                </div>
                                
                
            </div>
            <h1>Your Contribution Towards A Kind World</h1>
            <div class="table-box">
                <div class="table-row table-head">
                    
                    <div class="table-cell">
                        <p>Beneficiary Name</p>
                    </div>
                    <div class="table-cell">
                        <p>Donor</p>
                    </div>
                    <div class="table-cell">
                        <p>Amount</p>
                    </div>
                </div>
 <%
try{ 
connection = DriverManager.getConnection(connectionUrl, userId, password);
statement=connection.createStatement();
String sql ="SELECT donee,donor,amount FROM payments where cUID='"+session.getAttribute("currentUserId")+"';";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
                <div class="table-row">
                    
                    <div class="table-cell">
                        <p><%=resultSet.getString("donee")%></p>
                    </div>
                    <div class="table-cell">
                        <p><%=resultSet.getString("donor")%></p>
                    </div>
        
                    <div class="table-cell">
                    	<p><%=resultSet.getString("amount")%></p>
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
        
 </section>
    

</body>
</html>
