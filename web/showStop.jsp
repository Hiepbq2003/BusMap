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

            .route-stops {
                background-color: #f9f9f9;
                padding: 2em;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .route-stops h2 {
                margin-top: 0;
            }

            .route {
                margin-bottom: 2em;
            }

            .route h3 {
                margin: 0;
                padding: 1em;
                background-color: #007bff;
                color: #fff;
                border-radius: 4px;
            }

            .direction {
                margin-top: 1em;
            }

            .direction h4 {
                margin: 0.5em 0;
                color: #007bff;
            }

            .stop-list {
                list-style: none;
                padding: 0;
                margin: 0;
            }

            .stop-list li {
                padding: 0.5em;
                border-bottom: 1px solid #ccc;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <jsp:include page="sidebar.jsp"/>
            <main class="main-content">
                <section class="route-stops">
                    <h2>Route Stops</h2>
                    <div class="route" id="route-130">
                        <h3>Route ${routeName}</h3>
                        <div class="direction">
                            <h4>Forward</h4>
                            <ul class="stop-list">
                                <c:forEach var="o" items="${lStopF}">
                                    <li>${o.stopName}</li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="direction">
                            <h4>Backward</h4>
                            <ul class="stop-list">
                                <c:forEach var="o" items="${lStopB}">
                                    <li>${o.stopName}</li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                    <!-- Add more routes as needed -->
                </section>
            </main>
        </div>
    </body>
</html>
