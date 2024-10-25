<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Manage Users</title>
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
            .add-bus-btn a{
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

                max-height: 400px; /* Set the max height for the table container */
                overflow-y: auto;  /* Enable vertical scrolling */
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
            .actions button a{
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <jsp:include page="sidebar.jsp"/>
            <main class="main-content">
                <header>
                    <h1>Manage Users</h1>
                    <a href="addUser.jsp" class="add-user-btn">+ Add User</a>
                </header>
                <hr>
                <input type="text" placeholder="Search user...">
                <hr>
                <section class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>User ID</th>
                                <th>Name</th>
                                <td>Email</td>
                                <th>Role</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="o" items="${listU}">
                                <tr>
                                    <td>${o.userId}</td>
                                    <td>${o.username}</td>
                                    <td>${o.email}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${o.role == '1'}">
                                                <span class="status active">Admin</span>
                                            </c:when>
                                            <c:when test="${o.role == '2'}">
                                                <span class="status inactive">User</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="status">Unknown Role</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="actions">
                                        <button class="action-btn edit"><a href="EditUser?userId=${o.userId}">✏ Edit</a></button>
                                        <button class="action-btn delete" onclick="confirmDelete(${o.userId})">🗑 Delete</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                </section>
            </main>
            <script>
        function confirmDelete(userId) {
            if (confirm("Are you sure you want to delete user with ID " + userId + "?")) {
                window.location.href = "DeleteUser?id=" + userId;
            } else {
            }
        }
    </script>
        </div>
    </body>
</html>
