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
</head>
<body>
Add a new event:
<br>



<form action= "addNewEvent" method="post">
    <p>
        Name : <input type = "text" name="name" required>
        <br>
        Sport: <input type = "text" name="sport"required >
        <br>
        Address: <input type = "text" name="address" required>
        <br>
        Time: <input type = "text" name="time" required>
        <br>
        Date: (YYYY-MM-DD) <input type = "text" name="day" required>
        <br>
        Amount of people Needed: <input type = "text" name="min" required>

        <br>
        <input type = "submit" value = "Add Event" > </p>
</form>
</body>
</html>
