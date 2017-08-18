function initMap() {
    var coordinates = {lat: parseFloat(document.getElementById('lat').value), lng: parseFloat(document.getElementById('lng').value)};
    console.log(coordinates);

    var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 9,
        center: coordinates
    });

    var marker = new google.maps.Marker({
        position: coordinates,
        map: map,
        title: 'Your event is here!'
    });
}

function counter() {
    document.getElementById("peopleGoing").stepUp(1);
}
