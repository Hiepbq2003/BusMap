/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

async function autocomplete(inputId) {
    let input = document.getElementById(inputId).value;
    if (input.length < 2) {
        document.getElementById(inputId + '-suggestions').innerHTML = '';
        return;
    }
    
    let response = await fetch(`/BusStopAutocomplete?query=${input}`);
    let suggestions = await response.json();

    let suggestionsList = document.getElementById(inputId + '-suggestions');
    suggestionsList.innerHTML = '';
    suggestions.forEach(stop => {
        let li = document.createElement('li');
        li.innerText = stop.name;
        li.onclick = () => selectSuggestion(inputId, stop.name);
        suggestionsList.appendChild(li);
    });
}

function selectSuggestion(inputId, value) {
    document.getElementById(inputId).value = value;
    document.getElementById(inputId + '-suggestions').innerHTML = '';
}

function swapPoints() {
    let pointA = document.getElementById('pointA').value;
    let pointB = document.getElementById('pointB').value;
    document.getElementById('pointA').value = pointB;
    document.getElementById('pointB').value = pointA;
}
