function validateForm() {
    let isValid = true;

    let selectedX = document.querySelector('input[name="x"]:checked')

    const x = selectedX ? selectedX.value : "";
    const y = document.getElementById("y").value.trim();
    const r = document.getElementById("selectedR").value.trim();

    if (y === "" || isNaN(y)) {
        alert("Поле Y должно быть числом!");
        isValid = false;
    }

    let yValue = parseInt(y);

    if (yValue < -5 || yValue > 5) {
        alert("Значение Y должно лежать в диапазоне от -5 до 5")
        isValid =  false;
    }

    if (x === "" || isNaN(x) || r === "" || isNaN(r)) {
        alert("Введите пожалуйста все параметры формы")
        isValid = false;
    }

    return isValid;
}

function handleButtonClick(value, button) {
    document.getElementById('selectedR').value = value;
    const buttons = document.getElementsByClassName('value-button');

    for (var i = 0; i < buttons.length; i++) {
        buttons[i].classList.remove('selected');
    }

    button.classList.add('selected');
}