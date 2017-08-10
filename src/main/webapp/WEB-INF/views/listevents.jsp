<%--
  Created by IntelliJ IDEA.
  User: aibar
  Date: 8/7/2017
  Time: 2:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;


charset=ISO-8859-1">
    <title>ListEvents</title></head>
<h3>Events List</h3>
<table>
    <th>Event Name</th>
    <th>Sport</th>
    <th>Players Going</th>
    <th>Players Needed</th>
    <th>Date</th>
</table>
<table border=1><c:forEach var="myvar" items="${cList}">
    
    <tr>
        <td> ${myvar.name}</td>
        <td> ${myvar.sport}</td>
        <td> ${myvar.peopleGoing}</td>
        <td> ${myvar.minNeeded}</td>
        <td> ${myvar.day}</td>
        <td><a href="update?id=${myvar.eventId}">Attending</a></td>
    </tr>

</c:forEach></table>
<form action="/addevent">
    <input type="submit" value="Add New Event">
</form>
<form action="/listofsports">
<input type= "submit" value="Back to Sports">
</form>
</body> 



</html>
