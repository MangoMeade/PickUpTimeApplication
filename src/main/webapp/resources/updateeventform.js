function counter() {
    document.getElementById("peopleGoing").stepUp(1);
}

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

    // infowindow = new google.maps.InfoWindow({
    //     content: document.getElementById('form')
    // })
    //
    // messagewindow = new google.maps.InfoWindow({
    //     content: document.getElementById('message')
    // });

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

//map shown in map2 webpage centers in the place where the markers was created
var button = document.getElementById("submit");

// button.addEventListener("click", function() {
//
//     var text = marker.getPosition().lat() + "," + marker.getPosition().lng();
//
//     if (typeof(Storage) !== "undefined") {
//         // Store
//         sessionStorage.setItem("geo", text);
//         // Retrieve
//         document.getElementById("result").innerHTML = sessionStorage.getItem("geo");
//     } else {
//         document.getElementById("result").innerHTML = "Sorry, your browser does not support Web Storage...";
//     }
// });