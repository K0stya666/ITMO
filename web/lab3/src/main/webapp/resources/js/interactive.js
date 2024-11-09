document.getElementById('graph').addEventListener('click', e => {
    const svg = document.getElementById('graph');
    const svgX = e.offsetX;
    const svgY = e.offsetY;

    const x = (svgX - 250)/40;
    const y = (250 - svgY)/40;
    const r = PF('rMenu').getSelectedValue();

    console.log("x, y =" + x, y);
    console.log("r = " + r);

    document.getElementById('hiddenForm:hiddenX').value = x;
    document.getElementById('hiddenForm:hiddenY').value = y;
    document.getElementById('hiddenForm:hiddenR').value = r;
    document.getElementById('hiddenForm:hiddenSubmit').click();
});
