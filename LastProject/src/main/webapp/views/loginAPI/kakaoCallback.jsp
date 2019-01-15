<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   <meta charset="utf-8">
   <meta name="author" content="Kodinger">
   <meta name="viewport" content="width=device-width,initial-scale=1">
   <title>회원가입</title>
   <link rel="stylesheet" type="text/css" href="views/bootstrapModal/css/bootstrap.min.css">
   <link rel="stylesheet" type="text/css" href="views/cssModal/my-login.css">
   
   <link rel="stylesheet" href="views/datepicker/public/theme/css/t-datepicker.min.css">
   <link rel="stylesheet" href="views/datepicker/public/theme/css/themes/t-datepicker-teal.css">
   <!-- blue, bluegrey, cyan, green, lime, main, orange, purple, teal, yellow -->
   
   <script src="http://code.jquery.com/jquery-latest.min.js"></script>
   <script src="views/datepicker/public/theme/js/t-datepicker.min.js"></script>

<script>
    function phoneCheck(frm) {
		var phonecheck = 0;
		var m_phone = $('#m_phone').val();
		alert("m_phone : " + m_phone);
		var phone = document.getElementById("m_phone").value;
		var phoneCheck = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
		$.ajax({
			async: true,
			type : 'POST',
			dataType : "json",
			data : m_phone,
			contentType: "application/json; charset=UTF-8",
			url : '../../checkPhoneJson.do',
			
			   success : function(data) {
				  console.log("data.cnt : " + data.cnt);
				   if(phoneCheck.test(phone)==false || phone == ""){
						alert("핸드폰번호를 제대로 기입하세요.");
						 $("#m_phone").focus();
		                 $("#m_phone").val("");
						return false;
				   } else if (data.cnt >= 1) {
	                   alert("핸드폰 번호가 존재합니다.");
	                   $("#m_phone").focus();
	                   $("#m_phone").val("");
	                   phoneck = 0;
	                   return false;
	                } else if(data.cnt == 0) {
	                  alert("등록가능한 핸드폰 번호입니다.");
	                  //아이디가 중복하지 않으면  idck = 1 
	                  phoneck = 1;
	                 return false;
	             }
	           },
	           error : function(error) {
	               
	               alert("error : " + error);
	           }
	       });
	 };
/* *******************************************************************************
*************************************************************************************/ 
 function idCheck(frm) {
	 var idcheck = 0;
	 var m_id = $('#m_id').val();
	 var email = document.getElementById("m_id").value;
	 var emailCheck = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	$.ajax({
		async: true,
		type : 'POST',
		dataType : "json",
		data : m_id,
	    contentType: "application/json; charset=UTF-8",  
		url : '../../checkMemberJson.do',
		
		   success : function(data) {
			   console.log("data.cnt : " + data.cnt);
			   if(emailCheck.test(email)==false || email == ""){
					alert("이 메일형식이 올바르지 않습니다.");
					 $("#m_id").focus();
	                 $("#m_id").val("");
					return false;
			   } else if (data.cnt >= 1) {
                   alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
                   $("#m_id").focus();
                   $("#m_id").val("");
                   idck = 0;
                   return false;
                } else if (data.cnt == 0) {
                  alert("사용가능한 아이디입니다.");
                  //아이디가 중복하지 않으면  idck = 1 
                  idck = 1;
                 return false;
             }
           },
           error : function(error) {
               
               alert("error : " + error);
           }
       });
}; 
/* *******************************************************************************
*************************************************************************************/  

function register(frm) {
	var nameCheck = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;

	var name = frm.m_name.value;
	
	if(confirm("회원가입을 하시겠습니까?")){
		if(idck==0){
            alert('아이디 중복체크를 해주세요');
            return false;
        } if(phoneck==0) {
            	alert("핸드폰 중복체크를 해주세요");
            	return false;
        } else if (frm.m_pwd.value == "" || frm.m_pwd.value == null) {
			alert("비밀번호를 기입하세요.");
			frm.m_pwd.value = ""; 
			frm.m_pwd.focus();
        } else if (frm.m_pwd.value.length<8 || frm.m_pwd.value.length>16) {
        	alert("비밀번호를 8~16자리로 설정해주세요.");
        	frm.m_pwd.value = ""; 
			frm.m_pwd.focus();
		} /* else if (frm.m_name.value == "" || frm.m_name.value == null) {
			alert("성함을 기입하세요.");
			frm.m_name.value = ""; 
			frm.m_name.focus();
		} */ else if (nameCheck.test(name)==false || frm.m_name.value =="") {
			alert("성함은 한글 또는 영어로 작성해주세요.");
			frm.m_name.value = ""; 
			frm.m_name.focus();
		} else if (frm.m_birthday.value == "" || frm.m_birthday.value == null) {
			alert("생년월일을 선택하세요..");
			frm.m_birthday.value = ""; 
			frm.m_birthday.focus();
		} else if (frm.m_address.value == "" || frm.m_address.value == null) {
			alert("주소를 기입하세요.");
			frm.m_address.value = ""; 
			frm.m_address.focus();
        }else{
        alert("이메일 인증을 완료해야 사이트를 이용하실 수 있습니다. 이메일을 확인해주세요.");
     	frm.action = "../../insertMember.do"; //로그인 작업 처리
		frm.submit(); 
        }
    }

};
</script>   
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


