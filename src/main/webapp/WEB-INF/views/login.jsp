<%--
  Created by IntelliJ IDEA.
  User: chand
  Date: 7/21/2017
  Time: 11:04 AM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <%--if using Internet Explorer use the latest rendering--%>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <%--*IMPORTANT*: sets the page to width of the device and sets the zoom level (Ex. tablet, mobile, web)--%>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Pickup Time</title>

    <!-- Bootstrap -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
          integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <style>
        .jumbotron {
            background-color: cadetblue;
            opacity: 0.7;
            color: aliceblue;
            font-family: "Britannic Bold", serif;
        }

        .center_div {
            opacity: 0.7;
            border: #ff7253;
            background-color: #d9534f;
            margin-top: 20%;
            width: 30% /* value of your choice which suits your alignment */
        }
        body {
            background: url("https://wallpapershome.com/images/wallpapers/allyson-felix-3840x2160-nike-running-athlete-women-red-10572.jpg") no-repeat center center;
            height: 100%;
            margin:0px;
            background-size: cover;
            background-attachment: fixed;
        }

    </style>
</head>
<body>

<%--<nav class="navbar navbar-inverse navbar-fixed-top">--%>
    <%--<div class="container">--%>
        <%--<div class="navbar-header">--%>
            <%--<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"--%>
                    <%--aria-expanded="false" aria-controls="navbar">--%>
                <%--<span class="sr-only">Toggle navigation</span>--%>
                <%--<span class="icon-bar"></span>--%>
                <%--<span class="icon-bar"></span>--%>
                <%--<span class="icon-bar"></span>--%>
            <%--</button>--%>
            <%--<a class="navbar-brand" href="#"></a>--%>
        <%--</div>--%>
        <%--<div id="navbar" class="navbar-collapse collapse">--%>
            <%--<ul class="nav navbar-nav navbar-left">--%>
                <%--<li class="active"><a href="/">Home</a></li>--%>
                <%--<li class="active"><a href="/listevents">See Events</a></li>--%>
                <%--<li class="active"><a href="/listofsports">Sport List</a></li>--%>

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

                        </div><!--/.nav-collapse -->
                    </div>
                </nav>



${loginFailed}

<div class="container center_div">



    <form class="form-signin" method="post" action="/loggedin">
        <h2 class="form-signin-heading">Please sign in</h2>
        <label for="inputUsername" class="sr-only">Email address</label>
        <input type="text" name="username" id="inputUsername" class="form-control" placeholder="Username" required
               autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required>
        <div class="checkbox">
            <label>
                <input type="checkbox" value="remember-me"> Remember me
            </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
        New User? <a href="/getnewuser">Sign up here</a>
    </form>

    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
</div>

</body>

</html>
