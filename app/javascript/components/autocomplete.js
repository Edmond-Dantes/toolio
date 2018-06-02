function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var userLocation = document.getElementById('user_location');

    if (userLocation) {
      var autocomplete = new google.maps.places.Autocomplete(userLocation, { types: [ 'geocode' ] });
      console.log(autocomplete)
      google.maps.event.addDomListener(userLocation, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
