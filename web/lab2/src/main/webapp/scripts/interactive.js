document.getElementById('graph').addEventListener('click', e => {
    let r = document.getElementById('selectedR').value;
    let x = ((e.offsetX - 150) * r) / 120;
    let y = -((e.offsetY - 150) * r) / 120;

    console.log(x, y);
    console.log(r)

    if (r !== "") {
        document.getElementById('y').value = y;

        let queryParams = `?x=${x.toFixed(3)}&y=${y.toFixed(3)}&r=${r}`;

        window.location.href = 'http://localhost:9696/lab2/controller' + queryParams;
    }
});