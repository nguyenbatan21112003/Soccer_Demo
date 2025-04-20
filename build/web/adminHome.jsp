<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <title>ADMIN HOME</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link rel="stylesheet" href="css/adminHomeStyle.css">
    </head>
    <body>
        <div class="container">
            <h2>Quản Lý Sân Bóng</h2>
            
            <div class="logout-container">
                <form action="admin">
                    <input name="action" type="hidden" value="addPage">
                    <input type="submit" value="Thêm Sân" class="btn-logout">
                </form>
                <form action="admin">
                    <input name="action" type="hidden" value="userlist">
                    <input type="submit" value="User List" class="btn-logout">
                </form>
                <form action="admin">
                    <input name="action" type="hidden" value="revenuaReport">
                    <input type="submit" value="Doanh Thu" class="btn-logout">
                </form>
                <form action="admin">
                    <input name="action" type="hidden" value="bookingListPage">
                    <input type="submit" value="Booking List" class="btn-logout">
                </form>
                <form action="home">
                    <input name="action" type="hidden" value="logout">
                    <input type="submit" value="Đăng Xuất" class="btn-logout">
                </form>
            </div>


            <!-- Bảng danh sách sân bóng -->
            <table border="1">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tên sân</th>
                        <th>Mô tả</th>
                        <th>Địa chỉ</th>
                        <th>Giá (/giờ)</th>
                        <th>Hình ảnh</th>
                        <th>Tiện ích</th>   
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="o">
                        <tr>
                            <td>${o.fieldID}</td>
                            <td>${o.fieldName}</td>
                            <td>${o.description}</td>
                            <td>${o.location}</td>
                            <td>${o.price}</td>
                            <td><img src="${o.imageURL}" alt="Sân bóng" width="100"></td>
                            <td>${o.amenities}</td>

                            <td>
                                <!-- Nút xóa -->
                                <form action="admin" method="get" class="delete-form">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="fieldID" value="${o.fieldID}">
                                    <button type="submit" class="btn-delete">Xóa</button>
                                </form>
                                <form action="admin" method="get" class="delete-form">
                                    <input type="hidden" name="action" value="updatePage">
                                    <input type="hidden" name="fieldID" value="${o.fieldID}">
                                    <button type="submit" class="btn-delete">Sửa</button>
                                </form>

                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            

        </div>
    </body>
</html>