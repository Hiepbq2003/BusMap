<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Routes</title>
        <style>
            body, html {
                margin: 0;
                padding: 0;
                font-family: Arial, sans-serif;
            }
            .container {
                display: flex;
            }
            .main-content {
                flex: 1;
                padding: 20px;
                background-color: #ecf0f1;
            }
            header {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
            .add-route-btn {
                background-color: #e74c3c;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            .add-route-btn:hover {
                background-color: #c0392b;
            }
            .table-container {
                background-color: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                max-height: 400px;
                overflow-y: auto;
            }
            table {
                width: 100%;
                border-collapse: collapse;
            }
            table thead {
                background-color: #f4f6f8;
            }
            table th, table td {
                padding: 15px;
                text-align: left;
            }
            table th {
                font-weight: bold;
            }
            table tbody tr:nth-child(even) {
                background-color: #f4f6f8;
            }
            .status {
                padding: 5px 10px;
                border-radius: 5px;
                color: white;
                font-weight: bold;
            }
            .status.active {
                background-color: #2ecc71;
            }
            .status.inactive {
                background-color: #e74c3c;
            }
            .actions {
                display: flex;
                gap: 10px;
            }
            .action-btn {
                border: none;
                background: none;
                cursor: pointer;
                font-size: 18px;
            }
            .action-btn.delete {
                color: #e74c3c;
            }
            .action-btn.edit {
                color: #f39c12;
            }
            .action-btn:hover {
                opacity: 0.7;
            }
            .actions button a {
                text-decoration: none;
            }
            /* Popup container */
            .popup {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                display: none;
                justify-content: center;
                align-items: center;
            }
            /* Popup content */
            .popup-content {
                background-color: #ecf0f1;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                max-width: 600px;
                width: 100%;
            }
            .popup h2 {
                text-align: center;
            }
            .popup form {
                display: flex;
                flex-direction: column;
            }
            .popup label, .popup input, .popup select, .popup button {
                margin: 10px 0;
            }
            .popup button {
                padding: 10px;
                background-color: #3498db;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            .popup button:hover {
                background-color: #2980b9;
            }
            .close-btn {
                background-color: #e74c3c;
                color: white;
                padding: 5px 10px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                position: absolute;
                top: 10px;
                right: 10px;
            }
            .close-btn:hover {
                background-color: #c0392b;
            }
        </style>
        <script>
            function openPopup() {
                document.getElementById('popup').style.display = 'flex';
            }

            function closePopup() {
                document.getElementById('popup').style.display = 'none';
            }

            function openEditPopup(routeId, routeName, routeNumber, fare, frequency, startTime, endTime) {
                document.getElementById('editRouteId').value = routeId;
                document.getElementById('editRouteName').value = routeName;
                document.getElementById('editRouteNumber').value = routeNumber;
                document.getElementById('editFare').value = fare;
                document.getElementById('editFrequency').value = frequency;
                document.getElementById('editStartTime').value = startTime;
                document.getElementById('editEndTime').value = endTime;
                document.getElementById('editPopup').style.display = 'flex';
            }

            function closeEditPopup() {
                document.getElementById('editPopup').style.display = 'none';
            }

            function openDeletePopup(routeId) {
                document.getElementById('deleteRouteId').value = routeId;
                document.getElementById('deletePopup').style.display = 'flex';
            }

            function closeDeletePopup() {
                document.getElementById('deletePopup').style.display = 'none';
            }
        </script>
    </head>
    <body>
        <div class="container">
            <jsp:include page="sidebar.jsp"/>
            <main class="main-content">
                <header>
                    <h1>Manage Routes</h1>
                    <button class="add-route-btn" onclick="openPopup()">+ Add Route</button>
                </header>
                <hr>
                <input type="text" id="searchInput" onkeyup="searchRoutes()" placeholder="Search for routes..">
                <hr>
                <section class="table-container">
                    <table id="routesTable">
                        <thead>
                            <tr>
                                <th>Route No.</th>
                                <th>Route Name</th>
                                <th>Route Number</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="o" items="${listR}">
                                <tr>
                                    <td>${o.routeId}</td>
                                    <td><a href="DetailRoute?id=${o.routeId}&routeName=${o.routeNumber}">${o.getRouteName()}</a></td>
                                    <td>${o.routeNumber}</td>
                                    <td><span class="status active">Active</span></td>
                                    <td class="actions">
                                        <button class="action-btn delete" onclick="openDeletePopup('${o.routeId}')"><a href="#">🗑</a></button>
                                        <button class="action-btn edit" onclick="openEditPopup('${o.routeId}', '${o.getRouteName()}', '${o.routeNumber}', '${o.fare}', '${o.frequency}', '${o.startTime}', '${o.endTime}')"><a href="#">✏️</a></button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </section>
            </main>
        </div>

        <!-- Popup for adding route -->
        <div class="popup" id="popup">
            <div class="popup-content">
                <button class="close-btn" onclick="closePopup()">X</button>
                <h2>Add Route</h2>
                <form action="AddNewRoute" method="post">
                    <label for="routeName">Route Name</label>
                    <input type="text" id="routeName" name="routeName" required>

                    <label for="routeNumber">Route Number</label>
                    <input type="text" id="routeNumber" name="routeNumber" required>

                    <label for="fare">Fare</label>
                    <input type="number" id="fare" name="fare" required>

                    <label for="time">Frequency</label>
                    <input type="time" id="stop" name="frequency" required>

                    <label for="startTime">Start Time</label>
                    <input type="time" id="startTime" name="startTime" required>

                    <label for="endTime">End Time</label>
                    <input type="time" id="endTime" name="endTime" required>
                    <button type="submit">Add Route</button>
                </form>
            </div>
        </div>

        <!-- Popup for editing route -->
        <div class="popup" id="editPopup">
            <div class="popup-content">
                <button class="close-btn" onclick="closeEditPopup()">X</button>
                <h2>Edit Route</h2>
                <form action="EditRoute" method="post">
                    <input type="hidden" id="editRouteId" name="routeId">
                    <label for="editRouteName">Route Name</label>
                    <input type="text" id="editRouteName" name="routeName" required>

                    <label for="editRouteNumber">Route Number</label>
                    <input type="text" id="editRouteNumber" name="routeNumber" required>

                    <label for="editFare">Fare</label>
                    <input type="number" id="editFare" name="fare" required>

                    <label for="editFrequency">Frequency</label>
                    <input type="time" id="editFrequency" name="frequency" required>

                    <label for="editStartTime">Start Time</label>
                    <input type="time" id="editStartTime" name="startTime" required>

                    <label for="editEndTime">End Time</label>
                    <input type="time" id="editEndTime" name="endTime" required>
                    <button type="submit">Save Changes</button>
                </form>
            </div>
        </div>

        <!-- Popup for deleting route -->
        <div class="popup" id="deletePopup">
            <div class="popup-content">
                <button class="close-btn" onclick="closeDeletePopup()">X</button>
                <h2>Delete Route</h2>
                <p>Are you sure you want to delete this route?</p>
                <form action="DeleteRoute" method="post">
                    <input type="hidden" id="deleteRouteId" name="routeId">
                    <button type="submit">Delete Route</button>
                </form>
            </div>
        </div>

    </body>
</html>
