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
            
        </div>
        
    </body>
</html>



