document.getElementById('graph').addEventListener('click', e => {
    let svg = document.getElementById('graph');
    let svgX = e.offsetX;
    let svgY = e.offsetY;

    let r = document.getElementById('selectedR').value;
    // let x = ((svgX - 250) * r) / 120;
    // let y = -((svgY - 250) * r) / 120;
    let x = (svgX - 250)/40;
    let y = (250 - svgY)/40;

    console.log(x, y);
    console.log(r)

    if (r !== "") {
        let point = document.createElementNS('http://www.w3.org/2000/svg', 'circle');
        point.setAttribute('cx', svgX);
        point.setAttribute('cy', svgY)
        point.setAttribute('r', 3);
        point.setAttribute('fill', 'red');
        svg.appendChild(point);

        document.getElementById('y').value = y;
        let queryParams = `?x=${x.toFixed(3)}&y=${y.toFixed(3)}&r=${r}`;
        window.location.href = 'http://localhost:9696/lab2/controller' + queryParams;
    } else {
        alert("Выберите значение R")
    }
});

document.addEventListener("DOMContentLoaded", function() {
    // Ваш код здесь для назначения событий кнопкам
    const buttons = document.querySelectorAll('.value-button');

    buttons.forEach(button => {
        button.addEventListener('click', () => {
            const centerX = 250;
            const centerY = 250;
            let r = button.innerHTML; // Получаем значение из кнопки

            document.getElementById('selectedR').value = r; // Устанавливаем выбранное значение R

            /* get radius */
            const radius = r * 40;

            /* update triangle */
            const trianglePoints = `
                ${centerX},${centerY}
                ${centerX},${centerY + radius / 2}
                ${centerX + radius},${centerY}
            `;
            document.getElementById('triangle').setAttribute('points', trianglePoints.trim());

            /* update rectangle */
            const square = document.getElementById('square');
            square.setAttribute('x', centerX);
            square.setAttribute('y', centerY - radius);
            square.setAttribute('width', radius);
            square.setAttribute('height', radius);

            /* update quarter circle */
            const quarterCirclePath = `
                M ${centerX} ${centerY}
                L ${centerX - radius} ${centerY}
                A ${radius} ${radius} 0 0 0 ${centerX} ${centerY + radius}
                Z `;
            document.getElementById('circle').setAttribute('d', quarterCirclePath.trim());
        });
    });
});