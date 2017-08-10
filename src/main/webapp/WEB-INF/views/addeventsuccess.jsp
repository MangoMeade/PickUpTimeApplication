<%--
  Created by IntelliJ IDEA.
  User: michelhayman
  Date: 8/8/17
  Time: 1:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Success</title>
</head>
<body>
Your event has been saved!
<table border="1" >

    <h1>Event List:</h1>



    <c:forEach var="myVar" items="${eventlist}">



    <tr>
        <th> Event </th>

        <td> ${myVar.name}</td>
        <td> ${myVar.sport}</td>
        <td> ${myVar.address}</td>
        <td> ${myVar.time}</td>
        <td> ${myVar.day}</td>
        <td> ${myVar.description}</td>
        <td> ${myVar.minNeeded}</td>




    </tr>

    </c:forEach>

<a href="/listevents">Back to the Events</a>
    <br>
    <form action="/addevent">
        <input type="submit" value="Add Another Event">
    </form>
    <br>
    <form action="/listofsports">
        <input type= "submit" value="Back to Sports">
    </form>
</table>
</body>
</html>
