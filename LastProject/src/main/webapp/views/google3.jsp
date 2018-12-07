<!doctype html>
<html>
<head>
    <meta charset="utf-8" />
    <title>googlemap v3 </title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places&callback=initAutocomplete&key=AIzaSyAfB2qQnvAuU2YFFqi8hrPWfjJNyxl5kWc"></script>
</head>
<SCRIPT LANGUAGE="JavaScript">

var contentArray = [];
var contentArray2 = [];
var iConArray = [];
var markers = [];
var iterator = 0;
var markerArray = [];
var map;
 

 contentArray[0] = "M_ID1";
 contentArray[1] = "M_ID2";
 contentArray[2] = "M_ID3";
 contentArray[3] = "M_ID4";
 contentArray[4] = "M_ID5";
 contentArray[5] = "M_ID6";
 contentArray[6] = "M_ID7";
 contentArray[7] = "M_ID8";
 contentArray[8] = "M_ID9";
 contentArray[9] = "M_ID10";
 contentArray[10] = "Gyong";
 contentArray[11] = "SEOUL";
 
 
 contentArray2[0] = "M_ID1";
 contentArray2[1] = "M_ID2";
 contentArray2[2] = "M_ID3";
 contentArray2[3] = "M_ID4";
 contentArray2[4] = "M_ID5";
 contentArray2[5] = "M_ID6";
 contentArray2[6] = "M_ID7";
 contentArray2[7] = "M_ID8";
 contentArray2[8] = "M_ID9";
 contentArray2[9] = "M_ID10";
 contentArray2[10] = "Gyong";
 
// marker icon
/*  iConArray[0] = "http://maps.google.com/mapfiles/ms/micons/yellow-dot.png";
 iConArray[1] = "http://maps.google.com/mapfiles/ms/micons/yellow-dot.png";
 iConArray[2] = "http://maps.google.com/mapfiles/ms/micons/yellow-dot.png";
 iConArray[3] = "http://maps.google.com/mapfiles/ms/micons/yellow-dot.png";
 iConArray[4] = "http://maps.google.com/mapfiles/ms/micons/yellow-dot.png";
 iConArray[5] = "http://maps.google.com/mapfiles/ms/micons/yellow-dot.png";
 iConArray[6] = "http://maps.google.com/mapfiles/ms/micons/yellow-dot.png";
 iConArray[7] = "http://maps.google.com/mapfiles/ms/micons/yellow-dot.png";
 iConArray[8] = "http://maps.google.com/mapfiles/ms/micons/yellow-dot.png";
 iConArray[9] = "http://maps.google.com/mapfiles/ms/micons/yellow-dot.png";
 iConArray[10] = "http://maps.google.com/mapfiles/ms/micons/yellow-dot.png"; */
 
/*
var markerArray = [ new google.maps.LatLng(40.3938,-3.7077)
, new google.maps.LatLng(40.45038,-3.69803)
, new google.maps.LatLng(40.45848,-3.69477)
, new google.maps.LatLng(40.40672,-3.68327)
, new google.maps.LatLng(40.43672,-3.62093)
, new google.maps.LatLng(40.46725,-3.67443)
, new google.maps.LatLng(40.43794,-3.67228)
, new google.maps.LatLng(40.46212,-3.69166)
, new google.maps.LatLng(40.41926,-3.70445)
, new google.maps.LatLng(40.42533,-3.6844)
];
*/
 
markerArray[0] = new google.maps.LatLng(37.558085, 126.984240);
markerArray[1] = new google.maps.LatLng(37.548200, 126.983523);
markerArray[2] = new google.maps.LatLng(37.550862, 126.981354);
markerArray[3] = new google.maps.LatLng(37.558350, 126.985702);
markerArray[4] = new google.maps.LatLng(37.555726, 126.994304);
markerArray[5] = new google.maps.LatLng(37.542687, 127.005739);
markerArray[6] = new google.maps.LatLng(37.539314, 126.997142);
markerArray[7] = new google.maps.LatLng(37.545269, 127.001498);
markerArray[8] = new google.maps.LatLng(37.555272, 126.996252);
markerArray[9] = new google.maps.LatLng(37.558886, 126.986356);
markerArray[10] = new google.maps.LatLng(37.6659753, 127.27930229999993); //경기도남양주

//초기 실행 함수
function initialize() {
    var mapOptions = {
        zoom: 13,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        center: new google.maps.LatLng(37.551630, 126.991299)
    };
    
    var addCircle = new google.maps.Circle({
    	center: new google.maps.LatLng(37.551630, 126.991299),
    	radius: 1800,
    	strokeColor: "GREEN",
    	strokeOpacity: 0.8,
    	strokeWeight: 2,
    	fillColor: "GREEN",
    	fillOpacity: 0.3
    });
 
    map = new google.maps.Map(document.getElementById('map'),mapOptions);
    addCircle.setMap(map);
 
    for (var i = 0; i < markerArray.length; i++) {
        addMarker();
    }

}

// 마커 관련 함수
var placeSearch, autocomplete;

function addMarker() {
    var marker = new google.maps.Marker({
        position: markerArray[iterator],
        map: map,
        draggable: false,
        icon: "http://maps.google.com/mapfiles/ms/micons/yellow-dot.png",
    });
    markers.push(marker);
	 
	var infowindow = new google.maps.InfoWindow({
		content: contentArray[iterator]
	});
    
    var infowindow2 = new google.maps.InfoWindow({
        content: contentArray2[iterator]
	});
    
   	infowindow.open(map, marker);
    
    google.maps.event.addListener(marker, 'click', function() {
    	infowindow2.setZIndex(30);
    	infowindow2.open(map,marker);
    });
    
    iterator++;
    
}

google.maps.event.addDomListener(window, 'load', initialize);

//주소 좌표 변환 함수
var placeSearch, autocomplete;

function initAutocomplete() {
  autocomplete = new google.maps.places.Autocomplete((document.getElementById('autocomplete')),{types: ['geocode']});
  autocomplete.addListener('place_changed', fillInAddress);
}

function fillInAddress() {
  var place = autocomplete.getPlace();
    document.getElementById("lat").value=place.geometry.location.lat();
    document.getElementById("lng").value=place.geometry.location.lng();
}

//중심이동
function move() {
  var moveTo = new google.maps.LatLng(document.getElementById("lat").value, document.getElementById("lng").value);
  map.panTo(moveTo);
}

</SCRIPT>
<body>
	<form action="#" onsubmit="move(); return false">
		<div id="locationField">
		  <input id="autocomplete" placeholder="Enter your address" type="text">
		</div>
		<input type="submit" value="move"/>
	</form>
	
	<input class="field" id="lat" type="hidden"/>
	<input class="field" id="lng" type="hidden"/>
	
	<div id="map" style="width:760px;height:400px;margin-top:20px;"></div>
</body>
</html>