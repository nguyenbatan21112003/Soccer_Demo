<%-- 
    Document   : review.jsp
    Created on : Mar 26, 2025
    Author     : Admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đánh giá</title>
        <style>
            /* CSS cho phần đánh giá sao */
            .rating {
                direction: rtl;
                unicode-bidi: bidi-override;
                font-size: 2rem;
                display: inline-flex;
                gap: 5px;
                justify-content: center;
                margin-bottom: 20px;
            }
            .rating input {
                display: none;
            }
            .rating label {
                color: #ccc;
                cursor: pointer;
                font-size: 2.5rem;
                transition: color 0.2s ease-in-out;
            }
            .rating input:checked ~ label {
                color: #ffc107;
            }
            .rating label:hover,
            .rating label:hover ~ label {
                color: #ffecb3;
            }
            /* CSS cho input text và nút bấm */
            input[name="context"] {
                width: 100%;
                max-width: 400px;
                padding: 10px;
                font-size: 1rem;
                border: 1px solid #ccc;
                border-radius: 5px;
                margin-bottom: 10px;
            }
            input[type="submit"] {
                background-color: #007bff;
                color: white;
                padding: 10px 15px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 1rem;
            }
            input[type="submit"]:hover {
                background-color: #0056b3;
            }
        </style>
        <link rel="stylesheet" href="css/bookingdetailStyle.css">
    </head>
    <body>
         <c:if test="${not empty sessionScope.usersession}">
            <jsp:include page="headeruser.jsp" />
        </c:if>
        <c:if test="${empty sessionScope.usersession}">
            <jsp:include page="header.jsp" />
        </c:if>
        
        <div class="booking-detail-container">
            <p><strong>Thông báo:</strong> ${a}</p>
            <p><strong>Họ và tên:</strong> ${bookDetail.fullname}</p>
            <p><strong>Field:</strong> ${bookDetail.field}</p>
            <p><strong>Địa điểm:</strong> ${bookDetail.location}</p>
            <p><strong>Giá:</strong> ${bookDetail.price} VND</p>
            <p><strong>Thời gian:</strong> ${bookDetail.time}</p>
            <p><strong>Ngày:</strong> ${bookDetail.date}</p>
            <p><strong>Trạng thái:</strong> 
                <span class="booking-status ${bookDetail.status}">${bookDetail.status}</span>
            </p>
            
        <form>
            
            <div class="rating">
                <input type="radio" id="star5" name="rating" value="5">
                <label for="star5" title="5 stars">★</label>
                <input type="radio" id="star4" name="rating" value="4">
                <label for="star4" title="4 stars">★</label>
                <input type="radio" id="star3" name="rating" value="3">
                <label for="star3" title="3 stars">★</label>
                <input type="radio" id="star2" name="rating" value="2">
                <label for="star2" title="2 stars">★</label>
                <input type="radio" id="star1" name="rating" value="1">
                <label for="star1" title="1 star">★</label>
            </div>
            <input name="id" type="hidden" value="${param.id}">
            <input name="action" type="hidden" value="createreview" value="${param.rating}"> 
            <input name="context" type="text" placeholder="Nhập bình luận của bạn" value="${param.context}">
            <input type="submit" value="Gửi đánh giá">
        </form>
    </body>
</html>
