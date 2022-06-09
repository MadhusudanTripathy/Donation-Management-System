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
<div class="container" id="container">
	<div class="form-container sign-up-container">
		<form action="register" method="post">
			<h1>Create Account</h1>
			<div class="social-container">
				<a href="#" class="social"><i class="fa fa-facebook"></i></a>
				<a href="#" class="social"><i class="fa fa-google"></i></a>
				<a href="#" class="social"><i class="fa fa-linkedin"></i></a>
			</div>
			<span>or use your email for registration</span>
			<input name="name" type="text" required="required" placeholder="Name" />
			<input name="email" type="email" required="required" placeholder="Email" />
			<input name="password" type="password" required="required" placeholder="Password" />
			<button>Sign Up</button>
		</form>
	</div>
	<div class="form-container sign-in-container">
		<form action="Login" method="post">
			<h1>Sign in</h1>
			<div class="social-container">
				<a href="#" class="social"><i class="fa fa-facebook"></i></a>
				<a href="#" class="social"><i class="fa fa-google"></i></a>
				<a href="#" class="social"><i class="fa fa-linkedin"></i></a>
			</div>
			<span>or use your account</span>
			<input name="email" type="email" placeholder="Email" />
			<input name="password" type="password" placeholder="Password" />
			<a href="forgetPassword.jsp">Forgot your password?</a>
			<button>Sign In</button>
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
<script>
	let status=document.getElementById('status').value;
	console.log(status);
	if(status=="success")swal("Thanks For Registration", "You Have Successfully Registered", "success");
	if(status=="failed")swal("Authentication Failed", "Wrong Username Or Password", "error");
	if(status=="invalidEmail")swal("Invalid Email", "Please Enter Email", "error");
	if(status=="invalidPassword")swal("Invalid Password", "Please Enter Password", "error");
	if(status=="invalidUserName")swal("Invalid UserName", "Please Enter UserName", "error");
	if(status=="resetSuccess")swal("Password Changed", "Now You Can Log In", "success");
	if(status=="resetFailed")swal("Password Reset Failed", "Try Again", "error");

    </script>	
</script>
</body>
</html>