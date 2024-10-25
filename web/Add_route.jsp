<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Route</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #ecf0f1;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label, input, select, button {
            margin: 10px 0;
        }
        button {
            padding: 10px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Add Route</h2>
    <form action="RouteServlet" method="post">
        <input type="hidden" name="action" value="add">
        <label for="routeNo">Route No.</label>
        <input type="text" id="routeNo" name="routeNo" required>

        <label for="routeName">Route Name</label>
        <input type="text" id="routeName" name="routeName" required>

        <label for="bus">Bus</label>
        <input type="text" id="bus" name="bus" required>

        <label for="stop">Stop</label>
        <input type="text" id="stop" name="stop" required>

        <label for="status">Status</label>
        <select id="status" name="status" required>
            <option value="Active">Active</option>
            <option value="Inactive">Inactive</option>
        </select>

        <button type="submit">Add Route</button>
    </form>
</div>
</body>
</html>
