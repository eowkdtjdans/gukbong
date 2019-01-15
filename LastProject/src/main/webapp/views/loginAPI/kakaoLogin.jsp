 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>로그인</title>


<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

</head>



<body>

<a id="kakao-login-btn"></a>

<a href="http://developers.kakao.com/logout"></a>
 
 
<!-- Kakao Login -->

<script type="text/javascript">
      // 사용할 앱의 JavaScript 키를 설정해 주세요.
      Kakao.init('b1e43adeb3cee961d9cd07fd536a4f4b');
      // 카카오 로그인 버튼을 생성합니다.
      Kakao.Auth.createLoginButton({
        container: '#kakao-login-btn',
        success: function(authObj) {
          // 로그인 성공시, API를 호출합니다.
          Kakao.API.request({
        	  url: '/v1/user/me',
            success: function(res) {
            	var kakaoInfo = JSON.stringify(res.properties);
            	
            	var kakaoName = JSON.stringify(res.properties.nickname); 
            	var kakaoName2 = res.properties.nickname; 
            
            	var kakaoEmail = JSON.stringify(res.kaccount_email);
            	var kakaoEmail2 = res.kaccount_email;
            
            	sessionStorage.setItem("kakaoEmailSession", kakaoEmail2);
            	sessionStorage.setItem("kakaoNameSession", kakaoName2);
            	
           	 $("#m_id").val(kakaoEmail2);
           	checkAJax();

              
            },
            
          });
        },
        fail: function(err) {
          alert(JSON.stringify(err));
        }
      });

</script>

<script>
function checkAJax() {
	alert("체크에이잭스 펑션");
	//var str = $("#form").serialize();
	var str = $("#m_id").val();
	alert(str);
	$.ajax({
		async: true,
		type : 'POST',
		dataType : "json",
		data : str,
	    contentType: "application/json; charset=UTF-8",  
		url : '../../checkMemberJson.do',
		
		   success : function(data) {
 			alert(data.cnt);
 			if (data.cnt >= 1) {
				alert("사이트 이용 시 로그인을 해야 가능합니다.");
				location.href = "../../loginMember.do";
			} else if(data.cnt == 0) {
				alert("사이트 이용 시 회원가입을 해야 사용 가능합니다.");
				location.href = "../../kakaoCallback.do";
			} 
 		}
 	});
}
</script>
<form onsubmit="return false"method="POST" class="my-login-validation" id="form"  >
<div>
  <input id="m_id" type="text" class="form-control" name="m_id">
</div>
</form>
</body>
</html>