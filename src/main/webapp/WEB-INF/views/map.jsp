<%--
  Created by IntelliJ IDEA.
  User: Nathan Saleniuc
  Date: 8/7/2017
  Time: 9:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'/>
    <title></title>
    <meta name='viewport' content='initial-scale=1,maximum-scale=1,user-scalable=no'/>
    <script src='https://api.tiles.mapbox.com/mapbox-gl-js/v0.39.1/mapbox-gl.js'></script>
    <link href='https://api.tiles.mapbox.com/mapbox-gl-js/v0.39.1/mapbox-gl.css' rel='stylesheet'/>
    <%--<style>--%>
        <%--body {--%>
            <%--margin: 0;--%>
            <%--padding: 0;--%>
        <%--}--%>

        <%--#map {--%>
            <%--position: fixed;--%>
            <%--top: 0;--%>
            <%--bottom: 50%;--%>
            <%--width: 100%;--%>
        <%--}--%>
    <%--</style>--%>
</head>
${eventsEntityList}

<body>

<div id='map'></div>
<%--<script>--%>
    <%--mapboxgl.accessToken = 'pk.eyJ1IjoibnNhbGVuaXVjIiwiYSI6ImNqNjJ2dHU0ejFhNnkzM3A4NnhreHp3djgifQ.Gx2JsOag2oHo_ZkcYOGy9A';--%>
    <%--var map = new mapboxgl.Map({--%>
        <%--container: 'map', // container id--%>
        <%--style: 'mapbox://styles/mapbox/streets-v9', // stylesheet location--%>
        <%--center: [-74.50, 40], // starting position [lng, lat]--%>
        <%--zoom: 9 // starting zoom--%>
    <%--});--%>



    <%--// Add geolocate control to the map.--%>
    <%--map.addControl(new mapboxgl.GeolocateControl({--%>
        <%--positionOptions: {--%>
            <%--enableHighAccuracy: true--%>
        <%--},--%>
        <%--trackUserLocation: true--%>
    <%--}));--%>

    <%--map.addControl(new MapboxGeocoder({--%>
        <%--accessToken: mapboxgl.accessToken--%>
    <%--}));--%>
<%--</script>--%>

</body>
</html>
