function validateForm() {
    const y = document.getElementById("y").value.trim();

    if (y === "" || isNaN(y)) {
        alert("Поле Y должно быть числом!");
        return false;
    } else if (y < -5 || y > 3) {
        alert("Значение Y должно лежать в диапазоне от -5 до 5")
        return false;
    }

    let yValue = parseInt(y);

    if (yValue < -5 || yValue > 3) {
        alert("Значение Y должно лежать в диапазоне от -5 до 5")
        return false;
    }

    return true;
}

function handleButtonClick(value, button) {
    document.getElementById('selectedR').value = value;
    const buttons = document.getElementsByClassName('value-button');

    for (var i = 0; i < buttons.length; i++) {
        buttons[i].classList.remove('selected');
    }

    button.classList.add('selected');
}

// function onlyOne(checkbox, group) {
//     const checkboxes = document.querySelectorAll(`input[name='${group}']`)
//     checkboxes.forEach((cb) => {
//         if (cb !== checkbox) {
//             cb.checked = false;
//         }
//     })
// }