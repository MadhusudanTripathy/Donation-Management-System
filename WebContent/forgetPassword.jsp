<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://drive.google.com/uc?export=view&amp;id=1jT1s3zzQWqogrlTjElvVwge5Ugv1QEw0" rel="stylesheet">	
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
	
    <title>Document</title>
</head>
<body>
<input type="hidden" id="status" value="<%=request.getAttribute("status")%>">
<div class="container" id="container">
		<div class="form-container sign-up-container">
		<form action="forgotPassword" method="post">
			<h1>Reset Password</h1>		
			<span>Forgot Your Password Don't Worry We Have Your Back</span>
			<input name="email" type="email" placeholder="Enter Registered Email Address" />
			<button>Get OTP</button>
			<a href="login">Login</a>
		</form>
	</div>
	<div class="form-container sign-in-container">
		<form action="ValidateOtp" method="post">
			<h1>Verify OTP</h1>
			<span>Check Your Email</span>
			<input name="otp" type="text" placeholder="Enter OTP" />
			<button>Verify</button>
			<%
				if(request.getAttribute("message")=="wrong otp")
				out.print("Wrong OTP Entered");
			%>
		
		</form>
	</div>
	<div class="overlay-container">
		<div class="overlay">
			<div class="overlay-panel overlay-left">
				<h1>Welcome Back!</h1>
				<p>To keep connected with us please login with your personal info</p>
				<button class="ghost" id="signIn">Sign In</button>
			</div>
			<div class="overlay-panel overlay-right">
				<h1>Hello, Friend!</h1>
				<p>Enter your personal details and start journey with us</p>
				<button class="ghost" id="signUp">Sign Up</button>
			</div>
		</div>
	</div>
		
</div>


<script src="scripts/sign.js"></script>

</script>
</body>
</html>