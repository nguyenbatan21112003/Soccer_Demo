<!DOCTYPE html>
<!-- Coding By CodingNepal - codingnepalweb.com -->
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Login & Registration Form</title>
        <!---Custom CSS File--->
        <link rel="stylesheet" href="css/loginstyle.css">
    </head>
    <body>
        <div class="container">
            <input type="checkbox" id="check">
            <div class="login form">
                <header>Login</header>
                <h3 style="color: red; margin-bottom: 20px">${error}</h3>
                <form action="./home" method="get">
                    <input type="text" name="username" placeholder="Enter your user name">
                    <input type="password" name="password" placeholder="Enter your password">
                    <!-- <a href="#">Forgot password?</a> -->
                    <input name="action" value="login" type="hidden">
                    <input type="submit" class="button" value="Login">
                </form>
                <div class="signup">
                    <span class="signup">Don't have an account?
                        <label for="check">Signup</label><br/>
                        
                        <a href="home?action=list">Back To Home</a>
                    </span>
                </div>
            </div>
            <div class="registration form">
                <header>Signup</header>
                <form action="./home" method="get">
                    <input type="text" name="user" placeholder="Enter your user name" required>
                    <input type="text" name="fullname" placeholder="Enter your full name" required>
                    <input type="text" name="email" placeholder="Enter your email" required>
                    <input type="text" name="address" placeholder="Enter your address" required>
                    <input type="password" name="pass" placeholder="Create a password" required>
                    <!--<input type="password" placeholder="Confirm your password">-->
                    <input name="action" value="signup" type="hidden">
                    <input type="submit" class="button" value="Signup">
                </form>
                <div class="signup">
                    <span class="signup">Already have an account?
                        <label for="check">Login</label>
                    </span>
                </div>
            </div>
        </div>
    </body>
</html>