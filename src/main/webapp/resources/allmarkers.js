var markers = [];

function initMap() {
    //initialize map
    var map = new google.maps.Map(document.getElementById('map'), {
        center: new google.maps.LatLng(42.3314, -83.0458),
        zoom: 16
    });
    var geocoder = new google.maps.Geocoder();
    //go to viewport specified in the search box. else go to default google maps location

    // geocodeAddress(geocoder, map);

    google.maps.event.addListenerOnce(map, 'tilesloaded', function () {
        //this part runs when the mapobject is created and rendered
        google.maps.event.addListenerOnce(map, 'tilesloaded', function () {
            //this part runs when the mapobject shown for the first time
            loadMarker(map)
        });
    });
    google.maps.event.addListenerOnce(map, 'tilesloaded', function () {
        //this part runs when the mapobject is created and rendered
        google.maps.event.addListenerOnce(map, 'tilesloaded', function () {
            //this part runs when the mapobject shown for the first time
            showVisibleMarkers(map)
        });
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
    //geocode address of search box
    // document.getElementById('submit').addEventListener('click', function () {
    //     geocodeAddress2(geocoder, map);
    //     console.log("click");
    // });
}

// function geocodeAddress(geocoder, resultsMap) {
//     geocoder.geocode({'address': searchRedirect.innerHTML}, function (results, status) {
//         if (status === 'OK') {
//             resultsMap.setCenter(results[0].geometry.location);
//         } else {
//             alert('Geocode was not successful for the following reason: ' + status);
//         }
//     });
// }
//
// function geocodeAddress2(geocoder, resultsMap) {
//     var address = document.getElementById("address").value;
//     geocoder.geocode({'address': address}, function (results, status) {
//         if (status === 'OK') {
//             resultsMap.setCenter(results[0].geometry.location);
//         } else {
//             alert('Geocode was not successful for the following reason: ' + status);
//         }
//     });
// }

function loadMarker(map) {
    var customIcon = {
        //specifies the color of the markers of photos taken in a given decade
        "Soccer": {
            style: {
                path: "M-5,0a5,5 0 0.25,0 10,0a5,5 0 0.25,0 -10,0",
                fillColor: '#448D7A',
                fillOpacity: .6,
                anchor: new google.maps.Point(0, 0),
                strokeWeight: 0,
            }
        }
    }
};

//callback database of markers within the current viewport
// var bounds = map.getBounds();
// var NE = bounds.getNorthEast();
// var SW = bounds.getSouthWest();
//
// var neLat = NE.lat()
// var neLng = NE.lng()
// var swLat = SW.lat()
// var swLng = SW.lng()

downloadUrl('/data', function (results) {
    var customIcon = {
        //specifies the color of the markers of photos taken in a given decade
        "Soccer": {
            style: {
                path: "M-5,0a5,5 0 0.25,0 10,0a5,5 0 0.25,0 -10,0",
                fillColor: '#448D7A',
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
        var icon = customIcon[sport] || {};
        var marker = new google.maps.Marker({
            position: latLng,
            category: sport,
            icon: icon.style,
            scale: 2
        });
        markers.push(marker);
    }
})

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

