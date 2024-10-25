<%-- 
    Document   : home
    Created on : 3 Jul 2024, 21:03:52
    Author     : olymp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home Page</title>
        <link rel="stylesheet" href="/css/home.css">
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"
              integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY="
              crossorigin=""/>
        <script src="https://unpkg.com/leaflet-routing-machine/dist/leaflet-routing-machine.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" 
              integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" 
              crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <c:set var="listS" value="${requestScope.listS}"></c:set>
        <header>
            <img src="images/logo.png" class="logo" alt="Logo"> 
            <ul>
                <li><a href="#">Home</a></li>
                <li><a href="#">Routes</a></li>
                <li><a href="#">Stops</a></li>
                <li><a href="#">Map</a></li>
                <li><a href="#">Contact</a></li>
            </ul>
        </header>
        <div class="container">
            <aside class="sidebar">
                <nav>
                    <form class="search-form">
                        <div class="input-group">
                            <label for="start-point" class="icon-label"><i class="fa-solid fa-location-dot" style="color: #04f500;"></i></label>
                            <input type="text" id="start-point" placeholder="Chọn điểm xuất phát">
                        </div>
                        <button type="button" class="switch-btn"><i class="fa-solid fa-repeat"></i></button>
                        <div class="input-group">
                            <label for="end-point" class="icon-label"><i class="fa-solid fa-location-dot" style="color: #f7020f;"></i></label>
                            <input type="text" id="end-point" placeholder="Chọn điểm kết thúc">
                        </div>
                        <div class="route-max">
                            <span>Số tuyến đi tối đa</span>
                            <label class="switch">
                                <input type="checkbox" checked>
                                <span class="slider round"></span>
                                <span class="switch-text">Tuyến hoạt động</span>
                            </label>
                        </div>
                        <div class="route-options">
                            <button type="button">1 Tuyến</button>
                            <button type="button" class="active">2 Tuyến</button>
                            <button type="button">3 Tuyến</button>
                        </div>
                    </form>
                </nav>
            </aside>
            <main class="main-content">
                <div id="map"></div>
            </main>
        </div>
        <script src="script.js"></script>
        <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"
                integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo="
        crossorigin=""></script>
        <script>
            var map = L.map('map').setView([21.02776440, 105.83415980], 13);

            L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
                maxZoom: 19,
                attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
            }).addTo(map);



        </script>
    </body>
</html>



