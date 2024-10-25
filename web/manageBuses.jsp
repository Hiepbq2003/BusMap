<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Manage Buses</title>
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
        .add-bus-btn {
            background-color: #e74c3c;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .add-bus-btn a {
            text-decoration: none;
            color: white;
        }
        .add-bus-btn:hover {
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
            background: rgba(0, 0, 0, 0.5);
            display: none;
            justify-content: center;
            align-items: center;
        }
        /* Popup content */
        .popup-content {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            width: 400px;
        }
        .popup-content h2 {
            text-align: center;
        }
        .popup-content form {
            display: flex;
            flex-direction: column;
        }
        .popup-content form label, 
        .popup-content form input, 
        .popup-content form select, 
        .popup-content form button {
            margin: 10px 0;
            width: 100%;
        }
        .popup-content form button {
            padding: 10px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .popup-content form button:hover {
            background-color: #2980b9;
        }
        .close-btn {
            background: #e74c3c;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }
        .close-btn:hover {
            background: #c0392b;
        }
    </style>
</head>
<body>
    <div class="container">
        <jsp:include page="sidebar.jsp"/>
        <main class="main-content">
            <header>
                <h1>Manage Buses</h1>
                <button class="add-bus-btn"><a href="addBus.jsp">+ Add Bus</a></button>
            </header>
            <hr>
            <input type="text" placeholder="Search bus"/>
            <hr><!-- comment -->
            <section class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>Bus ID</th>
                            <th>Registration Plate</th>
                            <th>Model</th>
                            <th>Color</th>
                            <th>Number of Seats</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="o" items="${listB}">
                            <tr>
                                <td>${o.busId}</td>
                                <td>${o.plate}</td>
                                <td>${o.model}</td>
                                <td>${o.color}</td>
                                <td>${o.capacity}</td>
                                <td><span class="status active">Active</span></td>
                                <td class="actions">
                                    <button class="action-btn delete" onclick="showDeletePopup('${o.busId}')">🗑</button>
                                    <button class="action-btn edit" onclick="showEditPopup('${o.busId}', '${o.plate}', '${o.model}', '${o.color}', '${o.capacity}')">✏️</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </section>
        </main>
    </div>

    <!-- Edit Popup -->
    <div class="popup" id="editPopup">
        <div class="popup-content">
            <h2>Edit Bus</h2>
            <form id="editForm" action="EditBus" method="post">
                <input type="hidden" name="action" value="edit">
                <input type="hidden" id="editBusId" name="busId">
                
                <label for="editPlate">Registration Plate</label>
                <input type="text" id="editPlate" name="plate" required>
                
                <label for="editModel">Model</label>
                <input type="text" id="editModel" name="model" required>
                
                <label for="editColor">Color</label>
                <input type="text" id="editColor" name="color" required>
                
                <label for="editCapacity">Number of Seats</label>
                <input type="number" id="editCapacity" name="capacity" required>
                
                <button type="submit">Save Changes</button>
                <button type="button" class="close-btn" onclick="hideEditPopup()">Close</button>
            </form>
        </div>
    </div>

    <!-- Delete Confirmation Popup -->
    <div class="popup" id="deletePopup">
        <div class="popup-content">
            <h2>Confirm Delete</h2>
            <p>Are you sure you want to delete this bus?</p>
            <form id="deleteForm" action="DeleteBus" method="post">
                <input type="hidden" id="deleteBusId" name="busId">
                <button type="submit">Yes, Delete</button>
                <button type="button" class="close-btn" onclick="hideDeletePopup()">Cancel</button>
            </form>
        </div>
    </div>

    <script>
        function showEditPopup(busId, plate, model, color, capacity) {
            document.getElementById('editBusId').value = busId;
            document.getElementById('editPlate').value = plate;
            document.getElementById('editModel').value = model;
            document.getElementById('editColor').value = color;
            document.getElementById('editCapacity').value = capacity;
            document.getElementById('editPopup').style.display = 'flex';
        }
        
        function hideEditPopup() {
            document.getElementById('editPopup').style.display = 'none';
        }

        function showDeletePopup(busId) {
            document.getElementById('deleteBusId').value = busId;
            document.getElementById('deletePopup').style.display = 'flex';
        }

        function hideDeletePopup() {
            document.getElementById('deletePopup').style.display = 'none';
        }
    </script>
</body>
</html>
