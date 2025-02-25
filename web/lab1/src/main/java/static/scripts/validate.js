function validateForm() {
    const y = document.getElementById("y").value.trim();

    // Пример проверки, что поле Y не пустое и является числом
    if (!y || isNaN(y)) {
        alert("Поле Y должно быть числом!");
        return false; // Отменяет отправку формы
    } else if (y < -3 || y > 3) {
        alert("Значение Y должно лежать в диапазоне от -3 до 3")
        return false;
    }

    //alert("Теперь ты гей")
    return true; // Разрешает отправку формы

    // const params = new URLSearchParams({
    //     x:x,
    //     y:y,
    //     r:r
    // })
    //
    // fetch(`http://localhost:8080/area-check?${params.toString()}`, {
    //     method: 'POST'
    // }).then(response => response.json()).then(data => { updateTable(data);
    // }).catch(error => console.error('Error:', error));
    // return false;
}

function onlyOne(checkbox, group) {
    const checkboxes = document.querySelectorAll(`input[name='${group}']`)
    checkboxes.forEach((cb) => {
        if (cb !== checkbox) {
            cb.checked = false;
        }
    })
}

function updateTable(data) {
    const table = document.getElementById("results");
    const newRaw = document.createElement('tr');
    newRaw.innerHTML = `
        <td>${data.x}</td>
        <td>${data.y}</td>
        <td>${data.r}</td>
        <td>${data.result ? 'Попадание' : 'Промах'}</td>
        <td>${data.currentTime}</td>
        <td>${data.executionTime} ms</td>
    `;

    // Добавляем строку в таблицу
    table.appendChild(newRaw);
}


