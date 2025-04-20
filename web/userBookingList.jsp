<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Danh Sách Đặt Sân</title>
        <link rel="stylesheet" href="css/userBookingListStye.css">
    </head>
    <body>
        <jsp:include page="headeruser.jsp" />
        
        <div class="container">
            <h2>Danh Sách Đặt Sân</h2>
            <c:if test="${empty allBooking}"><h2 style="color: red;">Chưa Có Lịch Sử Đặt Sân</h2></c:if>
            <div class="booking-container">
                
                <c:forEach items="${allBooking}" var="booking">
                    <div class="booking-card">
                        <form action="user">
                            <input type="hidden" name="id" value="${booking.bookingid}" />
                            <p><strong>Họ và tên:</strong> ${booking.fullname}</p>
                            <p><strong>Field:</strong> ${booking.field}</p>
                            <p><strong>Địa điểm:</strong> ${booking.location}</p>
                            <p><strong>Giá:</strong> ${booking.price} VND</p>
                            <p><strong>Thời gian:</strong> ${booking.time}</p>
                            <p><strong>Ngày:</strong> ${booking.date}</p>
                            <p><strong>Trạng thái:</strong> <span class="status ${booking.status}">${booking.status}</span></p>
                            <c:if test="${booking.status=="Confirmed"}">
                            <button value="review" name="action" type="submit" class="btn btn-primary">Review</button>
                            </c:if>
                        </form>
                    </div>
                </c:forEach>
            </div>
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
