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
    <style>
        #info {
            float: left;
        }
        #map {
            margin-top: 8px;
            height: 90%;
            border-radius: 4px;
        }
        .center_div{
            margin-top: 45px;
            width: 30% /* value of your choice which suits your alignment */;
            text-align: center;
        }
        input[type=submit] {
            width: 30%;
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 2px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        textarea {
            width: 100%;
            height: 150px;
            padding: 6px 8px;
            box-sizing: border-box;
            border: 2px solid #ccc;
            border-radius: 4px;
            background-color: #f8f8f8;
            font-size: 16px;
            resize: none;
        }
        #info {
            border-radius: 5px;
            background-color: #f2f2f2;
            padding: 10px;
        }


    </style>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">

                <li><a href="/">Home</a></li>
                <li><a href="/listofsports">Sport List</a></li>
                <li><a href="/listevents">See Events</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="/logout">Logout</a></li>

            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>

<div class="center_div" id="info">
    <h3>Event Name: ${name}</h3>
    <h3>Sport: ${sport}</h3>
    <h3>Address: ${address}</h3>
    <h3>Time: ${time}</h3>
    <h3>Description:${description}</h3>
    <input type="number" id="lat" value="${latitude}">
    <input type="number" id="lng" value="${longitude}">
    <form action="updateform" method="post">
        <input type=hidden name="eventId" value="${eventId}">
        <br>
        <h3>People Going: ${peopleGoing}</h3>
        <input type="number" id="peopleGoing" name="peopleGoing" value="${peopleGoing}" placeholder="${peopleGoing}">
        <br>
        <input onclick="counter()" type="submit" value="I'm Coming">
    </form>
</div>
<div id="map"></div>
<script src="resources/updateeventform.js"></script>
</body>
</html>
