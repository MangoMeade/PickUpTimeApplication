<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <style>
        body {
            margin: 0;
            padding: 0;
        }

        #map {
            position: fixed;
            top: 0;
            bottom: 50%;
            width: 100%;
        }

        .marker{
            background-image: url('red-pin.png');
            background-size: cover;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            cursor: pointer;
        }

        .mapboxgl-popup {
            max-width: 200px;
        }

        .mapboxgl-popup-content {
            text-align: center;
            font-family: 'Open Sans', sans-serif;
        }
    </style>
</head>


<body>

<div id='map'></div>
<script>
    mapboxgl.accessToken = 'pk.eyJ1IjoibnNhbGVuaXVjIiwiYSI6ImNqNjJ2dHU0ejFhNnkzM3A4NnhreHp3djgifQ.Gx2JsOag2oHo_ZkcYOGy9A';
    var map = new mapboxgl.Map({
        container: 'map', // container id
        style: 'mapbox://styles/mapbox/streets-v9', // stylesheet location
        center: [-83.04, 42.33], // starting position [lng, lat]
        zoom: 9 // starting zoom
    });


    // Add geolocate control to the map.
    map.addControl(new mapboxgl.GeolocateControl({
        positionOptions: {
            enableHighAccuracy: true
        },
        trackUserLocation: true
    }));

    var geojson = {
        type: 'FeatureCollection',
        features: [{
            type: 'Feature',
            geometry: {
                type: 'Point',
                coordinates: [-83.176315, 42.322262]
            },
            properties: {
                title: 'Mapbox',
                description: 'Ford Field Dearborn, MI'
            }
        },
            {
                type: 'Feature',
                geometry: {
                    type: 'Point',
                    coordinates: [-122.414, 37.776]
                },
                properties: {
                    title: 'Mapbox',
                    description: 'San Francisco, California'
                }
            }]
    };
    //add markers to map
    geojson.features.forEach(function (marker) {

        // create a HTML element for each feature
        var el = document.createElement("div");
        el.className = "marker";

        // make a marker for each feature and add to the map
        new mapboxgl.Marker(el, {offset: [-50 / 2, -50 / 2]})
            .setLngLat(marker.geometry.coordinates)
            .addTo(map);
    });
</script>
<%--<ul>--%>
<%--<c:forEach items="${eventList}" var="num">--%>
<%--<li>${num}</li>--%>
<%--</c:forEach>--%>

<%--</ul>--%>
<%--${eventList}--%>
<%--</form>--%>
<%--</div>--%>
</body>
</html>
