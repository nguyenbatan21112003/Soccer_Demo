<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : aboutus
    Created on : Mar 26, 2025, 10:56:32 PM
    Author     : bacda
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/aboutusStyle.css">
    </head>
    <body>
        <a href="home?action=list" class="back-button">🏠 Quay về Trang Chủ</a>

        <div class="container">
            <h1>📝 Review Về Hành Trình Làm Project Của Nhóm</h1>

            <div class="section">
                <h2>1. Hành Trình Phát Triển Dự Án</h2>
                <p>Ban đầu, ý tưởng về hệ thống đặt sân bóng nghe có vẻ đơn giản, nhưng khi bắt tay vào làm, nhóm nhận ra có rất nhiều khía cạnh cần phải giải quyết:</p>
                <ul>
                    <li>⚽ Xây dựng giao diện dễ sử dụng nhưng vẫn đầy đủ tính năng.</li>
                    <li>📅 Thiết kế hệ thống đặt sân sao cho tránh tình trạng trùng lịch.</li>
                    <li>📊 Quản lý dữ liệu sân bóng và doanh thu cho chủ sân.</li>
                    <li>🔄 Đảm bảo các dữ liệu chuẩn xác và liên kết chặt chẽ với nhau.</li>
                </ul>
            </div>

            <div class="section success">
                <h2>2. Những Điều Nhóm Học Được</h2>
                <h3>📌 Về Kỹ Thuật:</h3>
                <ul>
                    <li>✅ Thành thạo hơn trong lập trình web (Java, SQL, HTML, CSS).</li>
                    <li>✅ Hiểu rõ và xử lý database sao cho phù hợp với các tính năng.</li>
                    <li>✅ Học cách debug và xử lý lỗi một cách hiệu quả.</li>
                    <li>✅ Tăng cường khả năng thiết kế giao diện thân thiện với người dùng.</li>
                </ul>
            </div>

            <div class="section warning">
                <h2>3. Thuận Lợi & Khó Khăn</h2>
                <h3>📍 Thuận Lợi:</h3>
                <ul>
                    <li>🚀 Đề tài thực tế, có tính ứng dụng cao, giúp nhóm có động lực hoàn thành tốt.</li>
                    <li>👥 Các thành viên hợp tác tốt, hỗ trợ lẫn nhau trong quá trình làm việc.</li>
                    <li>📚 Có tài liệu tham khảo phong phú giúp nhóm dễ dàng tìm giải pháp cho các vấn đề kỹ thuật.</li>
                </ul>

                <h3>📍 Khó Khăn:</h3>
                <ul>
                    <li>⚠️ Ban đầu còn thiếu kinh nghiệm trong việc thiết kế hệ thống, dẫn đến phải chỉnh sửa nhiều lần.</li>
                    <li>🕑 Tích hợp tính năng đặt sân và quản lý lịch trình khá phức tạp.</li>
                    <li>🛠 Một số thành viên chưa quen với backend, phải mất thời gian học thêm.</li>
                </ul>
            </div>

            
        </div>

    </body>
</html>
