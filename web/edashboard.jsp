<%-- 
    Document   : dashboard
    Created on : 13 Jul 2024, 21:23:15
    Author     : olymp
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .cards {
                display: flex;
                justify-content: space-around;
                margin: 20px 0;
            }

            .card {
                background-color: white;
                padding: 20px;
                border-radius: 10px;
                text-align: center;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                width: 23%;
            }

            .chart {
                background-color: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                height: 300px;
                display: flex;
            }
            .chart .bus,.route{
                width: 100%;
            }

        </style>
    </head>
    <body>
        <div class="container">
            <jsp:include page="emp.jsp"/>
            <main class="main-content">
                <header>
                    <c:if test="${sessionScope['LOGIN_USER']!=null}">
                        <h1>Hi, ${sessionScope['LOGIN_USER'].username} </h1>
                    </c:if>
                </header>
                <section class="cards">
                    <div class="card">
                        <h2>Buses</h2>
                        <p>${numBus} Total</p>
                    </div>
                    <div class="card">
                        <h2>Routes</h2>
                        <p>${numRoute} Total</p>
                    </div>
                </section>
                <section class="chart">
                    <div class="bus">
                        <canvas id="busChart"></canvas>
                    </div>
                    <div class="route">
                        <canvas id="routeChart"></canvas>
                    </div>
                    
                </section>
            </main>
        </div>
        <script src="js/scripts.js"></script>
    </body>
</html>
