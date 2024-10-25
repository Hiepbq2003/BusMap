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
        <link rel="stylesheet" href="css/busmap.css">
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"
              integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY="
              crossorigin=""/>
        <script src="https://unpkg.com/leaflet-routing-machine/dist/leaflet-routing-machine.js"></script>
        <script src="js/busmap.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" 
              integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" 
              crossorigin="anonymous" referrerpolicy="no-referrer" />

        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script><link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    </head>
    <body>
        <c:set var="listS" value="${requestScope.listS}"></c:set>
        <jsp:include page="uHeader.jsp"></jsp:include>
            <div class="container">
                <div class="sidebar">
                    <div class="container1">
                        <div class="tabs">
                            <a href="RouteStop?routeId=${routeId}&routeName=${routeName}&direction=1" 
                           class="tab-link ${param.direction == '1' ? 'active' : 'inactive'}">Xem lượt đi</a>
                        <a href="RouteStop?routeId=${routeId}&routeName=${routeName}&direction=2" 
                           class="tab-link ${param.direction == '2' ? 'active' : 'inactive'}">Xem lượt về</a>
                    </div>
                    <h2 class="title"><a href="Busmap"><span></span>Tuyến số ${routeName}</a></h2>
                    <ul class="stops-list">
                        <c:forEach var="o" items="${listStops}">
                            <li>${o.stopName}</li>
                            </c:forEach>
                    </ul>
                </div>



            </div>
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

            busStops.forEach(function (stop) {
                var marker = L.marker([stop.lat, stop.lng]).addTo(map);
                marker.bindPopup(stop.stopName);
                marker.on('click', function () {
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
        <style>
            .tabs {
                display: flex;
            }

            .tab-link {
                padding: 10px 20px;
                text-decoration: none;
                color: #fff;
                border: 1px solid #ddd;
                border-radius: 5px;
                margin-right: 5px;
                transition: background-color 0.3s ease;
            }

            .tab-link.active {
                background-color: #3498db; 
                font-weight: bold;
            }

            .tab-link.inactive {
                background-color: #ccc;  
                color: #666; 
            }

            .tab-link:hover {
                background-color: #2980b9;
            }


            .container1 {
                display: flex;
                flex-direction: column;
                align-items: center;
                padding: 20px;
            }
            .title {
                font-size: 24px;
                font-weight: bold;
                margin-bottom: 20px;
            }
            .title a {
                margin-top: 1rem;
                text-decoration: none;
                color: #333;
            }
            .title a::before {
                content: "";
                display: inline-block;
                width: 24px;
                height: 24px;
                background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24'%3E%3Cpath d='M12 4l-8 8 8 8z'/%3E%3C/svg%3E");
                background-size: 24px 24px;
            }
            .title a {
                display: flex;
                align-items: center;
            }
            .stops-list {
                list-style: none;
                padding: 0;
                margin: 0;
                position: relative;
            }
            .stops-list li {
                margin-bottom: 10px;
                padding-left: 20px;
                position: relative;
            }
            .stops-list li:before {
                content: "•";
                position: absolute;
                left: 0;
                top: 50%;
                transform: translateY(-50%);
                font-size: 18px;
                color: #ccc;
            }
            .stops-list:before {
                content: "";
                position: absolute;
                left: 10px;
                top: 0;
                width: 2px;
                height: 100%;
                background-color: #ccc;
            }
        </style>
    </body>
</html>
