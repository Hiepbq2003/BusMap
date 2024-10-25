<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Edit User</title>
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
            .form-container {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .form-container h2 {
                margin-top: 0;
            }
            .form-group {
                margin-bottom: 15px;
            }
            .form-group label {
                display: block;
                margin-bottom: 5px;
            }
            .form-group input {
                width: 100%;
                padding: 8px;
                box-sizing: border-box;
            }
            .form-buttons {
                display: flex;
                justify-content: flex-end;
            }
            .form-buttons button {
                padding: 10px 20px;
                margin-left: 10px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            .form-buttons .cancel-btn {
                background-color: #e74c3c;
                color: #fff;
            }
            .form-buttons .update-btn {
                background-color: #2ecc71;
                color: #fff;
            }
        </style>
    </head>
    <body>
                <div class="container">
                    <jsp:include page="sidebar.jsp"/>
                    <main class="main-content">
                        <header>
                            <h1>Update User</h1>
                        </header>
                        <hr>
                        <section class="form-container">
                            <h2>update User</h2>
                            <form action="EditUser" method="POST">
                                <div class="form-group">
                                    <label for="bus-id">User ID</label>
                                    <input type="text" id="bus-id" name="userId" readonly required value="${u.userId}">
                                </div>
                                <div class="form-group">
                                    <label for="registration-plate">Name user</label>
                                    <input type="text" id="registration-plate" readonly name="username" required value="${u.username}">
                                </div>
                                <div class="form-group">
                                    <label for="registration-plate">Email</label>
                                    <input type="text" id="registration-plate" name="email" required value="${u.email}">
                                </div>
                                <div class="form-group">
                                    <label for="model">Password</label>
                                    <input type="text" id="model" name="password" required value="${u.password}">
                                </div>
                                <div class="form-group">
                                    <label for="bus-color">Role</label>
                                    <input type="text" id="bus-color" name="role" required value="${u.role}">
                                </div>
                                <div class="form-buttons">
                                    <button type="button" class="cancel-btn">Cancel</button>
                                    <button type="submit" class="update-btn">Update</button>
                                </div>
                            </form>
                        </section>
                    </main>
        </div>
    </body>
</html>
