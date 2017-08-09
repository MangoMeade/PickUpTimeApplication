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
    <script>
        function myFunction() {
            var x = document.createElement("INPUT");
            x.setAttribute("type", "time");
            x.setAttribute("value", "24:00:00");
            document.body.appendChild(x);
        }
    </script>
</head>
<body>
Add a new event:
<br>



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
        <%--Time: <input type = "text" name="time" required>--%>
        <%--<button onclick="myFunction()" name="time">Set Time</button>--%>
        <input type="time" name="time" placeholder="hrs:mins" pattern="[0-9]{4}-[0-1][0-9]-[0-3][0-9] (1[012]|0[1-9]):[0-5][0-9] (am|pm|AM|PM)"required>
        <br>
        Date: <input type="date" name="day">
        <br>
        Amount of people Needed: <input type = "text" name="min" value = "0" required>

        <br>
        <input type = "submit" value = "Add Event" > </p>
</form>
<form action="/listofsports">
    <input type= "submit" value="Back to Sports">
</form>
</body>
</html>
