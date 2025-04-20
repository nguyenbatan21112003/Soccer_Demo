<%-- 
    Document   : userList.jsp
    Created on : Mar 28, 2025, 8:48:49 AM
    Author     : bacda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table>
            <c:forEach items="${list}" var="o">
                <tr>
                    <td>${o.userId}</td>
                    <td>${o.userName}</td>
                    <td>${o.fullName}</td>
                    <td>${o.role}</td>
                    <td>${o.email}</td>
                    <td>${o.password}</td>
                    <td>${o.address}</td>
                    <td>
                        <!-- Nút xóa -->
                        <form action="admin" method="get" class="delete-form">
                            <input type="hidden" name="action" value="deleteUser">
                            <input type="hidden" name="fieldID" value="${o.fieldID}">
                            <button type="submit" class="btn-delete">Xóa</button>
                        </form>


                    </td>
                </tr>
            </c:forEach>
        </table>

    </body>
</html>
