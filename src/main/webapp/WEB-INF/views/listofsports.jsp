<%--
  Created by IntelliJ IDEA.
  User: chand
  Date: 8/8/2017
  Time: 6:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sports</title>
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
    </style>
</head>
<body>
<h1> ${sportlist}</h1>
<%--<div class="sportmenu">--%>
    <%--<a href="#" class="active">Pickup Sports</a>--%>
    <%--<a href="/listevents">Soccer</a>--%>
    <%--<a href="/listevents">Basketball</a>--%>
    <%--<a href="/listevents">Football</a>--%>
    <%--<a href="/listevents">Volleyball</a>--%>
    <%--<a href="/listevents">Baseball</a>--%>
<%--</div>--%>
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
<form action="/">
    <input type="submit" value="Back to Login">
</form>
</body>
</html>
