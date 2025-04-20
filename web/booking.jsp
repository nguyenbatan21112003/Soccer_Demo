<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đặt Sân Bóng</title>
        <link rel="stylesheet" href="css/bookingStyle.css">
    </head>

    <body >
        <script>
            document.addEventListener('DOMContentLoaded', function () {
            const today = new Date().toISOString().split('T')[0];
            document.getElementById('date').setAttribute('min', today);
            });
        </script>

        <c:if test="${not empty sessionScope.usersession}">
            <jsp:include page="headeruser.jsp" />
        </c:if>
        <c:if test="${empty sessionScope.usersession}">
            <jsp:include page="header.jsp" />
        </c:if>

        <div class="booking-container">
            <h2>Đặt Sân Bóng</h2>
            <form action="user" class="booking-form">
                <label for="date">Chọn ngày:</label>
                <input type="date" id="date" name="time"  value="${param.time}" required />
                <input type="hidden" name="fieldID" value="${param.fieldID}" />
                <input type="hidden" name="userID" value="${sessionScope.usersession.userId}" />
                <input type="hidden" name="action" value="search" />
                <input type="submit" value="Tìm Khung Giờ Trống" />
            </form>
            <c:choose>
                <c:when test="${empty param.time}">
                    <h1 style="color: red;">Vui Lòng Chọn Ngày</h1>
                </c:when>
                <c:when test="${empty availableSlot}">
                    <h1 style="color: red;">ĐÃ HẾT SLOT TRỐNG TRONG NGÀY ${param.time}</h1>
                </c:when>
            </c:choose>


            <c:if test="${not empty availableSlot}">
                <div class="available-slots">
                    <c:forEach items="${availableSlot}" var="o">
                        <form action="user" method="get" class="slot-item">
                            <input type="hidden" name="time" value="${param.time}" />
                            <input type="hidden" name="fieldID" value="${param.fieldID}" />
                            <input type="hidden" name="userID" value="${sessionScope.usersession.userId}" />
                            <input type="hidden" name="action" value="book" />
                            <input type="hidden" name="slotID" value="${o.slotID}" />
                            <input type="submit" value="${o.time}" class="btn-primary">
                        </form>
                    </c:forEach>
                </div>
            </c:if>

        </div>



        <jsp:include page="footer.jsp" />   
    </body>

</html>
