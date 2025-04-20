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
                    <div class="user-menu">
                        <span>${sessionScope.usersession.fullName} <i class="fas fa-chevron-down"></i></span>
                        <div class="dropdown">
                            <a href="user?action=profile&userName=${sessionScope.usersession.userName}"><i class="fas fa-user"></i> My Profile</a>
                            <a href="user?action=userBookingList&id=${sessionScope.usersession.userId}"><i class="fas fa-calendar-check"></i> My Bookings</a>
                            <a href="home?action=logout" class="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
                        </div>
                    </div>
                </div>
            </div>
        </header>
    </body>
</html>
