function handleButtonClick(value, button) {
    document.getElementById('selectedR').value = value;
    const buttons = document.getElementsByClassName('value-button');

    for (var i = 0; i < buttons.length; i++) {
        buttons[i].classList.remove('selected');
    }

    button.classList.add('selected');
}