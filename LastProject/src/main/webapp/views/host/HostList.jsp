<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8"> 
  <title>BizPage Bootstrap Template</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">
 

  <!-- Favicons -->
  <link href="/views/img/favicon.png" rel="icon">
  <link href="/views/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Montserrat:300,400,500,700" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="/views/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="/views/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="/views/lib/animate/animate.min.css" rel="stylesheet">
  <link href="/views/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
  <link href="/views/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="/views/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="/views/css/style.css" rel="stylesheet">
  
  <!-- 데이트 피커 -->
  <link rel="stylesheet" href="/views/datepicker/public/theme/css/t-datepicker.min.css">
  <link rel="stylesheet" href="/views/datepicker/public/theme/css/themes/t-datepicker-teal.css">
  
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?v=3&sensor=false&libraries=places&callback=initAutocomplete&key=AIzaSyAfB2qQnvAuU2YFFqi8hrPWfjJNyxl5kWc" async defer></script>

  <!-- =======================================================
    Theme Name: BizPage
    Theme URL: https://bootstrapmade.com/bizpage-bootstrap-business-template/
    Author: BootstrapMade.com
    License: https://bootstrapmade.com/license/
  ======================================================= -->
  
<style>
	body{
		padding-top: 70px;
	}
	a{
		color:#5e7e9b;
	}
	.paging { list-style: none; }
	.paging li {
		float: left;
		margin-right: 30px;
	}
	.paging li a {
		text-decoration: none;
		 display: block;
		padding: 3px 3px; 
		color: black;
	}

	.paging .disable {
		padding: 3px 3px;
		color: silver;
	}
	.paging .now {
		padding: 3px 3px;
		font-weight: bold;
	} 
</style>

<SCRIPT LANGUAGE="JavaScript">

var contentArray = [];
var contentArray2 = [];
var iConArray = [];
var markers = [];
var iterator = 0;
var markerArray = [];
var map;

var startLat = 37.566535;
var startLng = 126.97796919999996;
var endLat = null;
var endLng = null;

