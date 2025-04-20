<%-- 
    Document   : bookingdetail
    Created on : Mar 25, 2025, 1:12:51 PM
    Author     : bacda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chi Tiết Đặt Sân</title>
        <link rel="stylesheet" href="css/bookingdetailStyle.css">
    </head>
    <body>
        <jsp:include page="headeruser.jsp" />

        <div class="booking-detail-container">
            <p style="color: green"><strong>Thông báo:</strong> ${msg}</p>
            <p><strong>Họ và tên:</strong> ${bookDetail.fullname}</p>
            <p><strong>Field:</strong> ${bookDetail.field}</p>
            <p><strong>Địa điểm:</strong> ${bookDetail.location}</p>
            <p><strong>Giá:</strong> ${bookDetail.price} VND</p>
            <p><strong>Thời gian:</strong> ${bookDetail.time}</p>
            <p><strong>Ngày:</strong> ${bookDetail.date}</p>
            <p><strong>Trạng thái:</strong> 
                <span class="booking-status ${bookDetail.status}">${bookDetail.status}</span>
            </p>
            
        </div>

        <jsp:include page="footer.jsp" />   
        

    </body>
</html>

