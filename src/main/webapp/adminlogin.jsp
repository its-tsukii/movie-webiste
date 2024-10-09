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
                        <img src="images/adminlogin.png" alt="sign up image">
                    </figure>
                    <a href="login.jsp" class="signup-image-link">Not An Admin !</a>
                </div>
                <div class="signin-form">
                    <h2 class="form-title">ADMIN LOGIN !</h2>
                    <form id="login-form" action="AdminLoginServlet" method="post">
                        <div class="form-group">
                            
                        
                        <table>
                        <tr><td>Name:</td><td><input type="text" name="txtAdminName" id="txtAdminName"></td></tr>
                        <tr><td>Password:</td><td><input type="password" name="txtAdminPwd" id="txtAdminPwd"></td></tr>
                        </table>
                        
                        <div class="form-group">
                            <input type="submit" value="Login">
                            <input type="reset">
                        </div>
                    </form>
                    <div class="additional-links">
                        <a href="adminresetpassword.jsp">Reset Password !</a>
                        <a href="adminforgotpassword.jsp">Forgot Password ?</a>
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
              <button class="btn btn-primary"><a href="login.jsp">  USER Login !</a></button>
            </div>
             
      </div>
        </div>
    </section>
</div>

<!-- JavaScript for CAPTCHA -->


</body>
</html>
