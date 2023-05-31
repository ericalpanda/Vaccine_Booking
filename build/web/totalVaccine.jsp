<%-- 
    Document   : totalVaccine
    Created on : May 31, 2023, 9:00:53 AM
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
        <h1>Hello World!</h1>
        <table style="width:100%">
            <c:forEach items="${vaccine}" var="vc">
                <tr>
                    <th>id</th>
                    <th>Name</th>
                    <th>Detail</th>
                </tr>
                <tr>
                    <td>${vc.idVaccine}</td>
                    <td>${vc.name}</td>
                    <td>${vc.detail}</td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
