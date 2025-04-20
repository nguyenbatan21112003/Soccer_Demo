<%-- 
    Document   : updatePage
    Created on : Mar 27, 2025, 10:50:55 PM
    Author     : bacda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cập Nhật Sân Bóng</title>
        <link rel="stylesheet" type="text/css" href="css/adminHomeStyle.css"> <!-- Liên kết đến CSS -->
    </head>
    <body>
        <div class="container">
            <h2>Cập Nhật Thông Tin Sân</h2>
            <form action="admin" id="updateForm">
                <div class="form-group">
                    <label for="fieldID">Mã Sân</label>
                    <input type="text" name="fieldID" value="${detail.fieldID}" readonly />
                </div>

                <div class="form-group">
                    <label for="fieldName">Tên Sân</label>
                    <input type="text" name="fieldName" value="${detail.fieldName}" required />
                </div>

                <div class="form-group">
                    <label for="description">Mô Tả</label>
                    <input type="text" name="description" value="${detail.description}" />
                </div>

                <div class="form-group">
                    <label for="location">Địa Điểm</label>
                    <input type="text" name="location" value="${detail.location}" required />
                </div>

                <div class="form-group">
                    <label for="price">Giá Thuê</label>
                    <input type="number" name="price" value="${detail.price}" required />
                </div>

                <div class="form-group">
                    <label for="imageURL">Hình Ảnh</label>
                    <input type="text" name="imageURL" value="${detail.imageURL}" />
                </div>

                <div class="form-group">
                    <label for="amenities">Tiện Ích</label>
                    <input type="text" name="amenities" value="${detail.amenities}" />
                </div>

                <input type="hidden" name="action" value="update" />
                
                <div class="button-group">
                    <input type="submit" value="Lưu" class="btn-save" />
                    <button type="button" onclick="window.location.href='admin'">Hủy</button>
                </div>
            </form>
        </div>
    </body>
</html>

