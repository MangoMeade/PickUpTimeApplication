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
    <title>Event to Edit</title>

</head>
<body>


<h1>${name}</h1>
<h2>${sport}</h2>
<h2>${address}</h2>
<br>
${peopleGoing}
<form action="updateform" method="post">
    <input type="hidden" name="eventId" value="${eventId}">
    <br>
    People Going: <input type="number" name="peopleGoing" value = "0" placeholder="${peopleGoing}">
    <br>
    <input type="submit" value="Submit">
</form>
</body>
</html>
