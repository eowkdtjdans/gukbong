<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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

function kakaoLogout() {
	 Kakao.init('b1e43adeb3cee961d9cd07fd536a4f4b');
	Kakao.Auth.logout(function() {
		setTimeout(function() {
			location.href="../sub2.do"}, 1000);
		});
	};
}
</script>

<input type="button"  value="카카오톡 로그아웃" onclick="kakaoLogout()"/>
</body>
</html>