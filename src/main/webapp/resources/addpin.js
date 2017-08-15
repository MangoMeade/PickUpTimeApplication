var map;
var marker;
var infowindow;
var messagewindow;

function initMap() {
    //initialize map
    var detroit = {lat: 42.3314, lng: -83.0458};
    map = new google.maps.Map(document.getElementById('map'), {
        center: detroit,
        zoom: 14
    });

    messagewindow = new google.maps.InfoWindow({
        content: document.getElementById('message')
    });

    //markers is created in the spot where the map was clicked
    google.maps.event.addListener(map, 'click', function (event) {
        marker = new google.maps.Marker({
            position: event.latLng,
            map: map
        });
        document.getElementById('lat').value = marker.getPosition().lat();
        document.getElementById('lng').value = marker.getPosition().lng();
    });
}

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
    google.maps.event.addListener(map, 'click', function (event) {
        marker = new google.maps.Marker({
            position: event.latLng,
            map: map
        });
        document.getElementById('lat').value = marker.getPosition().lat();
        document.getElementById('lng').value = marker.getPosition().lng();
        console.log(document.getElementById('lat').value);
        console.log(document.getElementById('lng').value);
    });
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


//callback database of markers within the current viewport
    var bounds = map.getBounds();
    var NE = bounds.getNorthEast();
    var SW = bounds.getSouthWest();

    var neLat = NE.lat();
    var neLng = NE.lng();
    var swLat = SW.lat();
    var swLng = SW.lng();

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
            var icon = customIcon[sport] || {};
            var marker = new google.maps.Marker({
                position: latLng,
                category: sport,
                icon: icon.style,
                scale: 2
            });
            markers.push(marker);
            saveCoordinates(marker);
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

function saveCoordinates(marker) {
    marker.addListener('click', function () {
        document.getElementById('lat').value = marker.getPosition().lat();
        document.getElementById('lng').value = marker.getPosition().lng();
        console.log(document.getElementById('lat').value);
        console.log(document.getElementById('lng').value);
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


//people going counter
function myFunction() {
    var x = document.createElement("INPUT");
    x.setAttribute("type", "time");
    x.setAttribute("value", "24:00:00");
    document.body.appendChild(x);
}

//restricts event scheduling to 2 days from current day
var day = new Date();
day.setDate(day.getDate()+2);
var dd = day.getDate();
var mm = day.getMonth()+1; //January is 0!
var yyyy = day.getFullYear();
if(dd<10){
    dd='0'+dd
}
if(mm<10){
    mm='0'+mm
}

day = yyyy+'-'+mm+'-'+dd;
document.getElementById("date").setAttribute("max", day);