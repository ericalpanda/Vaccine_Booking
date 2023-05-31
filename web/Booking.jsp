<%-- 
    Document   : Booking
    Created on : May 31, 2023, 8:17:34 AM
    Author     : DELL VOSTRO 5510
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <br>
        <label>Choose the Time Range</label>
        <br><br>
        <select>
            <c:forEach items="${timeRange}" var="t">
                <option value="volvo">${t.startAt} - ${t.endAt}</option>
            </c:forEach>
        </select>
    </body>
</html>
