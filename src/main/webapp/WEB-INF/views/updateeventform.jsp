<%--
  Created by IntelliJ IDEA.
  User: aibar
  Date: 8/7/2017
  Time: 4:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="resources/updateeventform.js"></script>
    <link href="resources/updateeventform.css" rel='stylesheet'>
    <title>Event to Edit</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no"/>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script async defer
            src="https://maps.googleapis.com/maps/api/js?callback=initMap">
    </script>
</head>
<body>
<div class="info">
    <h3>Event Name: ${name}</h3>
    <h3>Sport: ${sport}</h3>
    <h3>Address: ${address}</h3>
    <h3>Time: ${time}</h3>
    <h3>${description}</h3>
    <input type="number" id="latitude" value="${latitude}">
    <input type="number" id="longitude" value="${longitude}">
    <form action="/confirmation" method="post">
        <input type=hidden name="eventId" value="${eventId}">
        <br>
        People Going: ${peopleGoing}
        <input type="number" id="peopleGoing" name="peopleGoing" value="${peopleGoing}" placeholder="${peopleGoing}">
        <br>
        <%--<input type="hidden" name="minNeeded" value="${minNeeded}">--%>
        <input onclick="counter()" type="submit" value="I'm Coming">
    </form>
</div>
<div id="map" height="460px" width="100%"></div>
</body>
</html>
