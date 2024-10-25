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
                    <div class="tabs">
                        <button class="tab-button active" onclick="openTab('search')">TRA CỨU</button>
                        <button class="tab-button" onclick="openTab('route')">TÌM ĐƯỜNG</button>
                    </div>

                    <div id="search" class="tab-content active">
                        <input type="text" id="routeSearchInput" style="background-color: white" placeholder="Tìm tuyến xe">
                        <div id="routeList">
                        <c:forEach var="o" items="${listR}">
                            <div class="route-card">
                                <div class="route-info">
                                    <a href="RouteStop?routeId=${o.routeId}&routeName=${o.routeNumber}&direction=1">
                                        <div class="route-number">Tuyến số ${o.routeNumber}</div>
                                    </a>
                                    <div class="route-details">${o.routeName}</div>
                                    <div class="route-time">${o.startTime} - ${o.endTime}</div>
                                    <div class="route-price">${o.fare} VNĐ</div>
                                </div>
                            </div>

                        </c:forEach>
                    </div>
                </div>

                <script>
                    document.getElementById('routeSearchInput').addEventListener('input', function () {
                        var searchValue = this.value.toLowerCase();
                        var routeCards = document.querySelectorAll('#routeList .route-card');

                        routeCards.forEach(function (card) {
                            var routeNumber = card.querySelector('.route-number').textContent.toLowerCase();
                            var routeDetails = card.querySelector('.route-details').textContent.toLowerCase();
                            if (routeNumber.includes(searchValue) || routeDetails.includes(searchValue)) {
                                card.style.display = '';
                            } else {
                                card.style.display = 'none';
                            }
                        });
                    });
                </script>


                <div id="route" class="tab-content">
                    <div class="search-bar">
                        <label for="from">Từ:</label>
                        <select id="from" name="from">
                            <option></option> 
                        </select>
                        <label for="to" style="margin-top: 1rem">Đến:</label>
                        <select id="to" name="to">
                            <option></option> 
                        </select>
                        <button type="button" style="margin-top: 2rem" onclick="findRoute()">Tìm đường</button>
                    </div>
                    <div id="routeList2"></div>

                </div>

                <script>
                    $(document).ready(function () {
                        function formatStop(stop) {
                            if (stop.loading) {
                                return stop.text;
                            }
                            return stop.text;
                        }

                        $('#from').select2({
                            placeholder: 'Chọn trạm điểm xuất phát',
                            allowClear: true,
                            ajax: {
                                url: 'SearchStop',
                                dataType: 'json',
                                delay: 250,
                                data: function (params) {
                                    return {
                                        query: params.term
                                    };
                                },
                                processResults: function (data) {
                                    return {
                                        results: data.map(function (item) {
                                            return {
                                                id: item.stopId,
                                                text: item.stopName
                                            };
                                        })
                                    };
                                },
                                cache: true
                            },
                            templateResult: formatStop,
                            templateSelection: formatStop
                        });

                        $('#to').select2({
                            placeholder: 'Chọn trạm điểm đến',
                            allowClear: true,
                            ajax: {
                                url: 'SearchStop',
                                dataType: 'json',
                                delay: 250,
                                data: function (params) {
                                    return {
                                        query: params.term
                                    };
                                },
                                processResults: function (data) {
                                    return {
                                        results: data.map(function (item) {
                                            return {
                                                id: item.stopId,
                                                text: item.stopName
                                            };
                                        })
                                    };
                                },
                                cache: true
                            },
                            templateResult: formatStop,
                            templateSelection: formatStop
                        });
                    });

                    function formatTime(timeString) {
                        if (timeString) {
                            var parts = timeString.split(':');
                            var formattedTime = parts[0] + ':' + parts[1];
                            return formattedTime;
                        }
                        return '';
                    }


                    function findRoute() {
                        var from = $('#from').val();
                        var to = $('#to').val();
                        var routeListDiv = $('#routeList2');

                        if (from && to) {
                            $.ajax({
                                url: 'GetRoutes',
                                type: 'GET',
                                data: {from: from, to: to},
                                success: function (data) {
                                    routeListDiv.empty();
                                    if (data.length > 0) {
                                        var html = '<div id="routeList2">';
                                        data.forEach(function (route) {
                                            console.log(route);
                                            html += '<div class="route-card">';
                                            html += '<div class="route-info">';
                                            html += '<a href="RouteStop?routeId=' + route.routeId + '&routeName=' + route.routeNumber + '&direction=1"> <div class="route-number">Tuyến số ' + route.routeNumber + '</div> </a>';
                                            html += '<div class="route-details">' + route.routeName + '</d>';
                                            html += '<div class="route-details">' + formatTime(route.startTime) + ' - ' + formatTime(route.endTime) + '</div>';
                                            html += '<div class="route-price">' + route.fare + ' VNĐ</div>';
                                            html += '</div></div>';
                                        });
                                        html += '</div>';
                                        routeListDiv.html(html);
                                    } else {
                                        routeListDiv.html('<p>Không tìm thấy tuyến xe phù hợp.</p>');
                                    }
                                },
                                error: function () {
                                    routeListDiv.html('<p>Có lỗi xảy ra khi lấy danh sách tuyến xe.</p>');
                                }
                            });
                        } else {
                            alert('Vui lòng chọn trạm dừng.');
                        }
                    }

                </script>


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

    </body>
</html>
