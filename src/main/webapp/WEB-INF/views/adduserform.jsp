<%--
  Created by IntelliJ IDEA.
  User: chand
  Date: 8/7/2017
  Time: 4:13 PM
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
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
          integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <style>
        .jumbotron {
            background-color: purple;
            color: aliceblue;
            font-family: "Britannic Bold", serif;
        }
        .center_div{
            margin: 0 auto;
            width:30% /* value of your choice which suits your alignment */
        }
        body {
            background: url("https://obrazky.4ever.sk/data/download/ludia/preteky,-gepardy-161476.jpg") no-repeat center center;
            height: 100%;
            margin:0px;
            background-size: cover;
            background-attachment: fixed;
        }



    </style>
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
            <a class="navbar-brand" href="#">Pickup Time</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
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

<div class="jumbotron">
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante
        dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris.
        Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla.</p>
    <input type="submit" value="submit" class="btn btn-danger">
    <input type="submit" value="link" class="btn btn-lg btn-link">

</div> <!-- /container -->

<div class="container center_div">


    <form class="form-signin" method="post" action="/addusersuccess">
        <h2 class="form-signin-heading">Register here!</h2>

        <input type="text" name="firstName" id="inputfirstName" class="form-control" placeholder="First Name" required
               autofocus>
        <input type="text" name="lastName" id="inputlastName" class="form-control" placeholder="Last Name" required>
        <input type="text" name="email" id="inputemail" class="form-control" placeholder="Email" required>
        <input type="text" name="phoneNumber" id="inputphoneNumber" class="form-control" placeholder="Phone Number" required>

        <input type="text" name="age" id="inputage" class="form-control" placeholder="Age" required>
        <input type="text" name="userName" id="inputuserName" class="form-control" placeholder="username" required>
        <input type="password" name="password" id="inputpassword" class="form-control" placeholder="password" required>

        <div class="container">
            <label class="radio-inline">
                <input type="radio" name="gender">Female
            </label>
            <label class="radio-inline">
                <input type="radio" name="gender">Male
            </label>
            <label class="radio-inline">
                <input type="radio" name="gender">Prefer not to answer
            </label>
        </div>
        <br>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Register</button>
    </form>

</div>
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

</body>
</html>

