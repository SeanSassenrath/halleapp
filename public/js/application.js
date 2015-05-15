
$(document).ready(function() {
  // ------- homepage --------
  $('div#signUpForm').hide();
  $('div#loginForm').hide();
  $('div#editForm').hide();

  $('#signUp').on('click', function(event){
    event.preventDefault();
    $('div#signUpForm').show();
  });

  $('#login').on('click', function(event){
    event.preventDefault();
    $('div#loginForm').show();
  });

  $('.closePopUp').on('click', function(event){
    event.preventDefault();
    $('div.popUpForm').hide();
  });

  $('#editProfile').on('click', function(event){
    event.preventDefault();
    $('div#editForm').show();
  });

// -------------- gMaps --------------

  var mapOptions = {
    zoom: 15,
  };

  map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);

// var longitude = 0
// var latitude = 0

  // .getCurrentPosition(function(position) {
  //   console.log(position.coords.longitude)
  //   latitude = position.coords.latitude
  //     // initialLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
  //     // map.setCenter(initialLocation);
  //   });

  navigator.geolocation.getCurrentPosition(function(position) {
      initialLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
      map.setCenter(initialLocation);

      var marker = new google.maps.Marker({
        position: initialLocation,
        map: map,
      });

      var data = {lat: initialLocation["A"], lng: initialLocation["F"]}

      var req = $.ajax({
        url: "/location",
        data: data,
        type: "post",
        error: function(response){
          alert(response)
        },
        success: function(response){
          $('#presentLocation').text(JSON.parse(response));
        }
      })

  $("#submit-parking").on('click', function(event) {
    event.preventDefault();

    var req = $.ajax({
      url: "/submit_parking_spot",
      data: data,
      type: "post",
    });
    req.done(function(response){
      x = response;
    })
  });

  $("#available-parking").on('click', function(event) {
    event.preventDefault();

    var url = $("#available-parking").attr("href")
    console.log(url);

    var req = $.ajax({
      url: url,
      type: "get",
    });

    req.done(function(response){
      parkingSpots = JSON.parse(response)
      for(i = 0; i < parkingSpots.length; i++){
        console.log(parkingSpots[i]);
        var marker = new google.maps.Marker({
            position: new google.maps.LatLng(parkingSpots[i].latitude,parkingSpots[i].longitude),
            map: map,
            title: 'Hello World!'
        });
      }
    })
  });
});

//   google.maps.event.addDomListener(window, 'load', initialize);

//   function initialize() {
//     var myOptions = {
//       zoom: 15,
//       mapTypeId: google.maps.MapTypeId.ROADMAP
//     };

//     var map = new google.maps.Map(document.getElementById("map-canvas"), myOptions);

//     navigator.geolocation.getCurrentPosition(function(position) {
//         initialLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
//         map.setCenter(initialLocation);

//         // # Creates a marker at the users current location
//         var marker = new google.maps.Marker({
//           position: initialLocation,
//           map: map,
//         });

//     });

//   };

});