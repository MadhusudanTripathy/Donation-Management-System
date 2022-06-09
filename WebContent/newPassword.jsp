<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="stylesheets/sign.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
	
    <title>Document</title>
</head>
<body>
<input type="hidden" id="status" value="<%=request.getAttribute("status")%>">
<div class="container" id="container">s
	<div class="form-container sign-in-container">
		<form action="newPassword" method="post">
			<h1>Reset Password</h1>
			<div class="social-container">
				<a href="#" class="social"><i class="fa fa-facebook"></i></a>
				<a href="#" class="social"><i class="fa fa-google"></i></a>
				<a href="#" class="social"><i class="fa fa-linkedin"></i></a>
			</div>
			<span>or try login</span>
			<input name="password" type="password" placeholder="New Password" />
			<input name="confPassword" type="password" placeholder="Re-Enter Password" />
			<button>Sign In</button>	
		</form>
	</div>
	<div class="overlay-container">
		<div class="overlay">
			<div class="overlay-panel overlay-right">
				<h1>Hello, User!</h1>
				<p>Set Up Your New Password</p>
				
			</div>
		</div>
	</div>
</div>


<script src="scripts/sign.js"></script>
<script>
	let status=document.getElementById('status').value;
	console.log(status);
	if(status=="success")swal("Thanks For Registration", "You Have Successfully Registered", "success");
	if(status=="otp-verified")swal("Set New Password", "OTP Verified Successfully", "success");
	if(status=="failed")swal("Authentication Failed", "Wrong Username Or Password", "error");
	if(status=="invalidEmail")swal("Invalid Email", "Please Enter Email", "error");
	if(status=="invalidPassword")swal("Invalid Password", "Please Enter Password", "error");
	if(status=="invalidUserName")swal("Invalid UserName", "Please Enter UserName", "error");

    </script>	
</script>
</body>
</html>