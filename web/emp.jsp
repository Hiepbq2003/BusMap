

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dashboard</title>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <style>
            .sidebar {
                width: 250px;
                background-color: #2c3e50;
                color: white;
                height: 100vh;
            }

            .logo {
                text-align: center;
                padding: 20px 0;
            }

            .logo img{
                width:50px;
            }

            .nav-links {
                list-style: none;
                padding: 0;
            }

            .nav-links li {
                padding: 20px;
                text-align: center;
            }

            .nav-links a {
                text-decoration: none;
                color: white;
                display: block;
            }

            .nav-links a:hover {
                background-color: #34495e;
            }

        </style>
    </head>
    <body>
        <nav class="sidebar">
            <div class="logo">
                <img src="images/logo.png" alt="Logo">
            </div>
            <ul class="nav-links">
                <li><a href="eDashboard">Dashboard</a></li>
                <li><a href="eListBus">Manage Buses</a></li>
                <li><a href="eListRoute">Manage Routes</a></li>
                    <c:if test="${sessionScope['LOGIN_USER']!=null}">
                    <li><a href="logout">Log out</a></li>
                    </c:if>

            </ul>
        </nav>

    </body>
</html>
