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
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <style>
        .table, tr, th, td {
            /*border: 1px solid black;*/
            border-collapse: collapse;
            padding: 4px;
            text-align: left;

        }
        tr:nth-child(even) {background-color: #f2f2f2}
        .filterable {
            margin-top: 15px;
        }
        .filterable .panel-heading .pull-right {
            margin-top: -20px;
        }
        .filterable .filters input[disabled] {
            background-color: transparent;
            border: none;
            cursor: auto;
            box-shadow: none;
            padding: 0;
            height: auto;
        }
        .filterable .filters input[disabled]::-webkit-input-placeholder {
            color: #333;
        }
        .filterable .filters input[disabled]::-moz-placeholder {
            color: #333;
        }
        .filterable .filters input[disabled]:-ms-input-placeholder {
            color: #333;
        }
    </style>
    <title>ListEvents</title>

</head>
<body>

<h3>Events List</h3>
<table class="table table-hover table-bordered">

    <tr>
        <th>Event Name</th>
        <th>Sport</th>
        <th>Players Going</th>
        <th>Players Needed</th>
        <th>Date</th>
        <th></th>
    </tr>
    <c:forEach var="myvar" items="${cList}">

        <tr>
            <td> ${myvar.name}</td>
            <td> ${myvar.sport}</td>
            <td> ${myvar.peopleGoing}</td>
            <td> ${myvar.minNeeded}</td>
            <td> ${myvar.day}</td>
            <td><a href="update?id=${myvar.eventId}&peopleGoing=${myvar.peopleGoing}
        &latitude=${myvar.latitude}&longitude=${myvar.longitude}&name=${myvar.name}
        &sport=${myvar.sport}&address=${myvar.address}&description=${myvar.description}&time=${myvar.time}
        ">Are you Attending?</a></td>
        </tr>

    </c:forEach></table>
<form action="/addevent">
    <input type="submit" value="Add New Event">
</form>
<form action="/listofsports">
    <input type="submit" value="Back to Sports">
</form>

</body>


</html>
