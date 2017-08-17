<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: aibar
  Date: 8/16/2017
  Time: 3:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>


    <html lang="en">
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

        <style>
            .table, tr, th, td {
                /*border: 1px solid black;*/
                border-collapse: collapse;
                padding: 4px;
                text-align: left;

            }

            tr:nth-child(even) {
                background-color: #f2f2f2
            }

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

            body {
                background: url("http://cdn.wallpapersafari.com/54/71/y74YHd.jpg") no-repeat center center;
                height: 100%;
                margin: 0px;
                background-size: cover;
                background-attachment: fixed;
            }

        </style>
        <title>Pick up Time</title>


        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
<body>

<!-- Fixed navbar -->
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
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

    <title>Pick up Time</title>
</head>
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

        <h1>Attendees</h1>

<table class="table table-bordered">

    <c:forEach var="myvar" items="${cList}">
    <tr>
        <td> ${myvar.username}</td>
    </tr>
</c:forEach>
</table>

        <form action="/listevents">
            <input type="submit" value="Back">
        </form>

    </div>
</div>
</body>
</html>