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


<html>
<style>
    .jumbotron {
        opacity: 0.8;
    }
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
        background: url("https://s-media-cache-ak0.pinimg.com/originals/8e/64/fb/8e64fbddeeb2a2356ba2361733010ad2.jpg") no-repeat center center;
        height: 100%;
        margin:0px;
        background-size: cover;
        background-attachment: fixed;
    }
</style>
<div class="container">
    <div class="jumbotron">


        <h1> ${sportlist}</h1>

        <form action="/listeventsfiltered" method="get">

            <p>
                Choose a Sport
                <select name="sport">
                    <option value="soccer">Soccer</option>
                    <option value="basketball">Basketball</option>
                    <option value="football">Football</option>
                    <option value="baseball">Baseball</option>
                    <option value="volleyball">Volleyball</option>
                </select>

                <input type="submit" value="Filter Events">
            </p>
        </form>

        <form action="/addevent">
            <input type="submit" value="Add New Event">
        </form>

        <br>


    </div>

</div>
</html>
</body>






