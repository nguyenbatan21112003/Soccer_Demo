<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Thông tin cá nhân</title>
        <link rel="stylesheet" href="css/profilestyle.css">
    </head>
    <body>
        <p>${msg}</p>
        <jsp:include page="headeruser.jsp" />
        <div class="personal-info-container">
            <div class="personal-info-header">
                <h1>Thông tin cá nhân</h1>

            </div>

            <ul class="personal-info-list">
                <li class="personal-info-item">
                    <span class="info-label">Tên Đăng Nhập</span>
                    <span class="info-value">${userDetail.userName}</span>

                </li>
                <li class="personal-info-item">
                    <span class="info-label">Mật Khẩu</span>
                    <span class="info-value" id="passwordField">********</span>
                    <a href="#" class="edit-mk1" onclick="togglePassword(event)">Hiển thị</a>
                    
                </li>
                <li class="personal-info-item">
                    <span class="info-label">Tên hiện thị</span>
                    <span class="info-value">${userDetail.fullName}</span>

                </li>

                <li class="personal-info-item">
                    <span class="info-label">Địa chỉ email</span>
                    <span class="info-value">
                        ${userDetail.email}
                    </span>


                </li>

                <li class="personal-info-item">
                    <span class="info-label">Địa Chỉ</span>
                    <span class="info-value">${userDetail.address}</span>


                </li>




            </ul>
        </div>
        <script>
            function togglePassword(event) {
                event.preventDefault(); // Ngăn chặn load lại trang
                var passwordField = document.getElementById("passwordField");
                var editLink = event.target;

// Kiểm tra trạng thái ẩn/hiện
                if (passwordField.innerText === "********") {
                    passwordField.innerText = "${userDetail.password}"; // Hiển thị mật khẩu thật
                    editLink.innerText = "Ẩn";
                } else {
                    passwordField.innerText = "********"; // Ẩn mật khẩu
                    editLink.innerText = "Hiển thị";
                }
            }
        </script>
        <jsp:include page="footer.jsp" />
    </body>
</html>