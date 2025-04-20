<%-- 
    Document   : header
    Created on : Mar 13, 2025, 10:26:36 PM
    Author     : bacda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/styleindex.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    </head>
    <body>
        <header>
            <div class="container">
                <div class="logo">
                    <a href="home?action=list">
                        <img style="width: 150px; height: 95px"src="images/logo-removebg-preview.png" alt="PlaySoccerNow Logo">
                        
                    </a>
                </div>
                <nav>
                    <ul>
                        <li><a href="home?action=list">Home</a></li>
                        <li><a href="aboutus.jsp">About Us</a></li>
                        <li><a href="home?action=list">Contact</a></li>
                    </ul>
                </nav>
                <div class="user-actions">

                            <a href="login.jsp" class="btn btn-outline">Login</a>
                   

                </div>
            </div>
        </header>
    </body>
</html>
