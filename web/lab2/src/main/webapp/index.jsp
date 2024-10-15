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

<svg id="graph" xmlns="http://www.w3.org/2000/svg" width="500" height="500">

    <rect id="square" x="250" y="50" width="200" height="200" fill="#122028" fill-opacity="0.6"></rect>
    <polygon id="triangle" points="250,250 450,250 250,350" fill="#122028" fill-opacity="0.6"></polygon>
<%--    <path id="circle" d="M 250 250 L 50 250 A 200 200 0 0 1 450 250 Z" fill="#122028" fill-opacity="0.6"></path>--%>
<%--    <path id="circle" d="M 250 250 L 50 250 A 200 200 0 1 0 450 250 Z" fill="#122028" fill-opacity="0.6"></path>--%>
<%--    <path id="circle" d="M 250 250 L 50 250 A 200 200 0 1 0 450 250 Z" fill="#122028" fill-opacity="0.6"></path>--%>
    <path id="circle" d="M 250 250 L 50 250 A 200 200 0 0 0 250 450 Z" fill="#122028" fill-opacity="0.6"></path>


<%--    <path id="circle" d="M 250 250 L 50 250 C 50 350 150 450 250 450 Z" fill="#122028" fill-opacity="0.6"></path>--%>

    <!--X line-->
    <line x1="0" y1="250" x2="500" y2="250" stroke="#122028"></line>
    <!--Y line-->
    <line x1="250" y1="0" x2="250" y2="500" stroke="#122028"></line>

    <line x1="210" y1="248" x2="210" y2="252" stroke="#122028"></line> <!-- -1 point on x -->
    <line x1="290" y1="248" x2="290" y2="252" stroke="#122028"></line> <!-- 1 point on x -->
    <text x="205" y="240">-1</text> <!-- '-1' on x -->
    <text x="285" y="240">1</text> <!-- '1' on x -->

    <line x1="170" y1="248" x2="170" y2="252" stroke="#122028"></line> <!-- -2 point on x -->
    <line x1="330" y1="248" x2="330" y2="252" stroke="#122028"></line> <!-- 2 point on x -->
    <text x="165" y="240">-1.5</text> <!-- '-2' on x -->
    <text x="325" y="240">1.5</text> <!-- '2' on x -->

    <line x1="130" y1="248" x2="130" y2="252" stroke="#122028"></line> <!-- -3 point on x -->
    <line x1="370" y1="248" x2="370" y2="252" stroke="#122028"></line> <!-- 3 point on x -->
    <text x="125" y="240">-2</text> <!-- '-3' on x -->
    <text x="365" y="240">2</text> <!-- '3' on x -->

    <line x1="90" y1="248" x2="90" y2="252" stroke="#122028"></line> <!-- -4 point on x -->
    <line x1="410" y1="248" x2="410" y2="252" stroke="#122028"></line> <!-- 4 point on x -->
    <text x="85" y="240">-2.5</text> <!-- '-4' on x -->
    <text x="405" y="240">2.5</text> <!-- '4' on x -->

    <line x1="50" y1="248" x2="50" y2="252" stroke="#122028"></line> <!-- -5 point on x -->
    <line x1="450" y1="248" x2="450" y2="252" stroke="#122028"></line> <!-- 5 point on x -->
    <text x="45" y="240">-3</text> <!-- '-5' on x -->
    <text x="445" y="240">3</text> <!-- '5' on x -->


    <line x1="248" y1="210" x2="252" y2="210" stroke="#122028"></line> <!-- 1 on y -->
    <line x1="248" y1="290" x2="252" y2="290" stroke="#122028"></line> <!-- -1 on y -->
    <text x="256" y="215">1</text> <!-- 1 on y -->
    <text x="256" y="295">-1</text> <!-- -1 on y -->

    <line x1="248" y1="170" x2="252" y2="170" stroke="#122028"></line> <!-- 2 on y -->
    <line x1="248" y1="330" x2="252" y2="330" stroke="#122028"></line> <!-- -2 on y -->
    <text x="256" y="175">1.5</text> <!-- 2 on y -->
    <text x="256" y="335">-1.5</text> <!-- -2 on y -->

    <line x1="248" y1="130" x2="252" y2="130" stroke="#122028"></line> <!-- 3 on y -->
    <line x1="248" y1="370" x2="252" y2="370" stroke="#122028"></line> <!-- -3 on y -->
    <text x="256" y="135">2</text> <!-- 3 on y -->
    <text x="256" y="375">-2</text> <!-- -3 on y -->

    <line x1="248" y1="90" x2="252" y2="90" stroke="#122028"></line> <!-- 4 on y -->
    <line x1="248" y1="410" x2="252" y2="410" stroke="#122028"></line> <!-- -4 on y -->
    <text x="256" y="95">2.5</text> <!-- 4 on y -->
    <text x="256" y="415">-2.5</text> <!-- -4 on y -->

    <line x1="248" y1="50" x2="252" y2="50" stroke="#122028"></line> <!-- 5 on y -->
    <line x1="248" y1="450" x2="252" y2="450" stroke="#122028"></line> <!-- -5 on y -->
    <text x="256" y="55">3</text> <!-- 3 on y -->
    <text x="256" y="455">-3</text> <!-- -3 on y -->
    <!-- arrows -->
    <polygon points="250,0 255,5 245, 5" fill="#000720" stroke="#000720"></polygon>
    <polygon points="500, 250 495,245 495,255" fill="#000720" stroke="#000720"></polygon>

    <%
        if (points != null) {
            for (int i = 0; i < points.size(); i++) {
                Point point = points.get(i);

                double x = point.getX();
                double y = point.getY();
                double r = point.getR();
                boolean isHit = point.isHit();

                double svgX = ((x * 120) / r) + 250;
                double svgY = ((- y * 120) / r) + 250;
    %>
        <circle r="3" cx="<%=svgX%>" cy="<%=svgY%>" fill-opacity="0.9" fill="<%=isHit ? "blue" : "red"%>" stroke="<%=isHit ? "black" : "firebrick"%>"></circle>
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
        </table>

        <div style="display: grid; place-items: center;">
            <button class="resultButton" type="submit">Проверить</button>
        </div>
    </form>

    <table id="resultTable">
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

<%--    <div style="display: grid; place-items: center;">--%>
<%--        <button id="clearButton" class="resultButton" onclick="clearTable(<%=points%>)">Очистить историю</button>--%>

<%--        <script>--%>
<%--            const button = document.getElementById('clearButton');--%>

<%--            function clearTable() {--%>
<%--                <%assert points != null; points.clear();%>--%>
<%--                alert("История была очищена")--%>
<%--            }--%>
<%--        </script>--%>
<%--    </div>--%>

</div>

<script type="text/javascript" src="scripts/validate.js"></script>
<script type="text/javascript" src="scripts/interactive.js"></script>
</body>
</html>