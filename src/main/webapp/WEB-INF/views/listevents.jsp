<%--
  Created by IntelliJ IDEA.
  User: aibar
  Date: 8/7/2017
  Time: 2:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
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
                <li class="active"><a href="/">Home</a></li>
                <li class="active"><a href="/listevents">See Events</a></li>
                <li><a href="#about">About</a></li>
                <li><a href="#contact">Contact</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">Sports <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li role="separator" class="divider"></li>
                        <li class="dropdown-header">Nav header</li>
                        <li><a href="#">Separated link</a></li>
                        <li><a href="#">One more separated link</a></li>
                    </ul>
                </li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>


<title>Events Page</title>
<style>
    div {
        text-align: center;

    }
    body {
        background-color: red;
    }

</style>
<div class="container">
    <div class="jumbotron">

<h1>Events List</h1>

        <table class="table table-bordered">

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
    </div>

</div>

</body>


</html>
