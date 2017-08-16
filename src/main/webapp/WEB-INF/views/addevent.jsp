<%--
  Created by IntelliJ IDEA.
  User: michelhayman
  Date: 8/8/17
  Time: 1:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <%--if using Internet Explorer use the latest rendering--%>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <%--*IMPORTANT*: sets the page to width of the device and sets the zoom level (Ex. tablet, mobile, web)--%>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
          integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <title>Add Event</title>
    <%--<script>--%>
    <%--function myFunction() {--%>
    <%--var x = document.createElement("INPUT");--%>
    <%--x.setAttribute("type", "time");--%>
    <%--x.setAttribute("value", "24:00:00");--%>
    <%--document.body.appendChild(x);--%>
    <%--}--%>
    <%--</script>--%>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no"/>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="resources/addpin.css">
    <style>
        .center_div {
            margin: 0 auto;
            width: 30% /* value of your choice which suits your alignment */
        }
    </style>
</head>
<body>

<div class="container center_div">


    <form class="form-signin" method="post" action="/addeventsuccess">
        <h2 class="form-signin-heading">Add new event.</h2>
        <label for="eventName" class="sr-only">Event Name</label>
        <input type="text" name="name" id="eventName" class="form-control" placeholder="Event Name" required>
        <label for="sport" class="sr-only">Sport</label>
        <select name="sport" id="sport" class="form-control" required>
            <option class="form-control">Please choose a sport</option>
            <option value="Soccer">Soccer</option>
            <option value="Basketball">Basketball</option>
            <option value="Baseball">Baseball</option>
            <option value="Volleyball">Volleyball</option>
        </select>
            <label for="address" class="sr-only">Address</label>
            <input type="text" name="address" id="address" class="form-control" placeholder="Address"
                   required>
            <label for="time" class="sr-only">Time</label>
            <input type="time" name="password" id="time" class="form-control" placeholder="hrs:mins"
                   pattern="[0-9]{4}-[0-1][0-9]-[0-3][0-9] (1[012]|0[1-9]):[0-5][0-9] (am|pm|AM|PM)" required>
            <label for="date" class="sr-only">Date</label>
            <input type="date" name="date" id="date" class="form-control" placeholder="Date" required>
            <label for="description" class="sr-only">Description</label>
            <input type="text" name="description" id="description" class="form-control" placeholder="Description"
                   required>
            <label for="playersRequired" class="sr-only">Number of players required</label>
            <input type="text" name="min" id="playersRequired" class="form-control"
                   placeholder="Number of players required" required>
        </select>
    </form>
    <form method="post" action="/addeventsuccess">
        <button class="btn btn-lg btn-primary btn-block" type="submit">Add event</button>
    </form>
</div>



<%--<div id="form" class="overlay">--%>
    <%--<!-- Changed /addeventsuccess to /listevents -->--%>
    <%--<form action="/addeventsuccess" method="post">--%>
        <%--<p>--%>
            <%--Name : <input type="text" name="name" required>--%>
            <%--<br>--%>
            <%--<select name="sport">--%>
                <%--<option value="soccer">Soccer</option>--%>
                <%--<option value="basketball">Basketball</option>--%>
                <%--<option value="football">Football</option>--%>
                <%--<option value="baseball">Baseball</option>--%>
                <%--<option value="volleyball">Volleyball</option>--%>
            <%--</select>--%>
            <%--<br>--%>
            <%--Address: <input type="text" name="address" required>--%>
            <%--<br>--%>

            <%--Time: <input type="time" name="time" placeholder="hrs:mins"--%>
                         <%--pattern="[0-9]{4}-[0-1][0-9]-[0-3][0-9] (1[012]|0[1-9]):[0-5][0-9] (am|pm|AM|PM)" required>--%>

            <%--<br>--%>
            <%--Date: <input id="date" type="date" name="day">--%>
            <%--<br>--%>
            <%--Description: <input type="text" name="description">--%>
            <%--<br>--%>
            <%--Amount of people Needed: <input type="text" name="min" value="0" required>--%>
            <%--<br>--%>

            <%--<input type="text" id="peopleGoing" name="peopleGoing" value="0" required>--%>

            <%--<input id="lat" name="lat" type="textbox" required/>--%>
            <%--<input id="lng" name="lng" type="textbox" required/>--%>

            <%--<input type="submit" value="Add Event">--%>
        <%--</p>--%>
    <%--</form>--%>
    <h2>Click on the map where your event will take place</h2>
</div>
<form action="/listofsports">
    <input type="submit" value="Back to Sports">
</form>
<div id="map" height="460px" width="100%"></div>
<script src="resources/addpin.js"></script>
<script async defer
        src="https://maps.googleapis.com/maps/api/js?callback=initMap">
</script>
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
</body>
</html>