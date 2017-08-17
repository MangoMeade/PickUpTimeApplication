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
    <%--if using Internet Explorer use the latest rendering--%>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <%--*IMPORTANT*: sets the page to width of the device and sets the zoom level (Ex. tablet, mobile, web)--%>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Pickup Time</title>

    <!-- Bootstrap -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no"/>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="resources/addpin.css">
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

    <style type="text/css">
        .overlay {

        }

        .center_div {
            margin-top: 45px;
            width: 30% /* value of your choice which suits your alignment */
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

        input[type=text], select {
            width: 100%;
            padding: 6px 8px;
            margin: 3px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type=date], select {
            width: 100%;
            padding: 6px 8px;
            margin: 3px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type=time], select {
            width: 100%;
            padding: 6px 8px;
            margin: 3px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type=submit] {
            width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 2px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type=submit]:hover {
            background-color: #45a049;
        }

        #form {
            border-radius: 5px;
            background-color: #f2f2f2;
            padding: 10px;
        }

        #form {
            float: left;
        }

        #head {
            width: 100%;
        }

        #map {
            /*margin-top: 40px;*/
            height: 90%;
            border-radius: 4px;
        }

        #h2 {
        }
    </style>


</head>
<body>

<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
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
<br>

<div class="container-fluid">
<div id="form" class="center_div">
    <h2 id="head">Add a new event.</h2>
    <!-- Changed /addeventsuccess to /listevents -->
    <form action="/addeventsuccess" method="get" novalidate>
        <p>
            <%--<h2>Add a new event.</h2>--%>
            <input type="text" name="name" placeholder="Name" required>
            <select name="sport">
                <option>Please choose a sport</option>
                <option value="soccer">Soccer</option>
                <option value="basketball">Basketball</option>
                <option value="football">Football</option>
                <option value="baseball">Baseball</option>
                <option value="volleyball">Volleyball</option>
            </select>
            <input type="text" name="address" placeholder="Address" required>
            <input type="time" name="time" placeholder="hrs:mins"
                   pattern="[0-9]{4}-[0-1][0-9]-[0-3][0-9] (1[012]|0[1-9]):[0-5][0-9] (am|pm|AM|PM)" required>
            <input id="date" type="date" name="day" placeholder="Date" required>
            <input type="text" name="description" placeholder="Description">
            Amount of people Needed: <input type="text" name="min" value="0" required>
            <br>
            <input type="text" id="peopleGoing" name="peopleGoing" value="0" required>
        <h4>Click on map to choose location</h4>
        <input id="lat" name="lat" type="textbox" required/>
        <input id="lng" name="lng" type="textbox" required/>

        <input type="submit" value="Add Event">

        </p>
    </form>
    <form action="/listofsports">
        <input type="submit" value="Back to Sports">
    </form>


</div>
<%--<h2 id="h2">Click on the map where your event will take place</h2>--%>
<br>

<div id="map" height="100%" width="50%"></div>
</div>
<script src="resources/addpin.js"></script>
<script async defer
        src="https://maps.googleapis.com/maps/api/js?callback=initMap">
</script>
</body>
</html>
<%--&lt;%&ndash;--%>
<%--Created by IntelliJ IDEA.--%>
<%--User: michelhayman--%>
<%--Date: 8/8/17--%>
<%--Time: 1:44 PM--%>
<%--To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--<meta charset="utf-8">--%>
<%--&lt;%&ndash;if using Internet Explorer use the latest rendering&ndash;%&gt;--%>
<%--<meta http-equiv="X-UA-Compatible" content="IE=edge">--%>

<%--&lt;%&ndash;*IMPORTANT*: sets the page to width of the device and sets the zoom level (Ex. tablet, mobile, web)&ndash;%&gt;--%>
<%--<meta name="viewport" content="width=device-width, initial-scale=1">--%>
<%--<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->--%>
<%--<title>Bootstrap 101 Template</title>--%>

<%--<!-- Bootstrap -->--%>
<%--<!-- Latest compiled and minified CSS -->--%>
<%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"--%>
<%--integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">--%>

<%--<!-- Optional theme -->--%>
<%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"--%>
<%--integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">--%>
<%--<title>Add Event</title>--%>
<%--&lt;%&ndash;<script>&ndash;%&gt;--%>
<%--&lt;%&ndash;function myFunction() {&ndash;%&gt;--%>
<%--&lt;%&ndash;var x = document.createElement("INPUT");&ndash;%&gt;--%>
<%--&lt;%&ndash;x.setAttribute("type", "time");&ndash;%&gt;--%>
<%--&lt;%&ndash;x.setAttribute("value", "24:00:00");&ndash;%&gt;--%>
<%--&lt;%&ndash;document.body.appendChild(x);&ndash;%&gt;--%>
<%--&lt;%&ndash;}&ndash;%&gt;--%>
<%--&lt;%&ndash;</script>&ndash;%&gt;--%>
<%--<meta name="viewport" content="initial-scale=1.0, user-scalable=no"/>--%>
<%--<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>--%>
<%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">--%>
<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>--%>
<%--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>--%>
<%--<link rel="stylesheet" type="text/css" href="resources/addpin.css">--%>
<%--<style>--%>
<%--.center_div {--%>
<%--margin: 0 auto;--%>
<%--width: 30% /* value of your choice which suits your alignment */--%>
<%--}--%>
<%--</style>--%>
<%--</head>--%>
<%--<body>--%>

<%--<div class="container center_div">--%>


