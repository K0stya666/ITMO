document.getElementById('graph').addEventListener('click', e => {
    let svg = document.getElementById('graph');
    let svgX = e.offsetX;
    let svgY = e.offsetY;

    let r = document.getElementById('selectedR').value;
    let x = ((svgX - 150) * r) / 120;
    let y = -((svgY - 150) * r) / 120;

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