/* picker만 생성 */
$(document).ready(function(){
   $('.t-datepicker').tDatePicker({
     autoClose:false,
     durationArrowTop:200,
     formatDate:'yyyy-mm-dd',
     startDate:document.getElementById("year").value + "-01-01",
     limitPrevMonth:0,
     limitNextMonth:12,
     limitDateRanges:60,
     numCalendar:1,
     titleMonthsLimitShow:12,
     dateRangesHover: false
   }).on('eventClickDay',function(e, dataDate){
      var getDateInput = $('.t-datepicker').tDatePicker('getDateInput');
      document.getElementById("m_birthday").value = getDateInput;
   })
});

function yearChange() {
   $('.t-datepicker').tDatePicker({
     autoClose:false,
     durationArrowTop:200,
     formatDate:'yyyy-mm-dd',
     startDate:document.getElementById("year").value + "-01-01",
     limitPrevMonth:0,
     limitNextMonth:12,
     limitDateRanges:60,
     numCalendar:1,
     titleMonthsLimitShow:12,
     dateRangesHover: false
   }).on('eventClickDay',function(e, dataDate){
      var getDateInput = $('.t-datepicker').tDatePicker('getDateInput');
      document.getElementById("m_birthday").value = getDateInput;
   })
}

$('.t-datepicker').tDatePicker({
}).on('clickDateCI',function(e, dateCI) {
   var getDateInput = $('.t-datepicker').tDatePicker('getDateInput');
   document.getElementById("m_birthday").value = getDateInput;
}) 

</script>

<script src="https://maps.googleapis.com/maps/api/js?v=3&sensor=false&libraries=places&callback=initAutocomplete&key=AIzaSyAfB2qQnvAuU2YFFqi8hrPWfjJNyxl5kWc" async defer></script>

<script type="text/javascript">
$(document).ready(function() {
    var name = sessionStorage.getItem("kakaoNameSession");
    var email = sessionStorage.getItem("kakaoEmailSession");
   
   
     //$("#kakaoId").value = email;
    document.getElementById("m_id").value=sessionStorage.getItem("kakaoEmailSession");
    document.getElementById("kakaoName").value=sessionStorage.getItem("kakaoNameSession");
   
});
</script>

</head>
<body class="my-login-page">
   <section class="h-100">
      <div class="container h-100">
         <div class="row justify-content-md-center h-100">
            <div class="card-wrapper">
               <div class="card fat">
                  <div class="card-body">
                     <h4 class="card-title" style="text-align : center;">회원가입</h4>
                     <form method="POST" class="my-login-validation" id="form">
                        <div class="form-group">
                           <label for="text">아이디</label>
                           <input readonly="readonly" id="m_id" type="text" class="form-control" name="m_id">
                        </div>
                        
                         <div class="form-group m-0">
                           <button type="button" class="btn btn-default btn-block" onclick="idCheck(this.form)" >
                              아이디 중복확인
                           </button>
                        </div>
                        

                        <div class="form-group">
                           <label for="password">비밀번호</label>
                           <input id="m_pwd" type="password" class="form-control" name="m_pwd">
                        </div>
                  
                        <div class="form-group">
                           <label for="name">성함</label>
                           <input readonly="readonly" id="kakaoName" type="text" class="form-control" name="m_name">
                        </div>
                  
                        <div class="form-group">
                           <label for="text">핸드폰</label>
                           <input id="m_phone" type="text" class="form-control" name="m_phone" required data-eye>
                        </div>
                        
                        <div class="form-group m-0"> 
                           <button type="button" class="btn btn-default btn-block" onclick="phoneCheck(this.form)" >
                              핸드폰 중복확인
                           </button>
                        </div>
                       
                        <div class="form-group">
                           <label for="text">성별</label>
                           <input id="m_gender" readonly="readonly" type="text" class="form-control" name="m_gender" required data-eye>
                        </div>
                  
                        <c:set var="yearStart" value="1969"/>
                        <label for="birthday">생년월일</label>
                        <select id="year" onchange="yearChange()">
                           <c:forEach begin="1969" end="1999" step="1">
                              <c:set var="yearStart" value="${yearStart + 1}"/>
                              <option>${yearStart}</option>
                           </c:forEach>
                        </select>
                        <input id="m_birthday" type="hidden" class="form-control" name="m_birthday" required data-eye> 
                        
                        <div class="form-group">
                           <div class="t-datepicker">
                              <div class="t-check-in t-picker-only"></div>
                           </div>
                        </div>
                        
                        <div id="locationField" class="form-group">
                           <label for="address">주소</label>
                           <input id="autocomplete" type="text" class="form-control" name="m_address">
                           <input class="field" id="lat" type="hidden" class="form-control" name="lat"/>
                           <input class="field" id="lng" type="hidden" class="form-control" name="lng"/>
                        </div>
                  
                         <div class="form-group">
                           <div class="custom-checkbox custom-control">
                              <input type="checkbox" name="agree" id="agree" class="custom-control-input">
                              <label for="agree" class="custom-control-label">사이트 가입 하시겠습니까? <a href="#">가입약관</a></label>
                              <div class="invalid-feedback">
                                 You must agree with our Terms and Conditions
                              </div>
                           </div>
                        </div> 

                        <div class="form-group m-0">
                           <button type="button" class="btn btn-primary btn-block" onclick="register(this.form)">
                              회원가입
                           </button>
                        </div>
                        <div class="mt-4 text-center">
                           사이트 회원이십니까? <a href="../../loginMember.do">로그인</a>
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