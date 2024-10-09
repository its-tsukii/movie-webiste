<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Forgot Password</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main CSS -->
<link rel="stylesheet" href="css/style.css">
</head>
<body>

	<div class="main">

		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Forgot Password ?</h2>
					
						<form action="ForgotServlet" method="post">
							<table>
							<tr><td>Name:</td><td><input type="text" name="txtName"></td></tr>
							<tr><td>What Is Your Pet Name:</td><td><input type="Password" name="txtPetName"></td></tr>						
							<tr><td>Enter Your New Password:</td><td><input type="Password" name="txtNewPwd"></td></tr>
							<tr><td><input type="submit" value="Submit"></td>
							</table>
						</form>
					</div>
					<div class="signup-image">
						<figure>
							<img src="images/forgotpass.png" alt="sing up image">
						</figure>
						<a href="login.jsp" class="signup-image-link">I Remember Now :)</a>
					</div>
				</div>
			</div>
		</section>


	</div>
	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
</body>
</html>