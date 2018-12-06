<!DOCTYPE html>
<html>
<head>
	<style>
	#map {
		height: 250px;
		width: 300px;
		
		display: inline-block;
	}
	</style>
</head>
<body>
<div id="map"></div>
<script>
	function initMap() {
		var uluru = {lat: 13.759371, lng: 100.498293};
		var map = new google.maps.Map(document.getElementById('map'), {
		zoom: 19,
		center: uluru
		});
		var marker = new google.maps.Marker({
		position: uluru,
		map: map
		});
	}
</script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCzGwljrVKYTGaY7RfRjT8Ep4w2W4jV2Z4&callback=initMap"></script>
</body>
</html>