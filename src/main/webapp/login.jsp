<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign Up</title>

<!-- Font Icon -->
<link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main CSS -->
<link rel="stylesheet" href="css/style.css">
<style>

body {
  background-image: url('sony.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
}

.loggedInUsername {
            position: fixed;
            bottom: 20px;
            right: 10px;
            background-color: rgba(255, 255, 255, 0.7);
            padding: 20px 20px;
            border-radius: 200px;
        }

.captcha {
    padding: 10px;
    border: 1px solid #ccc;
    margin-bottom: 10px;
    font-size: 20px;
    display: inline-block;
}
#captcha-input {
    width: 200px;
    padding: 10px;
    margin-bottom: 10px;
}
button {
    background-color: #4CAF50;
    color: white;
    padding: 10px 20px;
    border: none;
    cursor: pointer;
}
button:hover {
    background-color: #45a049;
}
</style>

</head>
<body>
<div class="main">
    <section class="sign-in">
        <div class="container">
            <div class="signin-content">
              <div class="signin-image">
                    <figure>
                        <img src="images/login.png" alt="sign up image">
                    </figure>
                    <a href="registration.jsp" class="signup-image-link">Create an account</a>
                </div>
                <div class="signin-form">
                    <h2 class="form-title">Sign in</h2>
                    <form id="login-form" action="LoginServlet" method="post">
                        <div class="form-group">
                            
                            <div id="captcha" class="captcha"></div>
                            <table>
                        	<tr><td>Captch Verification:</td><td><input type="text" name="captcha-input" id="captcha-input" placeholder="Enter the CAPTCHA" /></td></tr>
                        	</table>
                            
                            <button type="button" onclick="generateCaptcha()">Refresh CAPTCHA</button>
                        </div>
                        <table>
                        <tr><td>Name:</td><td><input type="text" name="txtName" id="txtName"></td></tr>
                        <tr><td>Password:</td><td><input type="password" name="txtPwd" id="txtPwd"></td></tr>
                        </table>
                        
                        <div class="form-group">
                            <input type="submit" value="Login">
                            <input type="reset">
                        </div>
                    </form>
                    <div class="additional-links">
                        <a href="resetpassword.jsp">Reset Password !</a>
                        <a href="forgotpassword.jsp">Forgot Password ?</a>
                    </div>
                    <div class="social-login">
                        <span class="social-label">Or login with</span>
                        <ul class="socials">
                            <li><a href="#"><i class="display-flex-center zmdi zmdi-facebook"></i></a></li>
                            <li><a href="#"><i class="display-flex-center zmdi zmdi-twitter"></i></a></li>
                            <li><a href="#"><i class="display-flex-center zmdi zmdi-google"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
            </div>

            
             <div class="loggedInUsername">
              <button class="button"><a href="adminlogin.jsp">  Admin Login !</a></button>
            </div>
             
      </div>
        </div>
    </section>
</div>

<!-- JavaScript for CAPTCHA -->
<script>
    function generateCaptcha() {
        const captchaContainer = document.getElementById('captcha');
        const captchaText = Math.random().toString(36).slice(2, 8).toUpperCase();
        captchaContainer.textContent = captchaText;
    }
    window.onload = generateCaptcha;

    document.getElementById('login-form').addEventListener('submit', function(event) {
        event.preventDefault();
        const enteredCaptcha = document.getElementById('captcha-input').value.toUpperCase();
        const captchaText = document.getElementById('captcha').textContent;
        if (enteredCaptcha === captchaText) {
            // Submit the form
            this.submit();
        } else {
            alert('CAPTCHA verification failed. Please try again.');
            generateCaptcha();
        }
    });
</script>

</body>
</html>
