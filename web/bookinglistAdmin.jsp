<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Danh Sách Đặt Sân</title>
    <link rel="stylesheet" href="css/bookinglistAdminStyle.css">
</head>
<body>
    <button type="button" onclick="window.location.href = 'admin'">Trang Chủ</button> 
    <h1 style="color: red">${msg}</h1>
    
    <c:if test="${empty allBooking}"><h2 style="color: red;">Chưa Có Lịch Sử Đặt Sân</h2></c:if>
        <div class="booking-container">
        <c:forEach items="${allBooking}" var="allBooking">
            <!-- Thêm class tùy theo trạng thái của đơn đặt sân -->
            <div class="booking-card 
                 ${allBooking.status == 'Pending' ? 'pending' : ''}
                 ${allBooking.status == 'Rejected' ? 'rejected' : ''}
                 ${allBooking.status == 'Confirmed' ? 'confirmed' : ''}">
                <form action="admin">
                    <input type="hidden" name="id" value="${allBooking.bookingid}" />
                    <input type="text" name="fullname" value="${allBooking.fullname}" />
                    <input type="text" name="field" value="${allBooking.field}" />
                    <input type="text" name="location" value="${allBooking.location}" />
                    <input type="text" name="price" value="${allBooking.price}" />
                    <input type="text" name="time" value="${allBooking.time}" />
                    <input type="text" name="date" value="${allBooking.date}" />
                    <input type="text" name="status" value="${allBooking.status}" />
                    <c:if test="${allBooking.status == 'Pending'}">
                        <input type="submit" name="action" value="Accept">
                        <input type="submit" name="action" value="Reject">
                    </c:if>
                </form>

            </div>
        </c:forEach>
    </div>

       
</body>

