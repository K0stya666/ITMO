document.getElementById('graph').addEventListener('click', e => {
    let r = document.getElementById('selectedR').value;
    let x = Math.floor(((e.offsetX - 150) * r) / 120);
    let y = Number((-((e.offsetY - 150) * r) / 120).toFixed(3));

    console.log(x, y);



    console.log(r)

    if (r !== "") {

        let radioX = document.querySelector(`input[name="x"][value="${x}"]`);
        if (radioX) {
            radioX.checked = true;
        }
        // document.querySelector(`input[name="x"][value="${x}"]`).checked = true;

        document.getElementById('y').value = y;

        document.getElementById('areaForm').submit();
    }
});