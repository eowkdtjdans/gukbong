<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8" />
    <title>googlemap v3 </title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?v=3&sensor=false&libraries=places&callback=initAutocomplete&key=AIzaSyAfB2qQnvAuU2YFFqi8hrPWfjJNyxl5kWc" async defer></script>
    <script src="/views/google/markerclusterer.js"></script>
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

//시작할때 실행되는 맵 세팅
function initialize() {
    var mapOptions = {
        zoom: 14, //지도 줌
        mapTypeId: google.maps.MapTypeId.ROADMAP, //지도 타입(변경 x)
        center: new google.maps.LatLng(37.566535, 126.97796919999996) //맵이 로딩됬을때 시작지점
    };
    
    var addCircle = new google.maps.Circle({ //원형 그리기
    	center: new google.maps.LatLng(37.566535, 126.97796919999996), //원형의 중앙점
    	radius: 1800,			//원형 범위
    	strokeColor: "GREEN",	//테두리 색
    	strokeOpacity: 0.8, 	//테두리 투명도
    	strokeWeight: 2,		//테두리 굵기
    	fillColor: "GREEN", 	//원형 속 색
    	fillOpacity: 0.3		//원형 속 투명도
    });
 
    map = new google.maps.Map(document.getElementById('map'),mapOptions); //맵 생성
    
    //동적 마크생성을 위한 좌표체크
	google.maps.event.addListener(map, 'idle', function(){ //시작지점의 좌표 체크
		startLat = map.getBounds().getSouthWest().lat();
		startLng = map.getBounds().getSouthWest().lng();
		endLat = map.getBounds().getNorthEast().lat();
		endLng = map.getBounds().getNorthEast().lng();
		viewMarker();
	});
 	
	google.maps.event.addListener(map, 'zoom_changed', function() { //줌이 바뀔때 좌표 체크
		startLat = map.getBounds().getSouthWest().lat();
		startLng = map.getBounds().getSouthWest().lng();
		endLat = map.getBounds().getNorthEast().lat();
		endLng = map.getBounds().getNorthEast().lng();

		viewMarker();
	});

	google.maps.event.addListener(map, 'dragend', function(){ //드래그해서 바뀔때 좌표 체크
		startLat = map.getBounds().getSouthWest().lat();
		startLng = map.getBounds().getSouthWest().lng();
		endLat = map.getBounds().getNorthEast().lat();
		endLng = map.getBounds().getNorthEast().lng();

		viewMarker();
	});
	
    addCircle.setMap(map); //원형 생성
    
}

//마커생성 함수
function viewMarker() {
	if(startLat)
	{
		$.ajax({
			type: "GET",
			url: "/google.do",
			 beforeSend: function() {			
				fnRemoveMarker();
			 },
			success: function (json) {
				var markerList = json;
				var listLen = markerList.length;
				for(var i=0; i<listLen; i++){
					if (parseFloat(startLat) <= parseFloat(markerList[i].lat) && parseFloat(startLng) <= parseFloat(markerList[i].lng) && parseFloat(endLat) >= parseFloat(markerList[i].lat) && parseFloat(endLng) >= parseFloat(markerList[i].lng))
					{
						var marker = new google.maps.Marker({
							position: new google.maps.LatLng(markerList[i].lat,markerList[i].lng),
							map: map,
							draggable: false,
							html: markerList[i].cont,
							label: {
					            text: markerList[i].m_name, // $100,000
					            color: 'black',
					            fontWeight: 'bold'
					        },
					        icon: {
					    		url: markerList[i].icon,
					    	}
						});
						markers.push(marker);

						var infowindow = new google.maps.InfoWindow() //정보창 생성

						google.maps.event.addListener(marker, "click", function () { //마커 클릭했을때 정보창 출력
							infowindow.setContent(this.html);
							infowindow.open(map, this);
						});
						
					}
				}
			}
		});
		
	}
}

function fnRemoveMarker() //마커 지우기
{
	for (var i = 1; i < markers.length; i++) {
		markers[i].setMap(null);
	}
}

$( window ).load(function() { //jsp가 실행되면 아래 함수 시작
	initialize();
});

//주소를 좌표로 변환
var placeSearch, autocomplete;

function initAutocomplete() {
  autocomplete = new google.maps.places.Autocomplete((document.getElementById('autocomplete')),{types: ['geocode']});
  autocomplete.addListener('place_changed', fillInAddress);
}

function fillInAddress() { //lat 와 lng 값을 넘겨줄 input 태그에 값 넣어주기
  var place = autocomplete.getPlace();
    document.getElementById("lat").value=place.geometry.location.lat();
    document.getElementById("lng").value=place.geometry.location.lng();
}

//좌표로 이동
function move() {
  var moveTo = new google.maps.LatLng(document.getElementById("lat").value, document.getElementById("lng").value);
  map.panTo(moveTo);
}

</SCRIPT>
<style>
	.rounded-circle { width: 80px; height: 70px;} 
</style>
<body>
<div class="container">
	<form action="#" onsubmit="move(); return false" name="frm1">
		<div id="locationField">
		  <input id="autocomplete" placeholder="Enter your address" type="text">
		</div>
		<input type="submit" value="move"/>
	</form>
	
	<input class="field" id="lat" type="hidden"/>
	<input class="field" id="lng" type="hidden"/>
	
	<div id="map" style="width:760px;height:400px;margin-top:20px;"></div>
</div>
</body>
</html>