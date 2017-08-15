<%--
  Created by IntelliJ IDEA.
  User: chand
  Date: 8/8/2017
  Time: 6:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Sports</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>


<html>
<style>
        .sportmenu {
            width: 200px;
        }

        .sportmenu a {
            background-color: palegreen;
            color: black;
            display: block;
            padding: 12px;
            text-decoration: none;
        }

        .sportmenu a:hover {
            background-color: cadetblue;
        }

        .sportmenu a.active {
            background-color: darkcyan;
            color: white;
        }
        div {
            text-align: center;

        }
        body {
            background-color: red;
        }
    </style>
<div class="container">
    <div class="jumbotron">


<h1> ${sportlist}</h1>

<form action= "/listeventsfiltered" method="post">
    <p>
        Choose a Sport
        <select name="sport">
            <option value="soccer">Soccer</option>
            <option value="basketball">Basketball</option>
            <option value="football">Football</option>
            <option value="baseball">Baseball</option>
            <option value="volleyball">Volleyball</option>
        </select>

        <input type = "submit" value = "Filter Events">
    </p>
</form>

<form action="/addevent">
    <input type="submit" value="Add New Event">
</form>

        <br>
<form action="/">
    <input type="submit" value="Back to Login">
</form>


    </div>

</div>
</html>
</body>






