let tableData = [];
window.addEventListener("load", loadTableData);

function sendData() {
     const x = document.querySelector('input[name="x"]:checked')?.value;  // Получаем выбранное значение X
     const y = document.getElementById('y').value;
     const r = document.querySelector('input[name="r"]:checked')?.value;  // Получаем выбранное значение R

     const data = JSON.stringify({
         x: parseFloat(x),
         y: parseFloat(y),
         r: parseFloat(r)
     });

     fetch('/fcgi-bin/server.jar', {
         method: 'POST',
         headers: {'Content-Type': 'application/json'},
         body: data
     })
         .then(response => response.json())
         .then(json => {
             // const resultContainer = document.getElementById('results');
             const table = document.querySelector("#result tbody");
             let newRow = table.insertRow(-1);
             newRow.innerHTML =
                 `<table>
                    <tr>
                        <td>${json.x}</td>
                        <td>${json.y}</td>
                        <td>${json.r}</td>
                        <td>${json.result}</td>
                        <td>${json.currentTime}</td>
                        <td>${json.executionTime}</td>
                    </tr>
                </table>`
             // resultContainer.innerHTML +=
             //     `<table>
             //        <tr>
             //            <td>${json.x}</td>
             //            <td>${json.y}</td>
             //            <td>${json.r}</td>
             //            <td>${json.result}</td>
             //            <td>${json.currentTime}</td>
             //            <td>${json.executionTime}</td>
             //        </tr>
             //    </table>`

             tableData.push([json.x, json.y, json.r, json.result, json.currentTime, json.executionTime]);
             saveTableData();
         }).catch(error => console.error('Error:', error));
 }

 function saveTableData() {
    sessionStorage.setItem("tableData", JSON.stringify(tableData));
 }

 function loadTableData() {
    let savedData = sessionStorage.getItem("tableData");
    if (savedData) {
        tableData = JSON.parse(savedData);
        const table = document.querySelector("#result tbody");
        table.innerHTML = "";
        tableData.forEach(row => {
            let newRow = table.insertRow(-1);
            row.forEach(element => {
                let newCell = newRow.insertCell(-1);
                newCell.appendChild(document.createTextNode(element));
            });
        });
    }
 }
