function handleButtonClick(button) {
    const buttons = document.querySelectorAll('.x-button');
    removeButtons(buttons)
    button.classList.add('selected');
}

function removeButtons(buttons) {
    buttons.forEach(button => {
        button.classList.remove('selected-button');
    });
}