<%@ page import="java.util.List" %>
<%@ page import="server.Point" %>
<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Лабораторная работа по web-programming</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>

    <%
//        List<Point> points = (List<Point>) application.getAttribute("points");
        Point point = (Point) application.getAttribute("point");
    %>

    <table id="result">
        <tr>
            <th>X</th>
            <th>Y</th>
            <th>R</th>
            <th>Результат</th>
            <th>Время</th>
        </tr>

<%--        <%--%>
<%--            for (int i = 0; i < points.size(); i++) {--%>
<%--                Point point = points.get(i);--%>
<%--        %>--%>

        <tr>
            <th><%=point.getX()%></th>
            <th><%=point.getY()%></th>
            <th><%=point.getR()%></th>
            <th><%=point.isHit() ? "Попадание" : "Промах"%></th>
            <th><%=point.getDate()%></th>
        </tr>

<%--        <%--%>
<%--            }--%>
<%--        %>--%>
    </table>

    <a href="index.jsp">
        <button>На главную</button>
    </a>
</body>
</html>