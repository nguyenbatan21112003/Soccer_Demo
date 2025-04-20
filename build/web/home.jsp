<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>PlaySoccerNow - Soccer Field Booking</title>
        <link rel="stylesheet" href="css/styleindex.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <style>
            .pagination {
                margin-top: 20px;
                text-align: center;
            }

            .pagination ul {
                list-style: none;
                padding: 0;
            }

            .pagination li {
                display: inline;
                margin: 0 5px;
            }

            .pagination a {
                text-decoration: none;
                padding: 5px 10px;
                background: green;
                color: white;
                border-radius: 5px;
            }

            .pagination a.active {
                background: #F17A26;
                font-weight: bold;
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

        <!-- Hero Section -->
        <section class="hero">
            <div class="container">
                <div class="hero-content">
                    <h1>Find and Book Soccer Fields</h1>
                    <p>The easiest way to find available soccer fields near you</p>
                    <div class="search-container">
                        <form action="./home" method="get">
                            <div class="search-box">
                                <input type="text" name="location" placeholder="Enter your location" value="${param.location}">
                                <input type=hidden name="action" value="list">
                                <!--<input type="date" name="date" value="${java.time.LocalDate.now()}" min="${java.time.LocalDate.now()}"> -->
                                <button type="submit" class="btn btn-primary">Search</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>

        <!-- Featured Fields Section -->
        <section class="featured-fields">
            <div class="container">
                <h2>Featured Fields</h2>

                <c:if test="${empty list}">
                    <p>No fields available at the moment.</p>
                </c:if>

                <div class="field-grid">
                    <c:forEach items="${list}" var="field">
                        <div class="field-card">
                            <div class="field-image">
                                <img src="${not empty field.imageURL ? field.imageURL : 'default-image.jpg'}" 
                                     alt="${field.fieldName}">
                            </div>
                            <div class="field-details">
                                <h3>${field.fieldName}</h3>
                                <p class="location">
                                    <i class="fas fa-map-marker-alt"></i> ${field.location}
                                </p>
                                <p class="field-info">
                                    <span><i class="fas fa-dollar-sign"></i> 
                                        <c:choose>
                                            <c:when test="${not empty field.price}">${field.price}/slot</c:when>
                                            <c:otherwise>Contact for price</c:otherwise>
                                        </c:choose>
                                    </span>
                                </p>
                                <a href="home?id=${field.fieldID}&action=details" class="btn btn-secondary">View Details</a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>
        <div class="pagination">
            <ul>
                <% int currentPage = (int) request.getAttribute("currentPage");
                    int totalPages = (int) request.getAttribute("totalPages");
                    String keyword = request.getParameter("location");

                    if (keyword == null) {
                        keyword = "";
                    }%>

                <% if (currentPage > 1) {%>
                <li><a href="home?action=list&page=<%= currentPage - 1%>&location=${param.location}">Previous</a></li>
                    <% } %>

                <% for (int i = 1; i <= totalPages; i++) {%>
                <li>
                    <a href="home?action=list&page=<%= i%>&location=${param.location}" 
                       class="<%= (i == currentPage) ? "active" : ""%>">
                        <%= i%>
                    </a>
                </li>
                <% } %>

                <% if (currentPage < totalPages) {%>
                <li><a href="home?action=list&page=<%= currentPage + 1%>&location=${param.location}">Next</a></li>
                    <% }%>
            </ul>
        </div>


        <!-- How It Works Section
        <section class="how-it-works">
            <div class="container">
                <h2>How It Works</h2>
                <div class="steps">
                    <div class="step">
                        <div class="step-icon">
                            <i class="fas fa-search"></i>
                        </div>
                        <h3>Search</h3>
                        <p>Find soccer fields near you based on location, size, and availability</p>
                    </div>
                    <div class="step">
                        <div class="step-icon">
                            <i class="fas fa-calendar-alt"></i>
                        </div>
                        <h3>Book</h3>
                        <p>Choose your preferred time slot and make a booking</p>
                    </div>
                    <div class="step">
                        <div class="step-icon">
                            <i class="fas fa-futbol"></i>
                        </div>
                        <h3>Play</h3>
                        <p>Enjoy your game at the booked field</p>
                    </div>
                    <div class="step">
                        <div class="step-icon">
                            <i class="fas fa-star"></i>
                        </div>
                        <h3>Review</h3>
                        <p>Share your experience by rating and reviewing the field</p>
                    </div>
                </div>
            </div>
        </section> -->

        <!-- Testimonials Section -->
        <section class="testimonials">
            <div class="container">
                <h2>What Our Users Say</h2>
                <div class="testimonial-slider">
                    <c:forEach items="${testimonials}" var="testimonial">
                        <div class="testimonial">
                            <div class="testimonial-content">
                                <p>"${testimonial.content}"</p>
                            </div>
                            <div class="testimonial-user">
                                <img src="${testimonial.userImage}" alt="${testimonial.userName}">
                                <div>
                                    <h4>${testimonial.userName}</h4>
                                    <p>${testimonial.userType}</p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>

        <!-- CTA Section -->


        <!-- Footer -->
        <jsp:include page="footer.jsp" />



        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>