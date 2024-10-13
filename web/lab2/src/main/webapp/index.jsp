<%@ page import="java.util.List" %>
<%@ page import="server.Point" %>
<%@ page import="java.time.LocalDate" %>
<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Лабораторная работа по web-programming</title>
    <link rel="stylesheet" href="style.css">
    <link rel="icon" href="images/icon.png" type="image/png">
    <link rel="icon" href="images/shit.png" type="image/apple-touch-icon.png">
</head>
<body>

<%
    List<Point> points = (List<Point>) application.getAttribute("points");
%>

<header>
    <h1>ФИО: Елисеев Константин Иванович</h1>
    <h1>Группа: P3208</h1>
    <h1>Вариант: 456752 </h1>
</header>

<svg id="graph" xmlns="http://www.w3.org/2000/svg" width="300" height="300">

    <!-- square-->
    <rect x="150" y="30" width="120" height="120" fill="#122028" fill-opacity="0.6"></rect>

    <!-- triangle-->
    <polygon points="150,150 270,150 150,210" fill="#122028" fill-opacity="0.6"></polygon>

    <!-- circle-->
    <path d="M 150 150 L 30 150 C 30 210 90 270 150 270 Z" fill="#122028" fill-opacity="0.6"></path>

    <line x1="0" y1="150" x2="300" y2="150" stroke="#122028"></line>
    <line x1="150" y1="0" x2="150" y2="300" stroke="#122028"></line>
    <line x1="270" y1="148" x2="270" y2="152" stroke="#122028"></line>
    <text x="265" y="140">R</text>
    <line x1="210" y1="148" x2="210" y2="152" stroke="#122028"></line>
    <text x="200" y="140">R/2</text>
    <line x1="90" y1="148" x2="90" y2="152" stroke="#122028"></line>
    <text x="75" y="140">-R/2</text>
    <line x1="30" y1="148" x2="30" y2="152" stroke="#122028"></line>
    <text x="20" y="140">-R</text>
    <line x1="148" y1="30" x2="152" y2="30" stroke="#122028"></line>
    <text x="156" y="35">R</text>
    <line x1="148" y1="90" x2="152" y2="90" stroke="#122028"></line>
    <text x="156" y="95">R/2</text>
    <line x1="148" y1="210" x2="152" y2="210" stroke="#122028"></line>
    <text x="156" y="215">-R/2</text>
    <line x1="148" y1="270" x2="152" y2="270" stroke="#122028"></line>
    <text x="156" y="275">-R</text>

    <polygon points="300,150 295,155 295, 145" fill="#000720" stroke="#000720"></polygon>
    <polygon points="150,0 145,5 155,5" fill="#000720" stroke="#000720"></polygon>

    <%
        if (points != null) {
            for (int i = 0; i < points.size(); i++) {
                Point point = points.get(i);

                double x = point.getX();
                double y = point.getY();
                double r = point.getR();
                boolean isHit = point.isHit();

                double svgX = ((x * 120) / r) + 150;
                double svgY = ((- y * 120) / r) + 150;
    %>
        <circle r="3" cx="<%=svgX%>" cy="<%=svgY%>" fill-opacity="0.9" fill="<%=isHit ? "green" : "red"%>" stroke="<%=isHit ? "green" : "firebrick"%>"></circle>
    <%
            }
        }
    %>

</svg>

<h1>График попадания точки</h1>

<div class="tables-container">
    <form id="areaForm" action="${pageContext.request.contextPath}/controller" method="GET" onsubmit="return validateForm()">
        <table>
            <tr>
                <td>Изменение X:</td>
                <td id="checkbox-container-x">

                    <% for (int i = -3; i <= 5; i ++) { %>
                        <label><input type="radio" name="x" value="<%= i %>"><%=i%></label>
                    <% } %>

                </td>
            </tr>
            <tr>
                <td>Изменение Y:</td>
                <td><label for="y"></label><input type="text" name="y" id="y" placeholder="Введите число от -5 до 5"></td>
            </tr>
            <tr>
                <td>Изменение R:</td>
                <td id="button-container-R">
                    <input type="hidden" name="r" id="selectedR" value="">

                    <%
                        for (double i = 1; i <= 3; i += 0.5) {
                    %>
                        <button id="r" class="value-button" type="button" name="r" onclick="handleButtonClick(<%= i %>, this)"><%= i %></button>
                    <%
                        }
                    %>

                </td>
            </tr>
<%--            <td colspan="2">--%>
<%--                --%>
<%--            </td>--%>
        </table>

        <div style="display: grid; place-items: center;">
            <button class="resultButton" type="submit">Проверить</button>
        </div>
    </form>

    <table>
        <tr>
            <th>X</th>
            <th>Y</th>
            <th>R</th>
            <th>Результат</th>
            <th>Дата</th>
        </tr>

        <%
            if (points != null) {
                for (int i = 0; i < points.size(); i++) {
                    Point point = points.get(i);

                    double x = point.getX();
                    double y = point.getY();
                    double r = point.getR();
                    boolean isHit = point.isHit();
                    LocalDate date = point.getDate();
        %>

                    <tr>
                        <th><%=x%></th>
                        <th><%=y%></th>
                        <th><%=r%></th>
                        <th><%=isHit ? "Попадание" : "Промах"%></th>
                        <th><%=date%></th>
                    </tr>

        <%
                }
            }
        %>
    </table>

</div>

<script type="text/javascript" src="scripts/validate.js"></script>
<script type="text/javascript" src="scripts/interactive.js"></script>
</body>
</html>