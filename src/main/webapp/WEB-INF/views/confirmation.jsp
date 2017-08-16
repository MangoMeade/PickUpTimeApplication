<%--
  Created by IntelliJ IDEA.
  User: chand
  Date: 8/9/2017
  Time: 5:13 PM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Confirmation Page</title>
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
            <a class="navbar-brand" href="#">Pickup Time</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="/">Home</a></li>
                <li class="active"><a href="/listevents">See Events</a></li>
                <li class="active"><a href="/listofsports">Sport List</a></li>


            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>
<title>Confirmation</title>
<style>
    div {
        text-align: center;

    }
    body {
        background: url("http://www.atpworldtour.com/-/media/images/news/2017/08/09/22/02/montreal-2017-wednesday-shapovalov1.jpg") no-repeat center center;
        height: 100%;
        margin:0px;
        background-size: cover;
        background-attachment: fixed;
    }

</style>
<div class="container">
<div class="jumbotron">
    <h1>Submitted </h1> <span class="glyphicon glyphicon-ok"></span></p>    </h1>
    <p>You will receive a notification soon!</p>

    <form action="/listofsports">
        <input type= "submit" value="Back to Sports"></form>
</div>

</div>
</body>
</html>
