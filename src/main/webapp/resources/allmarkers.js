var markers = [];

function initMap() {
    //initialize map
    var map = new google.maps.Map(document.getElementById('map'), {
        center: new google.maps.LatLng(42.3314, -83.0458),
        zoom: 16
    });
    var geocoder = new google.maps.Geocoder();
    //go to viewport specified in the search box. else go to default google maps location

    loadMarker(map)
    google.maps.event.addListenerOnce(map, 'tilesloaded', function () {
        //this part runs when the mapobject is created and rendered
        loadMarker(map)

    });
    google.maps.event.addListenerOnce(map, 'tilesloaded', function () {
        //this part runs when the mapobject is created and rendered
        showVisibleMarkers(map)

    });
    //load markers in current viewport
    google.maps.event.addListener(map, "idle", function () {
        loadMarker(map)
    });
    //show markers in current viewport
    google.maps.event.addListener(map, "idle", function () {
        showVisibleMarkers(map)
    });
    //clear markers everytime the viewport bounds changes
    google.maps.event.addListener(map, "bounds_changed", function () {
        clearMarkers(map)
    });

}


function loadMarker(map) {


    downloadUrl('/data', function (results) {
        var customIcon = {
            //specifies the color of the markers of photos taken in a given decade
            "soccer": {
                style: {
                    path: "M-5,0a5,5 0 0.25,0 10,0a5,5 0 0.25,0 -10,0",
                    fillColor: '#448D7A',
                    fillOpacity: .6,
                    anchor: new google.maps.Point(0, 0),
                    strokeWeight: 0,
                }
            },
            "basketball": {
                style: {
                    path: "M-5,0a5,5 0 0.25,0 10,0a5,5 0 0.25,0 -10,0",
                    fillColor: '#b43b08',
                    fillOpacity: .6,
                    anchor: new google.maps.Point(0, 0),
                    strokeWeight: 0,
                }
            }
        }
        console.log(results.responseText.trim());
        var resultsJSON = JSON.parse(results.responseText.trim());
        console.log(resultsJSON);
        for (var i = 0; i < resultsJSON.length; i++) {
            var lat = resultsJSON[i].latitude;
            var lng = resultsJSON[i].longitude;
            var latLng = new google.maps.LatLng(lat, lng);
            var name = resultsJSON[i].name;
            var sport = resultsJSON[i].sport;
            var address = resultsJSON[i].address;
            var description = resultsJSON[i].description;
            var time = resultsJSON[i].time;
            var day = resultsJSON[i].day;
            var peopleGoing = resultsJSON[i].peopleGoing;
            var minNeeded = resultsJSON[i].minNeeded;

            var infowincontent = document.createElement('div');
            var strong = document.createElement('strong');
            strong.textContent = name
            infowincontent.appendChild(strong);
            infowincontent.appendChild(document.createElement('br'));

            var text = document.createElement('text');
            text.textContent = "People attending: " + peopleGoing;
            infowincontent.appendChild(text);
            infowincontent.appendChild(document.createElement('br'));
            var text2 = document.createElement('text');
            text2.textContent = "Minimum attendance needed:" + minNeeded;
            infowincontent.appendChild(text2);


            var icon = customIcon[sport] || {};
            var marker = new google.maps.Marker({
                position: latLng,
                category: sport,
                icon: icon.style,
                scale: 2
            });
            markers.push(marker);
            attachInfoWindow(marker, infowincontent);
        }
    })
};

function showVisibleMarkers(map) {
    var zoom = map.getZoom();
    for (var i = 0; i < markers.length; i++) {
        if (zoom >= 14) {
            console.log("It worked");
            markers[i].setMap(map);
        }
        else if (zoom < 14) {
            markers[i].setMap(null);
        }
    }
}

function clearMarkers(map) {
    for (var i = 0; i < markers.length; i++) {
        if (!map.getBounds().contains(markers[i].getPosition())) {
            markers[i].setMap(null);
        }
    }

}

function attachInfoWindow(marker, infowincontent) {
    var infoWindow = new google.maps.InfoWindow;
    marker.addListener('click', function () {
        infoWindow.setContent(infowincontent);
        infoWindow.open(map, marker);
    })
}

function doNothing() {
}

function downloadUrl(url, callback) {
    var request = window.ActiveXObject ?
        new ActiveXObject('Microsoft.XMLHTTP') :
        new XMLHttpRequest;

    request.onreadystatechange = function () {
        if (request.readyState == 4) {
            request.onreadystatechange = doNothing;
            callback(request, request.status);
        }
    };

    request.open('GET', url, true);
    request.send(null);
}