<%--<form class="form-signin" method="post" action="/addeventsuccess">--%>
<%--<h2 class="form-signin-heading">Add new event.</h2>--%>
<%--<label for="eventName" class="sr-only">Event Name</label>--%>
<%--<input type="text" name="name" id="eventName" class="form-control" placeholder="Event Name" required>--%>
<%--<label for="sport" class="sr-only">Sport</label>--%>
<%--<select name="sport" id="sport" class="form-control" required>--%>
<%--<option class="form-control">Please choose a sport</option>--%>
<%--<option value="Soccer">Soccer</option>--%>
<%--<option value="Basketball">Basketball</option>--%>
<%--<option value="Baseball">Baseball</option>--%>
<%--<option value="Volleyball">Volleyball</option>--%>
<%--</select>--%>
<%--<label for="address" class="sr-only">Address</label>--%>
<%--<input type="text" name="address" id="address" class="form-control" placeholder="Address"--%>
<%--required>--%>
<%--<label for="time" class="sr-only">Time</label>--%>
<%--<input type="time" name="password" id="time" class="form-control" placeholder="hrs:mins"--%>
<%--pattern="[0-9]{4}-[0-1][0-9]-[0-3][0-9] (1[012]|0[1-9]):[0-5][0-9] (am|pm|AM|PM)" required>--%>
<%--<label for="date" class="sr-only">Date</label>--%>
<%--<input type="date" name="date" id="date" class="form-control" placeholder="Date" required>--%>
<%--<label for="description" class="sr-only">Description</label>--%>
<%--<input type="text" name="description" id="description" class="form-control" placeholder="Description"--%>
<%--required>--%>
<%--<label for="playersRequired" class="sr-only">Number of players required</label>--%>
<%--<input type="text" name="min" id="playersRequired" class="form-control"--%>
<%--placeholder="Number of players required" required>--%>
<%--</select>--%>
<%--</form>--%>
<%--<form method="post" action="/addeventsuccess">--%>
<%--<button class="btn btn-lg btn-primary btn-block" type="submit">Add event</button>--%>
<%--</form>--%>
<%--</div>--%>


<%--&lt;%&ndash;<div id="form" class="overlay">&ndash;%&gt;--%>
<%--&lt;%&ndash;<!-- Changed /addeventsuccess to /listevents -->&ndash;%&gt;--%>
<%--&lt;%&ndash;<form action="/addeventsuccess" method="post">&ndash;%&gt;--%>
<%--&lt;%&ndash;<p>&ndash;%&gt;--%>
<%--&lt;%&ndash;Name : <input type="text" name="name" required>&ndash;%&gt;--%>
<%--&lt;%&ndash;<br>&ndash;%&gt;--%>
<%--&lt;%&ndash;<select name="sport">&ndash;%&gt;--%>
<%--&lt;%&ndash;<option value="soccer">Soccer</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;<option value="basketball">Basketball</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;<option value="football">Football</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;<option value="baseball">Baseball</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;<option value="volleyball">Volleyball</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;</select>&ndash;%&gt;--%>
<%--&lt;%&ndash;<br>&ndash;%&gt;--%>
<%--&lt;%&ndash;Address: <input type="text" name="address" required>&ndash;%&gt;--%>
<%--&lt;%&ndash;<br>&ndash;%&gt;--%>

<%--&lt;%&ndash;Time: <input type="time" name="time" placeholder="hrs:mins"&ndash;%&gt;--%>
<%--&lt;%&ndash;pattern="[0-9]{4}-[0-1][0-9]-[0-3][0-9] (1[012]|0[1-9]):[0-5][0-9] (am|pm|AM|PM)" required>&ndash;%&gt;--%>

<%--&lt;%&ndash;<br>&ndash;%&gt;--%>
<%--&lt;%&ndash;Date: <input id="date" type="date" name="day">&ndash;%&gt;--%>
<%--&lt;%&ndash;<br>&ndash;%&gt;--%>
<%--&lt;%&ndash;Description: <input type="text" name="description">&ndash;%&gt;--%>
<%--&lt;%&ndash;<br>&ndash;%&gt;--%>
<%--&lt;%&ndash;Amount of people Needed: <input type="text" name="min" value="0" required>&ndash;%&gt;--%>
<%--&lt;%&ndash;<br>&ndash;%&gt;--%>

<%--&lt;%&ndash;<input type="text" id="peopleGoing" name="peopleGoing" value="0" required>&ndash;%&gt;--%>

<%--&lt;%&ndash;<input id="lat" name="lat" type="textbox" required/>&ndash;%&gt;--%>
<%--&lt;%&ndash;<input id="lng" name="lng" type="textbox" required/>&ndash;%&gt;--%>

<%--&lt;%&ndash;<input type="submit" value="Add Event">&ndash;%&gt;--%>
<%--&lt;%&ndash;</p>&ndash;%&gt;--%>
<%--&lt;%&ndash;</form>&ndash;%&gt;--%>
<%--<h2>Click on the map where your event will take place</h2>--%>
<%--</div>--%>
<%--<form action="/listofsports">--%>
<%--<input type="submit" value="Back to Sports">--%>
<%--</form>--%>
<%--<div id="map" height="460px" width="100%"></div>--%>
<%--<script src="resources/addpin.js"></script>--%>
<%--<script async defer--%>
<%--src="https://maps.googleapis.com/maps/api/js?callback=initMap">--%>
<%--</script>--%>
<%--<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>--%>
<%--<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>--%>
<%--</body>--%>
<%--</html>--%>