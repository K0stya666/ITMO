document.getElementById('graph').addEventListener('click', e => {
    let x = Math.round((e.offsetX - 150) / 30);
    let y = (e.offsetY - 150) / 30;

    console.log(x, y);

    let r = document.getElementById('selectedR').value;

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