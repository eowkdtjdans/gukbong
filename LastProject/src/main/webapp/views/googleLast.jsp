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

var startLat = null;
var startLng = null;
var endLat = null;
var endLng = null;

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
    
 	// 처음 맵 로드 완료 후 지도 범위 확인을 위해 좌표 인식.
	google.maps.event.addListener(map, 'idle', function(){
		startLat = map.getBounds().getSouthWest().lat();
		startLng = map.getBounds().getSouthWest().lng();
		endLat = map.getBounds().getNorthEast().lat();
		endLng = map.getBounds().getNorthEast().lng();
		viewMarker();
	});
 	
	// 줌 또는 드래그, 화면이동 등 지도 정보 변경시에 화면내에 마커만 표시하기위해 좌표 인식 s
	google.maps.event.addListener(map, 'zoom_changed', function() {
		startLat = map.getBounds().getSouthWest().lat();
		startLng = map.getBounds().getSouthWest().lng();
		endLat = map.getBounds().getNorthEast().lat();
		endLng = map.getBounds().getNorthEast().lng();

		viewMarker();
	});

	google.maps.event.addListener(map, 'dragend', function(){
		startLat = map.getBounds().getSouthWest().lat();
		startLng = map.getBounds().getSouthWest().lng();
		endLat = map.getBounds().getNorthEast().lat();
		endLng = map.getBounds().getNorthEast().lng();

		viewMarker();
	});
	
    addCircle.setMap(map);
 
    for (var i = 0; i < markerArray.length; i++) {
        addMarker();
    }

}



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

//드롭 마커 보기
function viewMarker() {
	if(startLat)
	{
		$.ajax({
			type: "GET",
			url: "google.js",
			 beforeSend: function() {			
				fnRemoveMarker();	// 조회 전 기존 마커 제거
			 },
			success: function (json) {
				var markerList = $.parseJSON(json);
				var listLen = markerList.length;
				for(var i=0; i<listLen; i++){
					if (parseFloat(startLat) <= parseFloat(markerList[i].lat) && parseFloat(startLng) <= parseFloat(markerList[i].lng) && parseFloat(endLat) >= parseFloat(markerList[i].lat) && parseFloat(endLng) >= parseFloat(markerList[i].lng))
					{
						var marker = new google.maps.Marker({
							position: new google.maps.LatLng(markerList[i].lat,markerList[i].lng),
							map: map,
							draggable: false,
							icon: markerList[i].icon,
							html: markerList[i].cont
						});
						markers.push(marker);

						var infowindow = new google.maps.InfoWindow()

						google.maps.event.addListener(marker, "click", function () {
							infowindow.setContent(this.html);
							infowindow.open(map, this);
						});
						
					}
				}
			}
		});
		
	}
}

// 마커 제거 함수
function fnRemoveMarker()
{
	for (var i = 1; i < markers.length; i++) {
		markers[i].setMap(null);
	}
}

$( window ).load(function() {
	initialize();
});

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