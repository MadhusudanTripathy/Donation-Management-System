<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!-- form_with_vh.css -->
<link href="https://drive.google.com/uc?export=view&amp;id=1uMXNZZ51NmyU1GG8mU-sjIphSFR9JU06" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<script src="https://kit.fontawesome.com/89f5a08ecd.js" crossorigin="anonymous"></script>
</head>
  <body>
  <input type="hidden" id="status" value="<%=request.getAttribute("feedbackStatus")%>">
    <div class="container">
        <div class="title">Send Feedback</div>
        <div class="content">
            <form action="Feedback" method="post">
            <input class="subject" type="hidden" name="sender" value="<%=request.getParameter("sender")%>">
                <div class="user-details">
                  <div class="input-box w-100">
                    <span class="details">Enter Subject</span>
                    <input type="text" placeholder="Enter Target Fund You Want To Generate"
                    name="subject"
                    required>
                  </div>
                    <div class="input-box w-100">
                        <span class="details">Write Message</span>
                        <textarea name="message"  
                        rows="5" 
                        placeholder="Write Your Valuable Feedback Here..."
                        ></textarea>
                      </div>
                      <div class="input-box star-holder w-100">
                        <input class="stars" type="radio" name="rate" id="rate-1" value="5">
                        <label for="rate-1" class="fas fa-star"></label>
                        <input class="stars" type="radio" name="rate" id="rate-2" value="4">
                        <label for="rate-2" class="fas fa-star"></label>
                        <input class="stars" type="radio" name="rate" id="rate-3" value="3">
                        <label for="rate-3" class="fas fa-star"></label>
                        <input class="stars" type="radio" name="rate" id="rate-4" value="2">
                        <label for="rate-4" class="fas fa-star"></label>
                      <input class="stars" type="radio" name="rate" id="rate-5" value="1">
                  <label for="rate-5" class="fas fa-star"></label>
                    </div>
                </div>
                <div class="photo-details">
                  <div class="button">
                    <input type="submit" value="Send">
                  </div>
                </div>
            </form>
          </div>
    </div>
    <script>
	let status=document.getElementById('status').value;
	console.log(status);
	if(status=="success")swal("Thanks For Your Feedback", "We will definaitely hear you", "success");
	if(status=="failed")swal("Not Sent", "Something Went Wrong", "error");
    </script>	
</script>
</body>

</html>