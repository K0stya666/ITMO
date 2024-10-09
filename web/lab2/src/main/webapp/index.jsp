<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Лабораторная работа по web-programming</title>
    <link rel="stylesheet" href="style.css">

    <script type="text/javascript" src="scripts/mail.js"></script>
</head>
<body >
<header>
    <h1>ФИО: Елисеев Константин Иванович</h1>
    <h1>Группа: P3208</h1>
    <h1>Вариант: 94</h1>
</header>

<svg xmlns="http://www.w3.org/2000/svg" width="300" height="300">
    <!-- triangle-->
    <polygon points="90,150 150,30 150,150" fill="#122028" fill-opacity="0.6"></polygon>

    <!-- square-->
    <rect x="150" y="150" width="120" height="120" fill="#122028" fill-opacity="0.6"></rect>
    <!-- circle-->
    <path d="M 150 150 L 90 150 C 90 185 125 210 150 210 Z" fill="#122028" fill-opacity="0.6"></path>

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


    <!-- точка результата-->
    <circle id="pointer" r="5" cx="150" cy="150" fill-opacity="0.9" fill="red" stroke="firebrick"
            visibility="hidden"></circle>
</svg>

<h1>График попадания точки</h1>

<div class="tables-container">
    <form id="areaForm" method="GET" onsubmit="return validateForm()">
        <table>
            <tr>
                <td>Изменение X:</td>
                <td id="checkbox-container-x">
                    <label><input type="checkbox" name="x" value="-5" onclick="onlyOne(this, 'x')">-5</label>
                    <label><input type="checkbox" name="x" value="-4" onclick="onlyOne(this, 'x')">-4</label>
                    <label><input type="checkbox" name="x" value="-3" onclick="onlyOne(this, 'x')">-3</label>
                    <label><input type="checkbox" name="x" value="-2" onclick="onlyOne(this, 'x')">-2</label>
                    <label><input type="checkbox" name="x" value="-1" onclick="onlyOne(this, 'x')">-1</label>
                    <label><input type="checkbox" name="x" value="0" onclick="onlyOne(this, 'x')">0</label>
                    <label><input type="checkbox" name="x" value="1" onclick="onlyOne(this, 'x')">1</label>
                    <label><input type="checkbox" name="x" value="2" onclick="onlyOne(this, 'x')">2</label>
                    <label><input type="checkbox" name="x" value="3" onclick="onlyOne(this, 'x')">3</label>
                </td>
            </tr>
            <tr>
                <td>Изменение Y:</td>
                <td><label for="y"></label><input type="text" name="y" id="y"></td>
            </tr>
            <tr>
                <td>Изменение R:</td>
                <td id="checkbox-container-R">
                    <label><input type="checkbox" name="r" value="1" onclick="onlyOne(this, 'r')">1</label>
                    <label><input type="checkbox" name="r" value="2" onclick="onlyOne(this, 'r')">2</label>
                    <label><input type="checkbox" name="r" value="3" onclick="onlyOne(this, 'r')">3</label>
                    <label><input type="checkbox" name="r" value="4" onclick="onlyOne(this, 'r')">4</label>
                    <label><input type="checkbox" name="r" value="5" onclick="onlyOne(this, 'r')">5</label>
                </td>
            </tr>
            <td colspan="2">
                <button id="resultButton" type="submit" onclick="event.preventDefault(); sendData()">Проверить</button>
            </td>
        </table>
    </form>
    <table id="result">
        <thead>
        <tr>
            <th>X</th>
            <th>Y</th>
            <th>R</th>
            <th>Результат</th>
            <th>Время</th>
            <th>Время выполнения</th>
        </tr>
        </thead>
        <tbody id="results">
            <!-- Здесь будут появляться динамически подгружаемые данные -->
        </tbody>
    </table>
</div>

<script type="text/javascript" src="scripts/validate.js"></script>
</body>
</html>