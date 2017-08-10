<!DOCTYPE html >
<head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="resources/addPin.css">
    <title>Add Pin</title>
</head>
<body>
<div id="map" height="460px" width="100%"></div>
<!-- Store marker coordinate, title, description and year in the database -->
<div id="form" class="overlay">
    <form method="post" action="/listevents"enctype=multipart/form-data>
        <input type="hidden"id="lat" name="lat" type="textbox"/>
        <input type="hidden" id="lng" name="lng" type="textbox"/>
        <input type="submit" value="Add pin" id="submit"/>
    </form>
</div>
<script src="resources/addPin.js"></script>
<script async defer
src="https://maps.googleapis.com/maps/api/js?callback=initMap">
</script>
</body>
</html>