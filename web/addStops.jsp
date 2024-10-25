<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : addBuses
    Created on : 13 Jul 2024, 22:59:19
    Author     : olymp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                text-align: right;
                padding: 1em 0;
            }

            .add-route {
                background-color: #f9f9f9;
                padding: 2em;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .add-route h2 {
                margin-top: 0;
            }

            .form-group {
                margin-bottom: 1em;
            }

            .form-group label {
                display: block;
                margin-bottom: 0.5em;
            }

            .form-group input,
            .form-group select {
                width: 100%;
                padding: 0.5em;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            button {
                padding: 0.5em 1em;
                border: none;
                border-radius: 4px;
                margin-right: 0.5em;
            }

            button[type="submit"] {
                background-color: #28a745;
                color: #fff;
            }

            button[type="button"] {
                background-color: #dc3545;
                color: #fff;
            }
        </style>

    </head>
    <body>
        <div class="container">
            <jsp:include page="sidebar.jsp"/>
            <main class="main-content">
                <header>
                    <h1>Add Stop</h1>
                </header>
                <hr>
                <section class="add-route">
                    <h2>Add Stop</h2>
                    <form action="AddStop" method="POST" id="route-form">
                        <div class="form-group">
                            <label for="route-number">Route Number</label>

                            <select id="route-number" name="number">
                                <c:forEach var="o" items="${listR}">
                                    <option value="${o.routeId}">${o.getRouteName()}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="direction">Direction</label>
                            <select id="direction" name="direction">
                                <option value="Forward">Forward</option>
                                <option value="Backward">Backward</option>
                            </select>
                        </div>
                        <div id="stops-container" class="form-group">
                            <label for="stop-name">Stop Name</label>
                            <input type="text" id="stop-name" name="stop">
                        </div>
                        <button type="submit">Add</button>
                        <button type="button">Cancel</button>
                    </form>
                </section>
            </main>
        </div>
        <script src="js/script2.js"></script>
    </body>
</html>
