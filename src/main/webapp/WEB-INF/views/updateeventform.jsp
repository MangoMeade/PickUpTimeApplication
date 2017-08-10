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
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="resources/updateeventform.css">
    <script src="resources/updateeventform.js"></script>
    <script async defer
            src="https://maps.googleapis.com/maps/api/js?callback=initMap">
    </script>
</head>
<body>


<h1>${name}</h1>
<h2>${sport}</h2>
<h2>${address}</h2>
<br>
<h2>${latitude}</h2>
<h2>${longitude}</h2>
<input type="number" id="latitude" value="${latitude}">
<input type="number" id="longitude" value="${longitude}">
<form action="updateform" method="post">
    <input type=hidden name="eventId" value="${eventId}">
    <br>
    People Going: ${peopleGoing}
    <input type="number" id="peopleGoing" name="peopleGoing" value = "${peopleGoing}" placeholder="${peopleGoing}">
    <br>
    <%--<input type="hidden" name="minNeeded" value="${minNeeded}">--%>
    <input onclick="counter()" type="submit" value="I'm Coming">
</form>
<div id="map" height="460px" width="100%"></div>
</body>
</html>
