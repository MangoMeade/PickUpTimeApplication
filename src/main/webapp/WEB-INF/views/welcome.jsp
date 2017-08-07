<%--
  Created by IntelliJ IDEA.
  User: chand
  Date: 7/21/2017
  Time: 11:04 AM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Spring Demo</title>
    <meta charset="utf-8" />
    <script type='text/javascript' src='http://www.bing.com/api/maps/mapcontrol?callback=GetMap' async defer></script>
    <script type="text/javascript">
        var key = "ApgHpgK67D8m0ru5mrvDcPQWAqlNFRQWsVOGfcHq9RRJAAinJ4ejJIpFL6PYH6_D";
//        function GetMap()
//        {
//            var mapOptions = {credentials: key};
//            var map = new Microsoft.Maps.Map('#myMap', mapOptions);
//        }
        function GetMap() {

            var pushpinInfos = [];
            pushpinInfos[0] = {
                'lat': 42.0076215,
                'lng': 20.9689308,
                'title': 'Kipper Market',
                'description': 'Braka Miladinovi 178, 1200 Tetovë, Tetovo, Macedonia'
            };
            pushpinInfos[1] = {
                'lat': 41.799645,
                'lng': 20.913514,
                'title': 'Kipper Market',
                'description': 'Kipper Gostivar'
            };

            var infoboxLayer = new Microsoft.Maps.EntityCollection();
            var pinLayer = new Microsoft.Maps.EntityCollection();
            var apiKey = "ApgHpgK67D8m0ru5mrvDcPQWAqlNFRQWsVOGfcHq9RRJAAinJ4ejJIpFL6PYH6_D";

            var map = new Microsoft.Maps.Map(document.getElementById("myMap"), {credentials: apiKey});

            // Create the info box for the pushpin
            pinInfobox = new Microsoft.Maps.Infobox(new Microsoft.Maps.Location(0, 0), {visible: false});
            infoboxLayer.push(pinInfobox);

            var locs = [];
            for (var i = 0; i < pushpinInfos.length; i++) {
                locs[i] = new Microsoft.Maps.Location(pushpinInfos[i].lat, pushpinInfos[i].lng);
                var pin = new Microsoft.Maps.Pushpin(locs[i]);
                pin.Title = pushpinInfos[i].title;
                pin.Description = pushpinInfos[i].description;
                pinLayer.push(pin);
                Microsoft.Maps.Events.addHandler(pin, 'click', displayInfobox);
            }
        }
    </script>
</head>
<body onload="GetMap();">
<div id="myMap" style='position:relative;width:600px;height:400px;'>

</div>
${message}

</body>
</html>