//시작할때 실행되는 맵 세팅
function initialize() {
    var mapOptions = {
        zoom: 11, //지도 줌
        mapTypeId: google.maps.MapTypeId.ROADMAP, //지도 타입(변경 x)
        center: new google.maps.LatLng("${firstLat}", "${firstLng}") //맵이 로딩됬을때 시작지점
    };
    
    var addCircle = new google.maps.Circle({ //원형 그리기
    	center: new google.maps.LatLng("${firstLat}", "${firstLng}"), //원형의 중앙점
    	radius: 11000,			//원형 범위
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
			url: "../getHostGoogle.do",
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
					    		url: markerList[i].icon
					    	},
					    	zIndex: i,
					    	id: 'marker' + markerList[i].m_id
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

function sendMessage(m_id){
	location.href="/insertHostMessage.do?message_receiver="+m_id;
}

function insertHost(frm) {
    
    var str = $("#form").serialize();
    alert(str);
     $.ajax({
      async : true,
      type : "POST",
      dataType : "json",
      data : str,
      url : "../../checkHostJson.do",
      success : function(data) {
         if (data.cnt == 0) {
      		frm.action = "../../insertHost.do";
            frm.submit(); 
          } else {
        	  frm.action = "../../updateHost.do";
              frm.submit(); 
         }
      } 
   });  
};

function deleteHost(m_id) {
	 var con_test = confirm("정말 삭제하시겠습니까?");
	   	if(con_test == true) {
	   		location.href="../deleteHost.do?m_id=" + m_id;
	   	} else{
	   		return false;
	   	}
	
}

function cardOver(m_id) {
	
}

</SCRIPT>
<script>
$(document).ready(function(){
   $('.t-datepicker').tDatePicker({
     autoClose:true,
     durationArrowTop:200,
     limitDateRanges:16,
     numCalendar:2,
     limitNextMonth:2,
     titleCheckIn:'입실날짜',
     titleCheckOut:'퇴실날짜',
     titleDateRange:'일',
     titleDateRanges:'일',
     titleToday:'오늘',
     titleDays:['월','화','수','목','금','토','일'],
     titleMonths:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
     toDayShowTitle:true,
     dateRangesShowTitle:true,
     dateRangesHover:true,
     dateDisabled:[false]
   }).on('eventClickDay',function(e, dataDate){
     var getDateInput = $('.t-datepicker').tDatePicker('getDateInputs');
      document.getElementById("h_startdate").value = getDateInput[0];
      document.getElementById("h_enddate").value = getDateInput[1];
   });
   
   var str = $("#form").serialize();
   $.ajax({
       async : true,
       type : "POST",
       dataType : "json",
       data : str,
       url : "/checkHostJson.do",
       success : function(data) {
          if (data.cnt != 0) {
        	  $("#insertHostBtn").text('호스트 수정');
           } else {
        	   $("#insertHostBtn").text('호스트 등록');
           }
       } 
    }); 
});

</script>
<script>
	function openInsHostModalBtn(){
		if('${member.m_id}' == null || '${member.m_id}' == "") {
			alert("로그인이 필요한 서비스입니다.");
			location.href="/loginMember.do";
		} else {
			$("#insertHost").modal();
		}
	}
	$(document).on("click", "#viewModalBtn", function(){
		if('${member.m_id}' == null || '${member.m_id}' == "") {
			alert("로그인이 필요한 서비스입니다.");
			location.href="/loginMember.do";
		}
	})
</script>


<style>
	.rounded-circle { width: 80px; height: 70px;} 
	.card {float : left;}
</style>


</head>

<body>

  <!--==========================
    Header
  ============================-->
  <header id="header">
    <div class="container-fluid">

      <div id="logo" class="pull-left">
        <h1><a href="views/sub.jsp" class="scrollto">Couch Surfing</a></h1>
      </div>

      <nav id="nav-menu-container">
        <ul class="nav-menu">
        <li class="menu-has-children"><a href="">Drop Down</a>
            <ul>
              <li><a href="#">Drop Down 1</a></li>
              <li><a href="#">Drop Down 3</a></li>
              <li><a href="#">Drop Down 4</a></li>
              <li><a href="#">Drop Down 5</a></li>
            </ul>
          </li>
          <li><a href="#about">쪽지</a></li>
          <li><a href="#portfolio">마이 프로필</a></li>         
        </ul>
      </nav><!-- #nav-menu-container -->
    </div>
  </header><!-- #header -->

 
    

<!-- 키워드로 검색 -->
<form action="../sub.do" method="post">
	<table class="border-none">
		<tr>
			<td>
				<select name="searchCondition">			
					<%-- <c:forEach var="option" items="${conditionMap }">
						<option value="${option.value }">${option.key }
					</c:forEach> --%>
					<option value="find_travler">여행자검색
					<option value="find_host">호스트검색
					<option value="find_event">이벤트검색
					<option value="find_advice">현지정보검색
				</select>
				<input id="autocomplete" placeholder="Enter your address" type="text" name="searchKeyword">
				
				<input class="field" id="lat" type="hidden" name="lat"/>
				<input class="field" id="lng" type="hidden" name="lng"/>
				
				<input type="submit" value="검색">
			</td>
		</tr>
	</table>
</form>


   <!--==========================
      About Us Section
    ============================-->    
<section id="about">
      <div class="container">
      	<h2><strong>Find Host</strong></h2>
		
      	<h5>요청하신 키워드에 관한 게시글 수 : ${countHost }</h5>
      	
      	<div id="map" style="width:760px;height:400px;margin-top:20px; margin:auto;"></div>
      	
      	<br>
      	<form method="post" name="frm">
      	<table class="table">
      	<c:choose>
	      	<c:when test="${empty hostList}">
	      			<tr>
	      				<td>요청하신 도시의 정보가 존재하지 않습니다.</td>
	      			</tr>
	      	</c:when>                    
	      	<c:otherwise>
      		<c:forEach var="list" items="${hostList}">
      		<input type="hidden" name="m_id" value="${list.m_id }" id="${list.m_id }" />
	      		<span class="card" style="width:200px; height: 500px; margin : auto; text-align: center;" onmouseover="cardOver('${list.m_id}')">
				    <img class="card-img-top" src="${list.p_route}" alt="Card image" style="width:200px; height: 200px;">
				    <span class="card-body">
				      <h6 class="card-title">${list.m_id}</h6>
				      <hr />
				      <p class="card-text">${list.m_address}</p>
				      <hr />
				      <button type="button" id="viewModalBtn" class="btn btn-light" data-toggle="modal" data-target="#myModal${list.m_id }">상세보기</button>
				    </span>
			    </span>
      		</c:forEach>
      		</c:otherwise>     		
      	</c:choose>	
      	<!-- ---------------------------------------------------------------- -->
      	<tr>
			<td colspan="4">
				<ol class="paging">
				
				<%--[이전으로]에 대한 사용여부 처리 --%>
				<c:choose>
				<%-- 사용불가(disable) : 첫번째 블록인 경우 --%>
					<c:when test="${pvo.beginPage == 1 }">
						<li class="disable">◀</li>
					</c:when>
				<%--사용가능(enable) : 두번째 이상(첫번째 아닌경우) --%>
					<c:otherwise>
						<li>
							<a href="../getHostList.do?cPage=${pvo.beginPage - 1 }">◀</a>
						</li>
					</c:otherwise>	
				</c:choose>
				
				<%-- 블록내에 표시할 페이지 반복처리(시작페이지~끝페이지)--%>
				<c:forEach var="k" 
						begin="${pvo.beginPage }" end="${pvo.endPage }">
				<c:choose>
					<c:when test="${k == pvo.nowPage }">
						<li class="now">${k }</li>
					</c:when>
					<c:otherwise>
						<li>
							<a href="../getHostList.do?cPage=${k }">${k }</a>
						</li>
					</c:otherwise>
				</c:choose>
				</c:forEach>
				
				<%--[다음으로]에 대한 사용여부 처리 --%>
				<c:choose>	
					<%--사용불가(disable) : endPage가 전체페이지수 보다 크거나 같으면 --%>
					<c:when test="${pvo.endPage >= pvo.totalPage }">
						<li class="disable">▶</li>
					</c:when>
					<%--사용가능(enable) --%>
					<c:otherwise>
						<li>
							<a href="../getHostList.do?cPage=${pvo.endPage + 1 }">▶</a>
						</li>
					</c:otherwise>
				</c:choose>
					<li style="text-align:right;">
						<button type="button" class="btn btn-outline-secondary" onclick="openInsHostModalBtn()">호스트 등록</button>
					</li>
				</ol>
			</td>
		</tr>
      	
      	<!-- ---------------------------------------------------------------- -->
      	</table>
      	</form>
      	
      </div>
    </section><!-- #about -->
		
  <!--==========================
    Footer
  ============================-->
  <footer id="footer">
    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-3 col-md-6 footer-info">
            <h3>Couch Surfing</h3>
            <p>카우치 서핑(Couch Surfing)은 잠을 잘수 있는 쇼파를 의미하는 카우치(Couch)와 파도를 타다는 서핑(Surfing)의 합성어로 숙박 혹은 가이드까지 받을 수 있는, 여행자들을 위한 비영리 커뮤니티 이다.</p>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>Useful Links</h4>
            <ul>
              <li><i class="ion-ios-arrow-right"></i> <a href="#">Home</a></li>
              <li><i class="ion-ios-arrow-right"></i> <a href="#">About us</a></li>
              <li><i class="ion-ios-arrow-right"></i> <a href="#">Services</a></li>
              <li><i class="ion-ios-arrow-right"></i> <a href="#">Terms of service</a></li>
              <li><i class="ion-ios-arrow-right"></i> <a href="#">Privacy policy</a></li>
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 footer-contact">
            <h4>Contact Us</h4>
            <p>
             	 비트캠프 신촌센터 <br>
              Seoul, NY 535022<br>
              Korea <br>
              <strong>Phone:</strong> 010-5575-4786<br>
              <strong>Email:</strong> test@test.com<br>
            </p>

            <div class="social-links">
              <a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
              <a href="#" class="facebook"><i class="fa fa-facebook"></i></a>
              <a href="#" class="instagram"><i class="fa fa-instagram"></i></a>
              <a href="#" class="google-plus"><i class="fa fa-google-plus"></i></a>
              <a href="#" class="linkedin"><i class="fa fa-linkedin"></i></a>
            </div>

          </div>

          <div class="col-lg-3 col-md-6 footer-newsletter">
            <h4>Couch Surfing tip</h4>
            <p>만나는 사람들과 대화를 많이 하려고 시도하세요.
				그 의사소통보다 더 중요한 건 안전이다. 인증이 된 멤버인지, 타인들이 남긴 레퍼런스(리뷰)는 긍정적인지, 올려둔 사진은 괜찮은지... 감각을 키워가자.
				호스트든 게스트든 집에서는 위생을 유지하도록 하자.</p>
          </div>

        </div>
      </div>
    </div>

    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong>Couch Surfing</strong>. All Rights Reserved
      </div>
      <div class="credits">
        <!--
          All the links in the footer should remain intact.
          You can delete the links only if you purchased the pro version.
          Licensing information: https://bootstrapmade.com/license/
          Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=BizPage
        -->
        Best <a href="https://bootstrapmade.com/">Bootstrap Templates</a> by BootstrapMade
      </div>
    </div> 
  </footer><!-- #footer -->

  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
  
  <!-- The Modal -->
	<c:forEach var="list" items="${hostList}">
	  <div class="modal fade" id="myModal${list.m_id}">
	    <div class="modal-dialog modal-lg">
	      <div class="modal-content">
	      
	        <!-- Modal Header -->
	        <div class="modal-header">
	          <h4 class="modal-title">&nbsp;&nbsp;${list.m_id } 님의 Host profile</h4>
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        
	        <!-- Modal body -->
	        <div class="modal-body">
	          <table class="table">
	          	<tr class="text-center">
	          		<td><img class="rounded" style="width: 300px; height: 300px; margin: auto;" src="${list.p_route }"></td>
	          		<td>최대 방문인원<br><br>선호성별<br><br>흡연여부<br><br>반려동물<br><br>자녀여부<br><br>입실날짜<br><br>퇴실날짜</td>
	          		<td>${list.h_maximumguest} 명<br><br>${list.h_gender}<br><br>${list.h_smoke}<br><br>${list.h_haspet}<br><br>${list.h_haschild}<br><br>${list.h_startdate}<br><br>${list.h_enddate}</td>
	          	</tr>
	          	<tr class="text-center">
	          		<td>숙소 형태</td>
	          		<td colspan="2">${list.h_roomtype}</td>
	          	</tr>
	          	<tr class="text-center">
	          		<td>위치</td>
	          		<td colspan="2">${list.m_address}</td>
	          	</tr>
	          	<tr class="text-center">
	          		<td>지켜야할 규칙</td>
	          		<td colspan="2">${list.h_rule}</td>
	          	</tr>
	          	
	          </table>
	        </div>
	
	        <!-- Modal footer -->
	        <div class="modal-footer">
	        <form name="frm">                                                           <!-- onclick="../insertMessage.do?message_receiver=${list.m_id}" -->
	          <button type="button" class="btn btn-outline-secondary" data-dismiss="modal" onclick='sendMessage("${list.m_id}")'>Send Message</button>
	        </form>   
	          <c:if test="${list.m_id eq member.m_id}">
	            <button type="button" class="btn btn-outline-secondary" id="hostRegistBtn" data-dismiss="modal" onclick='deleteHost("${list.m_id}")'>등록해제</button>
	          </c:if>
	        </div>
	        
	      </div>
	    </div>
	  </div>
	</c:forEach>
	
	
	<!-- The Modal -->
  <div class="modal fade" id="insertHost">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">호스트 등록</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <div class="row">
            <div class="col-md-12">
              <form method="POST" id="form">
                    <input id="${member.m_id}" type="hidden" class="form-control" name="m_id" value="${member.m_id }">
                    
                    <div class="form-group row">
                         <label for="h_startdate" class="col-4 col-form-label">입실/퇴실 날짜</label> 
                         <div class="col-8">
                           <div class="t-datepicker">
                             <div class="t-check-in"></div>
                             <div class="t-check-out"></div>
                           </div>
                         </div>
                         <input id="h_startdate" type="hidden" class="form-control" name="h_startdate" required data-eye> 
                         <input id="h_enddate" type="hidden" class="form-control" name="h_enddate" required data-eye> 
                       </div>
                    
                      <div class="form-group row">
                       <label for="h_maximumguest" class="col-4 col-form-label">최대 투숙객</label> 
                       <div class="col-8">
                         <select class="form-control" id="h_maximumguest" name="h_maximumguest">
	                         <option selected="selected">1</option>
	                         <option>2</option>
	                         <option>3</option>
	                         <option>4</option>
                    	 </select>
                                                          
                       </div>
                      </div>
                              
                      <div class="form-group row">
                        <label for="h_gender" class="col-4 col-form-label">선호 성별</label> 
                          <div class="col-8">
                           <select class="form-control" id="h_gender" name="h_gender">
                          	 <option selected="selected">남자</option>
                       		 <option>여자</option>
                           </select>
                          </div>
                      </div>
                           
                      <div class="form-group row">
                        <label for="h_smoke" class="col-4 col-form-label">흡연 가능 여부</label> 
                        <div class="col-8">
                            <select class="form-control" id="h_smoke" name="h_smoke">
                       		  <option selected="selected">X</option>
                         	  <option>O</option>
                            </select>
                        </div>
                       </div>
                       
                       <div class="form-group row">
                         <label for="h_haspet" class="col-4 col-form-label">펫 유무</label> 
                         <div class="col-8">
                         <select class="form-control" id="h_haspet" name="h_haspet">
                       		<option selected="selected">X</option>
                          	<option>O</option>
                         </select>
                         </div>
                       </div>
                        
                       <div class="form-group row">
                         <label for="h_haschild" class="col-4 col-form-label">자녀 유무</label> 
                         <div class="col-8">
                           <select class="form-control" id="h_haschild" name="h_haschild">
                     	     <option selected="selected">X</option>
                             <option>O</option>
                           </select>
                         </div>
                       </div>
                           
                       <div class="form-group row">
                         <label for="h_roomtype" class="col-4 col-form-label">방 종류</label> 
                         <div class="col-8">
                           <select class="form-control" id="h_roomtype" name="h_roomtype">
	                          <option selected="selected">싱글 베드</option>
	                          <option>더블 베드</option>
	                          <option>퀸 베드</option>
                              <option>소파</option>
                           </select>
                         </div>
                       </div>
                        
                       <div class="form-group row">
                         <label for="h_rule" class="col-4 col-form-label">숙소 이용시 주의사항</label> 
                         <div class="col-8">
                            <textarea rows="5" cols="10" id="h_rule" name="h_rule" class="form-control"></textarea>
                         </div>
                       </div>
                        
                              
                       <div class="modal-footer">
                       	 <div class="form-group m-0">
			               <button type="button" class="btn btn-outline-secondary" data-dismiss="modal" onclick="insertHost(this.form)">완료</button>
			               <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Close</button>
			             </div>
			           </div>
                     </form>
               </div>
           </div>
        </div>

        <!-- Modal footer -->
        
      </div>
    </div>
  </div>


<!--Modal: Login with Avatar Form-->
<div class="modal fade" id="modalLoginAvatar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog cascading-modal modal-avatar modal-sm" role="document">
    <!--Content-->
    <div class="modal-content">

      <!--Header-->
      <div class="modal-header">
        <img src="https://mdbootstrap.com/img/Photos/Avatars/img%20%281%29.jpg" alt="avatar" class="rounded-circle img-responsive">
      </div>
      <!--Body-->
      <div class="modal-body text-center mb-1">

        <h5 class="mt-1 mb-2">Maria Doe</h5>

        <div class="md-form ml-0 mr-0">
          <input type="password" type="text" id="form29" class="form-control form-control-sm validate ml-0">
          <label data-error="wrong" data-success="right" for="form29" class="ml-0">Enter password</label>
        </div>

        <div class="text-center mt-4">
          <button class="btn btn-cyan mt-1">Login <i class="fas fa-sign-in ml-1"></i></button>
        </div>
      </div>

    </div>
    <!--/.Content-->
  </div>
</div>
<!--Modal: Login with Avatar Form-->

<div class="text-center">
  <a href="" class="btn btn-default btn-rounded" data-toggle="modal" data-target="#modalLoginAvatar">Launch
    Modal Login with Avatar</a>
</div>


  <!-- JavaScript Libraries -->
  <script src="/views/lib/jquery/jquery.min.js"></script>
  <script src="/views/lib/jquery/jquery-migrate.min.js"></script>
  <script src="/views/lib/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="/views/lib/easing/easing.min.js"></script>
  <script src="/views/lib/superfish/hoverIntent.js"></script>
  <script src="/views/lib/superfish/superfish.min.js"></script>
  <script src="/views/lib/wow/wow.min.js"></script>
  <script src="/views/lib/waypoints/waypoints.min.js"></script>
  <script src="/views/lib/counterup/counterup.min.js"></script>
  <script src="/views/lib/owlcarousel/owl.carousel.min.js"></script>
  <script src="/views/lib/isotope/isotope.pkgd.min.js"></script>
  <script src="/views/lib/lightbox/js/lightbox.min.js"></script>
  <script src="/views/lib/touchSwipe/jquery.touchSwipe.min.js"></script>
  <!-- Contact Form JavaScript File -->
  <script src="/views/contactform/contactform.js"></script>
  <script src="/views/datepicker/public/theme/js/t-datepicker.min.js"></script>
  
  <!-- Template Main Javascript File -->
  <script src="/views/js/main.js"></script>

</body>
</html>