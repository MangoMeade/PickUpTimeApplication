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
<style>
    .info {
        text-align: center;
    }
    .going {
        text-align: center;
    }
</style>
</head>
<body>
<div class = "info">
<h3>Event Name: ${name}</h3>
<h3>Sport: ${sport}</h3>
<h3>Address: ${address}</h3>
<h3>Time: ${time}</h3>
<h3>${description}</h3>
</div>
<form action="updateform" method="post" class = "going">
    <input type=hidden name="eventId" value="${eventId}">
    <br>
    People Going: ${peopleGoing}
    <input type="number" id="peopleGoing" name="peopleGoing" value = "${peopleGoing}" placeholder="${peopleGoing}">
    <br>
    <%--<input type="hidden" name="minNeeded" value="${minNeeded}">--%>
    <input onclick="counter()" type="submit" value="I'm Coming">
</form>
</body>
</html>
