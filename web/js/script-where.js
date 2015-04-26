/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function getParameterByName(name) {
// Mengambil parameter dari url berdasarkan parameter masukkan nama
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}
var candidate = getParameterByName("candidate-place");

// Penggunaan GoogleMaps API
var geocoder;
var map;
var infowindow;

function sleep(milliseconds) {
  var start = new Date().getTime();
  for (var i = 0; i < 1e10; i++) {
    if ((new Date().getTime() - start) > milliseconds){
      break;
    }
  }
}

function work() {
  infowindow = new google.maps.InfoWindow();
  geocoder = new google.maps.Geocoder();
  var latlng = new google.maps.LatLng(-6.8899, 107.6100);
  var mapOptions = {
    zoom: 16,
    center: latlng
  };
  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

  // taruh array of stringnya di sini
  var addressValue = candidate.replace('[', '').replace(/"/g, '').replace(']', '');
  document.getElementById('address').value = addressValue;
  var candidatePlace = [candidate];
  var exist = 0;

  for(var it = 0; it < candidatePlace.length; it++) {
    if(exist == 1) {
      break;
    }
    var placeName = candidatePlace[it];
    var places = placeName.split(" ");
    var bef = "";
    for(var i = 0; i < places.length; i++) {
      if(i > 0) {
        places[i] = places[i - 1] + " " + places[i];
      }
    }

    for(var i = places.length - 1; i >= 0; --i) {
      if(exist == 1) {
        break;
      }
      sleep(250);
      geocoder.geocode( { 'address': places[i] }, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK && !exist) {
          exist = 1;
          map.setCenter(results[0].geometry.location);
          for(var j = 0; j < results.length; j++) {
            createMarker(results[j]);
          }
        }
      });
    }
  }
}

function codeAddress() {
  var address = document.getElementById('address').value;
  geocoder.geocode( { 'address': address}, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      map.setCenter(results[0].geometry.location);
      for(var j = 0; j < results.length; j++) {
        createMarker(results[j]);
      }
    } else {
      alert('Geocode was not successful for the following reason: ' + status);
    }
  });
}

function createMarker(place) {
  var placeLoc = place.geometry.location;
  var marker = new google.maps.Marker({
    map: map,
    position: place.geometry.location
  });

  google.maps.event.addListener(marker, 'click', function() {
    infowindow.setContent(place.name);
    infowindow.open(map, this);
  });
}

google.maps.event.addDomListener(window, 'load', work);
