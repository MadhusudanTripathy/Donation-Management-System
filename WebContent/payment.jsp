<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<!-- Created By CodingLab - www.codinglabweb.com -->
<html lang="en" dir="ltr">

<head>
    <meta charset="UTF-8">
    <!---<title> Responsive Registration Form | CodingLab </title>--->
    <link href="https://drive.google.com/uc?export=view&amp;id=1uMXNZZ51NmyU1GG8mU-sjIphSFR9JU06" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>
	<input type="hidden" id="status" value="<%=request.getAttribute("paymentStatus")%>">
    <div class="container">
        <div class="title">Payment</div>
        <div class="content">
            <form action="Payment" method="post">
                <input type="hidden" name="donee" value=<%=request.getParameter("donee")%> >
                <input type="hidden" name="donor" value=<%=session.getAttribute("name")%> >
                <input type="hidden" name="cUID" value=<%=session.getAttribute("currentUserId")%> >
                <div class="user-details">
                    <div class="input-box w-100">
                        <span class="details">Transaction Id</span>
                        <input type="text" placeholder="Enter Transaction ID" name="transactionId" required>
                    </div>
                    <div class="input-box w-100">
                        <span class="details">Donated Amount</span>
                        <input type="text" placeholder="Enter Donated Amount" name="amount" required>
                    </div>
                </div>
                <div class="button">
                    <input type="submit" value="Submit">
                </div>
            </form>
        </div>
    </div>
<script>
	let status=document.getElementById('status').value;
	console.log(status);
	if(status=="success")swal("Payment Successful", "Keep Up The Good Work", "success");
	if(status=="failed")swal("Payment Failed", "Something Went Wrong", "error");
    </script>	
</script>
</body>

</html>



