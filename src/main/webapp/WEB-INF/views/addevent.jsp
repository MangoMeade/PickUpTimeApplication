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
    <title>Add Event</title>
    <%--<script>--%>
    <%--function myFunction() {--%>
    <%--var x = document.createElement("INPUT");--%>
    <%--x.setAttribute("type", "time");--%>
    <%--x.setAttribute("value", "24:00:00");--%>
    <%--document.body.appendChild(x);--%>
    <%--}--%>
    <%--</script>--%>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="resources/addpin.css">
    <script src="resources/addpin.js"></script>
    <script async defer
            src="https://maps.googleapis.com/maps/api/js?callback=initMap">
    </script>
</head>
<body>

Add a new event:
<br>


<div id="form" class="overlay">
    <form action= "/addeventsuccess" method="post">
        <p>
            Name : <input type = "text" name="name" required>
            <br>
            <select name="sport">
                <option value="Soccer">Soccer</option>
            </select>
            <br>
            Address: <input type = "text" name="address" required>
            <br>
            Time:  <input type="time" name="time" placeholder="hrs:mins" pattern="[0-9]{4}-[0-1][0-9]-[0-3][0-9] (1[012]|0[1-9]):[0-5][0-9] (am|pm|AM|PM)"required>
            <br>
            Date: <input type="date" name="day">
            <br>
            Description: <input type="text" name="description">
            <br>
            Amount of people Needed: <input type = "text" name="min" value = "0" required>
            <input type = "text" name="peopleGoing" value = "0" required>
            <br>
            <input id="lat" name="lat" type="textbox" required/>
            <input  id="lng" name="lng" type="textbox" required/>
            <input type = "submit" value = "Add Event" > </p>
    </form>
</div>
<form action="/listofsports">
    <input type= "submit" value="Back to Sports">
</form>
<div id="map" height="460px" width="100%"></div>
</body>
</html>