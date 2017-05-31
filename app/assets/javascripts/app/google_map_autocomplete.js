$(document).ready(function() {
  var team_location = $('#team_location').get(0);
  var user_city = $('#user_city').get(0);

  if (team_location) {
    var autocomplete = new google.maps.places.Autocomplete(team_location, { types: ['geocode'] });
    google.maps.event.addDomListener(team_location, 'keydown', function(e) {
      if (e.keyCode == 13) {
        e.preventDefault(); // Do not submit the form on Enter.
      }
    });
  }

  if (user_city) {
    var autocomplete = new google.maps.places.Autocomplete(user_city, { types: ['geocode'] });
    google.maps.event.addDomListener(user_city, 'keydown', function(e) {
      if (e.keyCode == 13) {
        e.preventDefault(); // Do not submit the form on Enter.
      }
    });
  }

});
