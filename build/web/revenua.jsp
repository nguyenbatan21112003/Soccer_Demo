<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Revenue Report</title>
        <link rel="stylesheet" href="css/revenuaStyle.css">
    </head>
    <body>
        <div class="container">
            <h1>Revenue Report</h1>
            
            <a href="admin" class="home-button">Back to Home</a>
            
            <table class="revenue-table">
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Total Price</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="o">
                        <tr>
                            <td>${o.date}</td>
                            <td>${o.totalPrice}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>