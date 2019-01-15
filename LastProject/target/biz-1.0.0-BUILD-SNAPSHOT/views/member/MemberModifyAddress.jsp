<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>주소 변경</title>

<script>
	function ModifyAddress(frm) {
		if (frm.m_address.value == "" || frm.m_address.value == null) {
			alert("주소를 기입하세요.");
			frm.m_address.value = ""; 
			frm.m_address.focus();
        } else {
			alert("기입하신 주소로 변경이 되었습니다.");
			frm.action = "../../ModifyAddressMember.do";
		 	frm.submit();   
		 	return false;
        }
	};
		
</script>

	<meta charset="utf-8">
	<meta name="author" content="Kodinger">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>주소 변경 페이지</title>
	<link rel="stylesheet" type="text/css" href="views/bootstrapModal/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="views/cssModal/my-login.css">


<script>	
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
</script>

<script src="https://maps.googleapis.com/maps/api/js?v=3&sensor=false&libraries=places&callback=initAutocomplete&key=AIzaSyAfB2qQnvAuU2YFFqi8hrPWfjJNyxl5kWc" async defer></script>

</head>

<body class="my-login-page">
	<section class="h-100">
		<div class="container h-100">
			<div class="row justify-content-md-center h-100">
				<div class="card-wrapper">
					<div class="brand">
					</div>
					<div class="card fat">
						<div class="card-body">
							<h4 class="card-title" style="text-align : center;">변경할 주소</h4>
							<form method="POST" class="my-login-validation" id="ModifyPhone">
								<input id="m_id" type="hidden" class="form-control" name="m_id" value="${member.m_id }" required autofocus>
								
								
								<div id="locationField" class="form-group">
									<label for="address">변경할 주소를 입력하세요.</label>
									<input id="autocomplete" type="text" class="form-control" name="m_address">
									<input class="field" id="lat" type="hidden" class="form-control" name="lat"/>
									<input class="field" id="lng" type="hidden" class="form-control" name="lng"/>
								</div>
								
								
								
									
								<div class="form-group m-0">
									<button type="button" class="btn btn-primary btn-block" onclick="ModifyAddress(this.form)">
										주소 변경
									</button>
								</div>
					
							</form>
						</div>
					</div>
					<div class="footer">
						Copyright &copy; 2018 &mdash; 국봉쓰
					</div>
				</div>
			</div>
		</div>
	</section>

	<script src="js/jquery.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="js/my-login.js"></script>
</body>
</html>