<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Field Details - PlaySoccerNow</title>

        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
        <style>
            /*
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
            */
            /* 
                Created on : Mar 27, 2025, 8:44:42 PM
                Author     : bacda
            */
            /* Reset cơ bản */
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Arial', sans-serif;
            }

            body {
                background-color: #f8f9fa;
                color: #333;
            }

            /* ----- NAVBAR ----- */
            .navbar {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 15px 50px;
                background-color: white;
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            }

            .logo {
                display: flex;
                align-items: center;
                text-decoration: none;
            }

            .logo img {
                height: 50px;
            }

            .logo h1 {
                color: #4CAF50;
                font-size: 24px;
            }

            .nav-links {
                display: flex;
                gap: 30px;
            }

            .nav-links a {
                text-decoration: none;
                color: #333;
                font-weight: 500;
            }

            .auth-buttons {
                display: flex;
                gap: 15px;
            }

            /* ----- BUTTONS ----- */
            .btn {
                padding: 10px 20px;
                border-radius: 5px;
                font-weight: 500;
                cursor: pointer;
                text-decoration: none;
            }

            .btn-outline {
                border: 2px solid #4CAF50;
                color: #4CAF50;
                background: transparent;
            }

            .btn-primary {
                background-color: #4CAF50;
                color: white;
                border: none;
            }

            /* ----- CONTAINER ----- */
            .container {
                max-width: 1200px;
                margin: 30px auto;
                padding: 0 20px;
            }

            /* ----- FIELD DETAILS ----- */
            .field-details {
                background-color: white;
                border-radius: 10px;
                overflow: hidden;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            }

            .field-images {
                position: relative;
                height: 400px;
                overflow: hidden;
            }

            .main-image {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }

            .favorite-btn {
                position: absolute;
                top: 20px;
                right: 20px;
                background-color: rgba(255,255,255,0.8);
                width: 40px;
                height: 40px;
                border-radius: 50%;
                display: flex;
                justify-content: center;
                align-items: center;
                cursor: pointer;
                font-size: 20px;
                color: #FFD700;
            }

            /* ----- FIELD INFO ----- */
            .field-info {
                padding: 30px;
            }

            .field-header {
                display: flex;
                justify-content: space-between;
                align-items: flex-start;
                margin-bottom: 20px;
                padding-bottom: 10px;
                border-bottom: 2px solid #eee;
            }

            .field-title {
                display: flex;
                flex-direction: column;
            }

            .field-title h2 {
                font-size: 28px;
                margin-bottom: 5px;
                color: #333;
            }

            .field-location {
                display: flex;
                align-items: center;
                color: #4CAF50;
                font-size: 16px;
                font-weight: 500;
            }

            .field-location i {
                margin-right: 8px;
                font-size: 18px;
                color: #ff5733;
            }

            .field-price {
                font-size: 22px;
                font-weight: bold;
                color: #4CAF50;
                background: #e8f5e9;
                padding: 5px 12px;
                border-radius: 8px;
            }

            /* ----- FIELD DETAILS CONTAINER ----- */
            .field-details-container {
                display: grid;
                grid-template-columns: 1fr 1fr;
                gap: 30px;
                margin-bottom: 30px;
            }

            .detail-column h3 {
                margin-bottom: 15px;
                font-size: 20px;
                border-bottom: 2px solid #4CAF50;
                padding-bottom: 5px;
                display: inline-block;
            }

            .detail-item {
                margin-bottom: 15px;
            }

            .detail-item strong {
                display: block;
                margin-bottom: 5px;
                color: #333;
            }

            .detail-item p {
                color: #666;
                line-height: 1.6;
            }

            /* ----- AMENITIES ----- */
            .amenities-list {
                display: flex;
                flex-wrap: wrap;
                gap: 10px;
                margin-top: 10px;
            }

            .amenity-tag {
                background-color: #e8f5e9;
                color: #4CAF50;
                padding: 5px 12px;
                border-radius: 20px;
                font-size: 14px;
            }

            /* ----- BOOKING SECTION ----- */
            .booking-container {
                background-color: #f9f9f9;
                padding: 20px;
                border-radius: 10px;
                margin-top: 20px;
                text-align: center;
            }

            .book-now-btn {
                background-color: #4CAF50;
                color: white;
                border: none;
                padding: 12px 25px;
                border-radius: 5px;
                font-size: 16px;
                font-weight: 500;
                cursor: pointer;
                width: 100%;
            }

            /* ----- STATUS BADGES ----- */
            .status-badge {
                display: inline-block;
                padding: 5px 12px;
                border-radius: 20px;
                font-size: 14px;
                font-weight: 500;
                margin-bottom: 10px;
            }

            .status-available {
                background-color: #e8f5e9;
                color: #4CAF50;
            }

            .status-maintenance {
                background-color: #fff3e0;
                color: #ff9800;
            }

            .status-booked {
                background-color: #ffebee;
                color: #f44336;
            }

            /* ----- FOOTER ----- */
            footer {
                background-color: #333;
                color: white;
                padding: 30px 0;
                margin-top: 50px;
            }

            .footer-content {
                max-width: 1200px;
                margin: 0 auto;
                display: grid;
                grid-template-columns: repeat(3, 1fr);
                gap: 30px;
                padding: 0 20px;
            }

            .footer-section h3 {
                font-size: 18px;
                margin-bottom: 15px;
            }

            .footer-section p {
                margin-bottom: 10px;
                color: #ccc;
            }

            .footer-bottom {
                max-width: 1200px;
                margin: 20px auto 0;
                padding-top: 20px;
                border-top: 1px solid #444;
                text-align: center;
                color: #ccc;
                font-size: 14px;
            }
            /* ----- REVIEW SECTION ----- */
            .review-container {
                max-width: 1200px;
                margin: 30px auto;
                padding: 0 20px;
            }

            .review-title {
                text-align: center;
                font-size: 22px;
                font-weight: bold;
                border-bottom: 2px solid #4CAF50;
                padding-bottom: 10px;
                margin-bottom: 20px;
            }

            .review-card {
                background: #f8f9fa;
                padding: 15px;
                border-radius: 8px;
                margin-bottom: 15px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }

            .review-card p {
                margin: 5px 0;
                color: #333;
            }

            .review-card strong {
                color: #4CAF50;
            }

            .review-rating {
                color: #FFD700;
                font-size: 18px;
            }

            .review-time {
                font-size: 14px;
                color: #888;
            }

            /* Responsive */
            @media (max-width: 768px) {
                .review-container {
                    padding: 15px;
                }
            }


            /* ----- RESPONSIVE ----- */
            @media (max-width: 768px) {
                .navbar {
                    padding: 15px 20px;
                    flex-direction: column;
                    gap: 15px;
                }

                .field-details-container {
                    grid-template-columns: 1fr;
                }

                .footer-content {
                    grid-template-columns: 1fr;
                }
            }


        </style>
    </head>
    <body>
        <!-- Header -->

        <c:if test="${not empty sessionScope.usersession}">
            <jsp:include page="headeruser.jsp" />
        </c:if>
        <c:if test="${empty sessionScope.usersession}">
            <jsp:include page="header.jsp" />
        </c:if>


        <!-- Main Content -->
        <div class="container">
            <div class="field-details">
                <!-- Field Images -->
                <div class="field-images">
                    <img id="field-image" src="${detail.imageURL}" alt="Soccer Field" class="main-image">
                    <div class="favorite-btn">
                        <i class="fas fa-star"></i>
                    </div>
                </div>

                <!-- Field Information -->
                <div class="field-info">
                    <div class="field-header">
                        <div class="field-title">
                            <h2 id="field-name">${detail.fieldName}</h2>
                            <div class="field-location">
                                <i class="fas fa-map-marker-alt"></i>
                                <span id="field-location">${detail.location}</span>
                            </div>
                        </div>
                        <div class="field-price">
                            <span id="field-price">${detail.price}</span>/slot  
                        </div>
                    </div>


                    <div class="field-details-container">
                        <div class="detail-column">
                            <h3>Field Details</h3>
                            <div class="detail-item">
                                <strong>Description</strong>
                                <p id="field-description">${detail.description}</p>
                            </div>
                        </div>

                        <div class="detail-column">
                            <h3>Amenities</h3>
                            <div class="detail-item">
                                <div id="amenities-list" class="amenities-list">
                                    <!-- Amenities will be added dynamically -->
                                    <p id="field-description">${detail.amenities}</p>
                                </div>
                            </div>

                        </div>
                    </div>

                    <!-- Booking Section -->
                    <div class="booking-container">

                        <a href="user?action=bookingPage&userID=${sessionScope.usersession.userId}&fieldID=${detail.fieldID}" class="btn btn-outline">Book Now</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="container review-container">
            <h3 class="review-title">User Reviews</h3>
            <c:forEach items="${reviewlist}" var="review">
                <div class="review-card">
                    <p><strong>Họ và tên:</strong> ${review.fullname}</p>
                    <p class="review-rating"><strong>Rating:</strong> ${review.rating} ★</p>
                    <p><strong>Content:</strong> ${review.content}</p>
                    <p class="review-time"><strong>Time:</strong> ${review.timecmt}</p>
                </div>
            </c:forEach>            
        </div>

        <!-- Footer -->
        <jsp:include page="footer.jsp" />
    </body>
