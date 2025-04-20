<%-- 
    Document   : addField
    Created on : Mar 25, 2025, 9:34:24 AM
    Author     : bacda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/adminHomeStyle.css">
    </head>
    <body>
        <form id="addFieldForm" action="admin" method="GET">
            <h3>Thêm Sân Bóng Mới</h3>
            <input type="hidden" name="action" value="add">

            <div class="form-row">
                

                <div class="form-group">
                    <label for="fieldName">Tên sân:</label>
                    <input type="text" id="fieldName" name="fieldName" required>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="description">Mô tả:</label>
                    <input type="text" id="description" name="description" required>
                </div>

                <div class="form-group">
                    <label for="location">Địa chỉ:</label>
                    <input type="text" id="location" name="location" required>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="price">Giá thuê (/giờ):</label>
                    <input type="number" id="price" name="price" required>
                </div>

                <div class="form-group">
                    <label for="imageURL">Ảnh sân:</label>
                    <input type="text" id="imageURL" name="imageURL" placeholder="Nhập URL ảnh">
                </div>
            </div>

            <div class="form-group">
                <label for="amenities">Tiện ích:</label>
                <input type="text" id="amenities" name="amenities" required>
            </div>

            <button type="submit">Thêm sân</button>
            <button type="button" onclick="window.location.href='admin'">Trang Chủ</button>

        </form>
        
    </body>
</html>
