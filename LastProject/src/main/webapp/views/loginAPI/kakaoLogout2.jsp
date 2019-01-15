<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>Custom Login Demo - Kakao JavaScript SDK</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>

<script>
		$(document).ready(function(){
			Kakao.init('b1e43adeb3cee961d9cd07fd536a4f4b');
			function getKakaotalkUserProfile(){
				Kakao.API.request({
					url: '/v1/user/me',
					success: function(res) {
						
						$("#kakao-profile").append(res.properties.nickname);
						$("#kakao-profile").append($("<img/>",{"src":res.properties.profile_image,"alt":res.properties.nickname+"님의 프로필 사진",}));
					},
					fail: function(error) {
						console.log(error);
					}
				});
			}
			function createKakaotalkLogin(){
				$("#kakao-logged-group .kakao-logout-btn,#kakao-logged-group .kakao-login-btn").remove();
				var loginBtn = $("<a/>",{"class":"kakao-login-btn","text":"로그인"});

	 			
				loginBtn.click(function(){

					Kakao.Auth.login({
						persistAccessToken: true,
						persistRefreshToken: true,
						success: function(authObj) {
							getKakaotalkUserProfile();
							createKakaotalkLogout();
						},
						fail: function(err) {
							console.log(err);
						}
					});
				});
				
				$("#kakao-logged-group").prepend(loginBtn)
	/* 			Kakao.Auth.setAccessToken(accessTokenFromServer); */
			}
			
			
			function createKakaotalkLogout(){
				$("#kakao-logged-group .kakao-logout-btn,#kakao-logged-group .kakao-login-btn").remove();
				var logoutBtn = $("<a/>",{"class":"kakao-logout-btn","text":"로그아웃"});
				var refreshToken = Kakao.Auth.getRefreshToken();
			
				logoutBtn.click(function(){
					alert("script");
					var refreshToken = Kakao.Auth.getRefreshToken();
					
					Kakao.Auth.logout(function(data){
						if(data == true) { 
							 Kakao.Auth.logout();
							//Kakao.Auth.setAccessToken(accessTokenFromServer);
						}
						else { alert("실패");}
					});
					
					createKakaotalkLogin();
					$("#kakao-profile").text("");
				});
		
				$("#kakao-logged-group").prepend(logoutBtn);
			}
			if(Kakao.Auth.getRefreshToken()!=undefined&&Kakao.Auth.getRefreshToken().replace(/ /gi,"")!=""){
				createKakaotalkLogout();
				getKakaotalkUserProfile();
			}else{
				createKakaotalkLogin();
			}
		});
	</script>

</head>
<body>
<%-- <form:form modelAttribute="memberVO" action="/member" method="post"> --%>
	<div id="kakao-logged-group"></div>
	<div id="kakao-profile"></div>
<%-- </form:form> --%>
</body>
</html>