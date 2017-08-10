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

</head>
<body>


<h1>${name}</h1>
<h2>${sport}</h2>
<h2>${address}</h2>
<br>
<h2>${latitude}</h2>
<h2>${longitude}</h2>
<form action="updateform" method="post">
    <input type="hidden" name="eventId" value="${eventId}">
    <br>
    People Going: ${peopleGoing}
    <input type="number" id="peopleGoing" name="peopleGoing" value = "${peopleGoing}" placeholder="${peopleGoing}">
    <br>
    <%--<input type="hidden" name="minNeeded" value="${minNeeded}">--%>
    <input onclick="counter()" type="submit" value="I'm Coming">
</form>
</body>
</html>
