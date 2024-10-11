<%@ page import="java.time.LocalDate" %>
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
        double x = (double) request.getAttribute("x");
        double y = (double) request.getAttribute("y");
        double r = (double) request.getAttribute("r");
        Boolean isHit = (Boolean) request.getAttribute("isHit");
        LocalDate date = (LocalDate) request.getAttribute("date");
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