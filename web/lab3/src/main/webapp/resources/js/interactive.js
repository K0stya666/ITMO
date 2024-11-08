document.getElementById('graph').addEventListener('click', e => {
    let svg = document.getElementById('graph');
    let svgX = e.offsetX;
    let svgY = e.offsetY;

    const r = PF('rMenu').getSelectedValue();

    // let x = ((svgX - 250) * r) / 120;
    // let y = -((svgY - 250) * r) / 120;
    let x = (svgX - 250)/40;
    let y = (250 - svgY)/40;

    console.log("x, y =" + x, y);
    console.log("r = " + r)

    if (r !== "") {
        let point = document.createElementNS('http://www.w3.org/2000/svg', 'circle');
        point.setAttribute('cx', svgX);
        point.setAttribute('cy', svgY)
        point.setAttribute('r', 3);
        point.setAttribute('fill', 'red');
        svg.appendChild(point);

        // document.getElementById('y').value = y;

        // let queryParams = `?x=${x.toFixed(3)}&y=${y.toFixed(3)}&r=${r}`;
        // window.location.href = 'http://localhost:9696/lab2/' + queryParams;
    } else {
        alert("Выберите значение R")
    }
});