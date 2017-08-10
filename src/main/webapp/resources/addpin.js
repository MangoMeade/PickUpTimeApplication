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
    google.maps.event.addListener(map, 'click', function(event) {
        marker = new google.maps.Marker({
            position: event.latLng,
            map: map
        });
        document.getElementById('lat').value=marker.getPosition().lat();
        document.getElementById('lng').value=marker.getPosition().lng();
    });
}



function myFunction() {
    var x = document.createElement("INPUT");
    x.setAttribute("type", "time");
    x.setAttribute("value", "24:00:00");
    document.body.appendChild(x);
}