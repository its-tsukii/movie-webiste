<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign Up</title>

<!-- Font Icon -->
<link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
</head>
<body>

	<div class="main">

		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Sign up</h2>
					
						<form id="signup-form" action="RegisterServlet" method="post">
							<table>
							<tr><td>Name:</td><td><input type="text" name="txtName" required></td></tr>
							<tr><td>Email:</td><td><input type="email" name="txtEmail" id="txtEmail" required></td></tr>
							<tr><td>Password:</td><td><input type="password" name="txtPass" required></td></tr>
							<tr><td>Contact Info (+91):</td><td><input type="tel" name="txtContact" id="txtContact" required></td></tr>
							<tr><td><p id="emailError" style="color: red; display: none;">Please enter a valid email address.</p></td></tr>
							<tr><td><p id="contactError" style="color: red; display: none;">Please enter numbers only for contact info.</p></td></tr>
							<tr><td><p> This Is A Security Please Remember This And Your Given Name ! </p></td></tr>
							<tr><td>What Is Your Pet Name:</td><td><input type="text" name="txtPetName"></td></tr>
							<tr><td><input type="submit" value="Register"></td></tr>
							</table>
						</form>
						<div class="form-group">
							<input type="checkbox" name="agree-term" id="agree-term" class="agree-term" required />
							<label for="agree-term" class="label-agree-term">I agree all statements in <a href="#" class="term-service">Terms of service</a></label>
						</div>
					</div>
					<div class="signup-image">
						<figure>
							<img src="images/register.png" alt="sing up image">
						</figure>
						<a href="login.jsp" class="signup-image-link">I am already member</a>
					</div>
				</div>
			</div>
		</section>


	</div>
	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
    <script>
        document.getElementById('signup-form').addEventListener('submit', function(event) {
            var emailInput = document.getElementById('txtEmail').value;
            var contactInput = document.getElementById('txtContact').value;

            // Email validation
            if (!validateEmail(emailInput)) {
                document.getElementById('emailError').style.display = 'block';
                event.preventDefault();
            } else {
                document.getElementById('emailError').style.display = 'none';
            }

            // Contact info validation
            if (!validateContact(contactInput)) {
                document.getElementById('contactError').style.display = 'block';
                event.preventDefault();
            } else {
                document.getElementById('contactError').style.display = 'none';
            }
        });

        // Function to validate email format
        function validateEmail(email) {
            var re = /\S+@\S+\.\S+/;
            return re.test(email);
        }

        // Function to validate contact info format
        function validateContact(contact) {
            var re = /^[0-9]+$/;
            return re.test(contact);
        }
    </script>
</body>
</html>
