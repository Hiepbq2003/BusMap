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
        <link rel="stylesheet" href="css/search.css">
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
        <jsp:include page="uHeader.jsp"></jsp:include>
        <div class="container">
            <aside class="sidebar">
                <nav>
                    <form class="search-form" action="search" method="post">
                        <div class="input-group">
                            <label for="start-point" class="icon-label"><img src="images/blue.png" style="size: 10px"></label>
                            <input type="text" id="start-point" placeholder="Chọn điểm bắt đầu" name="start" list="list-stops" required="">
                            <datalist id="list-stops">
                                <c:forEach var="stop" items="${listS}">
                                    <option value="${stop.stopName}" data-lat="${stop.latitude}" data-lng="${stop.longitude}">${stop.stopName}</option>
                                </c:forEach>
                            </datalist>
                        </div>
                        <button type="button" class="switch-btn" onclick="swapPoints()"><i class="fa-solid fa-repeat"></i></button>
                        <div class="input-group">
                            <label for="end-point" class="icon-label"><img src="images/red.png" style="size: 10px"></label>
                            <input type="text" id="end-point" placeholder="Chọn điểm kết thúc" name="end" list="list-stops" required="">
                            <datalist id="list-stops">
                                <c:forEach var="stop" items="${listS}">
                                    <option value="${stop.stopName}" data-lat="${stop.latitude}" data-lng="${stop.longitude}">${stop.stopName}</option>
                                </c:forEach>
                            </datalist>
                        </div>
                        <button type="submit" value="Search">Tìm kiếm</button><br/>
                    </form>
                    <div id="search-result"></div>
                </nav>
            </aside>
            <main class="main-content">
                <div id="map"></div>
            </main>
        </div>
        <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"
                integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo="
                crossorigin=""></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/leaflet.js"></script>
        <script src="https://www.mapquestapi.com/sdk/leaflet/v2.2/mq-map.js?key=S8d7L47mdyAG5nHG09dUnSPJjreUVPeC"></script>
        <script src="https://www.mapquestapi.com/sdk/leaflet/v2.2/mq-routing.js?key=S8d7L47mdyAG5nHG09dUnSPJjreUVPeC"></script>
        <script>
            var map = L.map('map').setView([21.02776440, 105.83415980], 13);
            L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
                maxZoom: 19,
                attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
            }).addTo(map);

            var busStops = [
                <%-- Adding bus stops from the server-side --%>
                <c:forEach var="stop" items="${listS}">
                    {stopName: '${stop.stopName}', lat: ${stop.latitude}, lng: ${stop.longitude}},
                </c:forEach>
            ];

            busStops.forEach(function(stop) {
                var marker = L.marker([stop.lat, stop.lng]).addTo(map);
                marker.bindPopup(stop.stopName);
                marker.on('click', function() {
                    marker.openPopup();
                });
            });

            function swapPoints() {
                let pointA = document.getElementById('start-point').value;
                let pointB = document.getElementById('end-point').value;
                document.getElementById('start-point').value = pointB;
                document.getElementById('end-point').value = pointA;

                var event = new Event('change');
                document.getElementById('start-point').dispatchEvent(event);
                document.getElementById('end-point').dispatchEvent(event);
            }

            var startPointMarker;
            var endPointMarker;

            document.getElementById('start-point').addEventListener('change', function () {
                updateMarker('start-point', 'blue');
            });

            document.getElementById('end-point').addEventListener('change', function () {
                updateMarker('end-point', 'red');
            });

            function updateMarker(pointId, color) {
                var point = document.getElementById(pointId).value;
                var options = document.querySelectorAll('#list-stops option');
                var lat, lng;
                options.forEach(option => {
                    if (option.value === point) {
                        lat = option.getAttribute('data-lat');
                        lng = option.getAttribute('data-lng');
                    }
                });
                if (lat && lng) {
                    if (pointId === 'start-point' && startPointMarker) {
                        map.removeLayer(startPointMarker);
                    } else if (pointId === 'end-point' && endPointMarker) {
                        map.removeLayer(endPointMarker);
                    }

                    var marker = L.marker([lat, lng], {icon: L.icon({iconUrl: 'images/' + color + '.png'})}).addTo(map);
                    marker.bindPopup(point).openPopup();

                    marker.on('click', function () {
                        marker.openPopup();
                    });

                    map.setView([lat, lng], 13);

                    if (pointId === 'start-point') {
                        startPointMarker = marker;
                    } else {
                        endPointMarker = marker;
                    }
                }
            }
        </script>
    </body>
</html>
