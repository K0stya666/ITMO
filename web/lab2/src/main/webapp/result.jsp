<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.List" %>
<%@ page import="server.Point" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Лабораторная работа по web-programming</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>

    <%
//        double x = (double) session.getAttribute("x");
//        double y = (double) session.getAttribute("y");
//        double r = (double) session.getAttribute("r");
//        Boolean isHit = (Boolean) session.getAttribute("isHit");
//        LocalDate date = (LocalDate) session.getAttribute("date");

        List<Point> points = (List<Point>) request.getAttribute("points");
    %>

    <table>
        <tr>
            <th>X</th>
            <th>Y</th>
            <th>R</th>
            <th>Результат</th>
            <th>Время</th>
        </tr>

        <tr>
            <th><%=x%></th>
            <th><%=y%></th>
            <th><%=r%></th>
            <th><%=isHit ? "Попадание" : "Промах"%></th>
            <th><%=date%></th>
        </tr>

<%--&lt;%&ndash;        <tr>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <tn><%=x%></tn>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <tn><%=y%></tn>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <tn><%=r%></tn>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <tn>хуй</tn>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <tn>хуй</tn>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <tn>хуй</tn>&ndash;%&gt;--%>
<%--&lt;%&ndash;        </tr>&ndash;%&gt;--%>
<%--    </table>--%>
</body>
</html>