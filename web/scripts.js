/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


const btx = document.getElementById('busChart').getContext('2d');
const busChart = new Chart(btx, {
    type: 'line',
    data: {
        labels: ['1-6-2024', '10-6-2024', '20-6-2024', '30-6-2024', '10-7-2024'],
        datasets: [
            {
                label: 'Total Buses',
                data: [50, 50, 50, 50, 50],
                borderColor: 'blue',
                fill: false
            },
            {
                label: 'Active Buses',
                data: [5, 10, 15, 20, 25],
                borderColor: 'green',
                fill: false
            },
        ]
    },
    options: {
        responsive: true,
        scales: {
            x: {
                display: true,
                title: {
                    display: true,
                    text: 'Date'
                }
            },
            y: {
                display: true,
                title: {
                    display: true,
                    text: 'Buses'
                }
            }
        }
    }
});
const rtx = document.getElementById('routeChart').getContext('2d');
const routeChart = new Chart(rtx, {
    type: 'line',
    data: {
        labels: ['1-6-2024', '10-6-2024', '20-6-2024', '30-6-2024', '10-7-2024'],
        datasets: [
            {
                label: 'Total Routes',
                data: [50, 50, 50, 50, 50],
                borderColor: 'blue',
                fill: false
            },
            {
                label: 'Active Routes',
                data: [5, 10, 15, 20, 25],
                borderColor: 'green',
                fill: false
            },
        ]
    },
    options: {
        responsive: true,
        scales: {
            x: {
                display: true,
                title: {
                    display: true,
                    text: 'Date'
                }
            },
            y: {
                display: true,
                title: {
                    display: true,
                    text: 'Routes'
                }
            }
        }
    }
});
